module nft_author::nft_author;
use std::string::{String};
use sui::package;
use sui::display;

public struct NFT_AUTHOR has drop { }

public struct Author has key{
    id : UID,
    name : String,
    image_url : String,
}

fun init(otw : NFT_AUTHOR,ctx : &mut TxContext ){

    let keys = vector[
        b"name".to_string(),
        b"link".to_string(),
        b"image_url".to_string(),
        b"description".to_string(),
        b"project_url".to_string(),
        b"creator".to_string(),
    ];

    let values = vector[
        // For `name` one can use the `Author.name` property
        b"{name}".to_string(),
        // For `link` one can build a URL using an `name` property
        b"https://github.com/{name}".to_string(),
        //image url
        b"{image_url}".to_string(),
        //description:
        b"simple nft with the image icon from github user ".to_string(),
        // project url
        b"https://github.com/{name}/letsmove".to_string(),
        // Creator field can be any
        b"charles j lee".to_string(),
    ];


    let  publisher = package::claim(otw,ctx);

    let mut display = display::new_with_fields<Author>(&publisher,keys,values,ctx);
    display.update_version();

    transfer::public_transfer(publisher,ctx.sender());
    transfer::public_transfer(display , ctx.sender());

}


public entry fun mint(name :String,image_url:String,to : address, ctx : &mut TxContext) {

    let author = Author{
        id : object::new(ctx),
        name : name ,
        image_url: image_url,
    };

    transfer::transfer(author,to);
}