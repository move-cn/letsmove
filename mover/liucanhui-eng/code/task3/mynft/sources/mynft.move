module task3::mynft;
use std::string;
use std::string::String;
use sui::transfer::{transfer};

public struct NFT has key {
    id: UID,
    name : String,
    link: String,
    image_url: String,
    description: String,
}
//
// fun init(ctx : &mut TxContext){
//     let myNft2 = NFT{
//         id: object::new(ctx),
//         name : string::utf8(b"MY NFT2"),
//         link: string::utf8(b"https://images.pexels.com/photos/2174974/pexels-photo-2174974.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
//         image_url : string::utf8(b"https://images.pexels.com/photos/2174974/pexels-photo-2174974.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
//         description :string::utf8(b"MY NFT"),
//     };
//     transfer(myNft2,ctx.sender())
// }


public entry fun mint_nft(reveiver : address,name:string::String ,image_url:string::String,description :string::String,ctx : &mut TxContext){
    let myNft2 = NFT{
        id: object::new(ctx),
        name,
        link: image_url,
        image_url,
        description,
    };
    transfer(myNft2,reveiver)
}