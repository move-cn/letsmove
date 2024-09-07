## 我用的rust进行 bcs 与 sha3_256

```rust
use sha3::{Digest, Sha3_256};
use bcs; // Assuming you have a BCS library

fn compute_bcs_hash(flag_str: &str, github_id: &str) -> Vec<u8> {
    // Step 1: Convert flag_str to BCS bytes
    let mut bcs_flag = bcs::to_bytes(&flag_str).unwrap();

    // Step 2: Append github_id as bytes to bcs_flag
    bcs_flag.extend(github_id.as_bytes());

    // Step 3: Create a new SHA3-256 hasher
    let mut hasher = Sha3_256::new();

    // Step 4: Update the hasher with the BCS flag bytes
    hasher.update(&bcs_flag);


    // Step 5: Finalize the hash and return the result
    let result = hasher.finalize();
    result.to_vec() // Convert the result to a Vec<u8>
}

fn main() {
    // Example usage
    let flag_str = "D5.{M5f2";
    let github_id = "fantasy-move";

    let hash_result = compute_bcs_hash(flag_str, github_id);
    println!("Hash result: {:?}", hash_result);
}

```

```toml
[package]
name = "check_in"
version = "0.1.0"
edition = "2021"

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

[dependencies]
sha3 = "0.10"
bcs = "0.1.3"
```
## 合约交互我用的ts
```ts
import { bcs } from '@mysten/sui/bcs';
import { Transaction } from '@mysten/sui/transactions';
import { suiClient, signer } from '../untils/sui-elements';
async function customContractTransaction() {

    /** 输入合约调用相关信息 **/
    const pkgId = '0x914099b4d1b4f5513acc8aaa4fdc1f67578522b81d818f61bae527d590c6d87d'; // 合约包ID
    const moduleName = 'check_in'; // 合约模块名
    const funcName = 'get_flag'; // 方法名

    /** 组织交易数据 **/
    const tx = new Transaction();
    // const target = `${pkgId}::${moduleName}::${funcName}`;
    tx.setGasBudget(100000000)
    tx.moveCall({
        target: `${pkgId}::${moduleName}::${funcName}`,

        arguments: [tx.pure(bcs.vector(bcs.U8).serialize([73, 249, 99, 228, 165, 247, 78, 245, 194, 121, 66, 250, 9, 
            199, 180, 119, 222, 182, 17, 213, 45, 42, 211, 199, 237, 177, 206, 9, 77, 168, 76, 147])), 
        tx.pure.string('fantasy-move'), 
        tx.object('0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147'),
        tx.object('0x8')]
    });

    /** 发起交易 **/
    const result = await suiClient.signAndExecuteTransaction({
        signer,
        transaction: tx,
    });
    return result;
}

customContractTransaction().then(console.log).catch(console.error);

```
