use std::env;
use std::error::Error;
use std::fmt;
use std::io::{Read, Write};
use std::mem::drop;
use std::net::{TcpListener, TcpStream};
use std::path::Path;

use tokio;

use move_transactional_test_runner::framework::{MaybeNamedCompiledModule, MoveTestAdapter};
use move_bytecode_source_map::{source_map::SourceMap, utils::source_map_from_file};
use move_binary_format::file_format::CompiledModule;
use move_symbol_pool::Symbol;
use move_core_types::{
    u256::U256,
    account_address::AccountAddress, 
    language_storage::TypeTag,
    runtime_value::MoveValue
};
use sui_types::base_types::SuiAddress;

use sui_ctf_framework::NumericalAddress;
use sui_transactional_test_runner::{args::SuiValue, test_adapter::FakeID};

async fn handle_client(mut stream: TcpStream) -> Result<(), Box<dyn Error>> {

    // Initialize SuiTestAdapter
    let modules = vec!["Otter"];
    let mut deployed_modules: Vec<AccountAddress> = Vec::new();

    let named_addresses = vec![
        (
            "challenge".to_string(),
            NumericalAddress::parse_str(
                "0x0", 
            )?,
        ),
        (
            "solve".to_string(),
            NumericalAddress::parse_str(
                "0x0",
            )?,
        ),
        (
            "admin".to_string(),
            NumericalAddress::parse_str(
                "0xfccc9a421bbb13c1a66a1aa98f0ad75029ede94857779c6915b44f94068b921e",
            )?,
        ),
    ];

    let mut adapter = sui_ctf_framework::initialize(
        named_addresses,
        Some(vec!["challenger".to_string(), "solver".to_string()]),
    ).await;

    // Check Admin Account
    let object_output1 = sui_ctf_framework::view_object(&mut adapter, FakeID::Enumerated(0, 0)).await;
    println!("Object Output: {:#?}", object_output1);

    let mut mncp_modules : Vec<MaybeNamedCompiledModule> = Vec::new();

    for i in 0..modules.len() {

        let module = &modules[i];

        let mod_path = format!("./chall/build/challenge/bytecode_modules/{}.mv", module);
        let src_path = format!("./chall/build/challenge/source_maps/{}.mvsm", module);
        let mod_bytes: Vec<u8> = std::fs::read(mod_path)?;

        let module: CompiledModule = match CompiledModule::deserialize_with_defaults(&mod_bytes) {
            Ok(data) => data,
            Err(e) => {
                return Err(Box::new(e))
            }
        }; 
        let named_addr_opt: Option<Symbol> = Some(Symbol::from("challenge"));
        let source_map: Option<SourceMap> = match source_map_from_file(Path::new(&src_path)) {
            Ok(data) => Some(data),
            Err(e) => {
                let _ = adapter.cleanup_resources().await;
                println!("error: {:?}, src_path: {}", e, src_path);
                return Err("error when generating source map".into())
            }
        };

        let maybe_ncm = MaybeNamedCompiledModule {
            named_address: named_addr_opt,
            module,
            source_map,
        };

        mncp_modules.push( maybe_ncm );
    }

    // Publish Challenge Module
    let chall_dependencies: Vec<String> = Vec::new();
    let chall_addr = sui_ctf_framework::publish_compiled_module(
        &mut adapter,
        mncp_modules,
        chall_dependencies,
        Some(String::from("challenger")),
    ).await;
    deployed_modules.push(chall_addr);
    println!("[SERVER] Module published at: {:?}", chall_addr); 

    let mut solution_data = [0 as u8; 2000];
    let _solution_size = stream.read(&mut solution_data)?;

    // Send Challenge Address
    let mut output = String::new();
    fmt::write(
        &mut output,
        format_args!(
            "[SERVER] Challenge modules published at: {}",
            chall_addr.to_string().as_str(),
        ),
    )
    .unwrap();
    stream.write(output.as_bytes()).unwrap();

    // Publish Solution Module
    let mut sol_dependencies: Vec<String> = Vec::new();
    sol_dependencies.push(String::from("challenge"));

    let mut mncp_solution : Vec<MaybeNamedCompiledModule> = Vec::new();
    let module: CompiledModule = match CompiledModule::deserialize_with_defaults(&solution_data.to_vec()) {
        Ok(data) => data,
        Err(e) => {
            let _ = adapter.cleanup_resources().await;
            return Err(Box::new(e))
        }
    }; 
    let named_addr_opt: Option<Symbol> = Some(Symbol::from("solve"));
    let source_map : Option<SourceMap> = None;
    
    let maybe_ncm = MaybeNamedCompiledModule {
        named_address: named_addr_opt,
        module,
        source_map,
    }; 
    mncp_solution.push( maybe_ncm );

    let sol_addr = sui_ctf_framework::publish_compiled_module(
        &mut adapter,
        mncp_solution,
        sol_dependencies,
        Some(String::from("solver")),
    ).await;
    println!("[SERVER] Solution published at: {:?}", sol_addr);

    // Send Solution Address
    output = String::new();
    fmt::write(
        &mut output,
        format_args!(
            "[SERVER] Solution published at {}",
            sol_addr.to_string().as_str()
        ),
    )
    .unwrap();
    stream.write(output.as_bytes()).unwrap();

    // Prepare Function Call Arguments
    let mut args_reg: Vec<SuiValue> = Vec::new();
    let supply = SuiValue::Object(FakeID::Enumerated(2, 1), None); 
    let questboard = SuiValue::Object(FakeID::Enumerated(2, 2), None);
    let player_addr = SuiValue::MoveValue(MoveValue::Address(adapter.compiled_state().resolve_named_address("solver")));
    args_reg.push(supply.clone());
    args_reg.push(questboard.clone());
    args_reg.push(player_addr.clone());

    let type_args: Vec<TypeTag> = Vec::new();

    // Call Add Liquidity Function
    let ret_val = match sui_ctf_framework::call_function(
        &mut adapter,
        chall_addr,
        "Otter",
        "register",
        args_reg,
        type_args,
        Some("challenger".to_string()),
    ).await {
        Ok(output) => output,
        Err(e) => {
            let _ = adapter.cleanup_resources().await;
            println!("[SERVER] error: {e}");
            return Err("error during call to Otter::register".into())
        }
    };
    println!("[SERVER] Return value {:#?}", ret_val);
    println!("");

    // Prepare Function Call Arguments
    let mut u256_bytes = U256::from(8_u64).to_le_bytes().to_vec();
    u256_bytes.reverse();
    let address: SuiAddress = SuiAddress::from_bytes(&u256_bytes).unwrap();
    let random = SuiValue::ImmShared(FakeID::Known(address.into()), None);
    let mut args_solve: Vec<SuiValue> = Vec::new();
    let player = SuiValue::Object(FakeID::Enumerated(4, 0), None); 
    let vault = SuiValue::Object(FakeID::Enumerated(2, 3), None);
    args_solve.push(vault.clone());
    args_solve.push(questboard.clone());
    args_solve.push(player.clone());
    args_solve.push(random.clone());

    let type_args_solve: Vec<TypeTag> = Vec::new();

    // Call solve Function
    let ret_val = match sui_ctf_framework::call_function(
        &mut adapter,
        sol_addr,
        "solve",
        "solve",
        args_solve,
        type_args_solve,
        Some("solver".to_string()),
    ).await {
        Ok(output) => output,
        Err(e) => {
            let _ = adapter.cleanup_resources().await;
            println!("[SERVER] error: {e}");
            return Err("error during call to solve::solve".into())
        }
    };
    println!("[SERVER] Return value {:#?}", ret_val);
    println!("");

    // Check Solution
    let mut args_check: Vec<SuiValue> = Vec::new();
    args_check.push(questboard.clone());
    args_check.push(player_addr.clone());

    let type_args_check: Vec<TypeTag> = Vec::new();

    let sol_ret = sui_ctf_framework::call_function(
        &mut adapter,
        chall_addr,
        "Otter",
        "check_winner",
        args_check,
        type_args_check,
        Some("solver".to_string()),
    ).await;
    println!("[SERVER] Return value {:#?}", sol_ret);
    println!("");

    // Validate Solution
    match sol_ret {
        Ok(_) => {
            println!("[SERVER] Correct Solution!");
            println!("");
            if let Ok(flag) = env::var("FLAG") {
                let message = format!("[SERVER] Congrats, flag: {}", flag);
                stream.write(message.as_bytes()).unwrap();
            } else {
                stream.write("[SERVER] Flag not found, please contact admin".as_bytes()).unwrap();
            }
        }
        Err(_) => {
            println!("[SERVER] Invalid Solution!");
            println!("");
            stream.write("[SERVER] Invalid Solution!".as_bytes()).unwrap();
        }
    };

    let _ = adapter.cleanup_resources().await;
    Ok(())
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    // Create Socket - Port 31337
    let listener = TcpListener::bind("0.0.0.0:31337")?;
    println!("[SERVER] Starting server at port 31337!");

    let local = tokio::task::LocalSet::new();

    // Wait For Incoming Solution
    for stream in listener.incoming() {
        match stream {
            Ok(stream) => {
                println!("[SERVER] New connection: {}", stream.peer_addr()?);
                    let result = local.run_until( async move {
                        tokio::task::spawn_local( async {
                            handle_client(stream).await
                        }).await
                    }).await;
                    println!("[SERVER] Result: {:?}", result);
            }
            Err(e) => {
                println!("[SERVER] Error: {}", e);
            }
        }
    }

    // Close Socket Server
    drop(listener);
    Ok(())
}
