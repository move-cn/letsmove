/*
/// Module: hello
module hello::hello;
*/
module hello::hello{
    //module 内容
    //import
    use std::string;
  //  use sui::object::{Self,UID};
 //   use sui::transfer;
  //  use sui::tx_context::{Self,TxContext};
    //types
    public struct HelloWorldObject has key,store{
        id:UID,
        text: string::String, //被object 包含的字符串
    }
    //functions
    public entry fun mint(ctx: &mut TxContext){
        let object = HelloWorldObject{
            id:object::new(ctx),
            text:string::utf8(b"hello world my name is secretgao all in web3"),
        };
        transfer::transfer(object,tx_context::sender(ctx));
    }

}

