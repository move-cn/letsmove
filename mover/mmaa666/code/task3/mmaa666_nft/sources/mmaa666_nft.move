/*
/// Module: mmaa666_nft
module mmaa666_nft::mmaa666_nft;
*/
module mmaa666_nft::mmaa666_nft;
use std::string::String;
use std::string;
use sui::transfer::transfer;
use sui::tx_context::sender;

public struct MMAA666NFT has key
    {
        id:UID,
        name: String,
        image_url: String,
    
    }


fun init(ctx: &mut TxContext) 
    {

        let mmaa666_nft = MMAA666NFT
        {
            id:object::new(ctx),
            name:string::utf8(b"MMVV666 NFT"),
            image_url: string::utf8(b"https://avatars.githubusercontent.com/u/183964006?s=400&u=77deb2250e988591d6f9c62bb4d6c2045fa63b8d&v=4"),
        };
        transfer(mmaa666_nft,sender(ctx));
    }

public entry fun mint(url:String,ctx: &mut TxContext,)
    {
        let mmaa666_nft = MMAA666NFT 
        {
            id:object::new(ctx),
            name:string::utf8(b"MMVV666 NFT"),
            image_url: url
        };
        transfer(mmaa666_nft,sender(ctx));
    }
public entry fun transfer_nft(nft: MMAA666NFT, to: address)
    {
        transfer(nft, to);
    }
