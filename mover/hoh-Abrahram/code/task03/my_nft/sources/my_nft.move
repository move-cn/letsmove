module my_nft::my_nft;
use std::string;
use std::string::String;

// The creator bundle: these two packages often go together.
use sui::package;
use sui::display;

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

public struct Sleeper has key, store{
    id: UID,
    name: string::String,
    image_url: string::String,
}

/// One-Time-Witness for the module.
public struct MY_NFT has drop {}

/// Claim the `Publisher` object in the module initializer
/// to then create a `Display`. The `Display` is initialized with
/// a set of fields (but can be modified later) and published via
/// the `update_version` call.
///
/// Keys and values are set in the initializer but could also be
/// set after publishing if a `Publisher` object was created.
fun init(otw: MY_NFT, ctx: &mut TxContext) {
    let keys = vector[
        b"name".to_string(),
        b"link".to_string(),
        b"image_url".to_string(),
        b"description".to_string(),
        b"project_url".to_string(),
        b"creator".to_string(),
    ];

    let values = vector[
        // For `name` one can use the `Hero.name` property
        b"{name}".to_string(),
        // For `link` one can build a URL using an `id` property
        b"https://sui-heroes.io/hero/{id}".to_string(),
        // For `image_url` use an `image_url` property.
        b"{image_url}".to_string(),
        // Description is static for all `Hero` objects.
        b"A true Hero of the Sui ecosystem!".to_string(),
        // Project URL is usually static
        b"https://sui-heroes.io".to_string(),
        // Creator field can be any
        b"Unknown Sui Fan".to_string(),
    ];

    // Claim the `Publisher` for the package!
    let publisher = package::claim(otw, ctx);

    // Get a new `Display` object for the `Sleeper` type.
    let mut display = display::new_with_fields<Sleeper>(
        &publisher, keys, values, ctx
    );

    // Commit first version of `Display` to apply changes.‘
    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
}

public entry fun mint(name:String,image_url:String,to:address,ctx: &mut TxContext){
    let sleeper = Sleeper{
        id:object::new(ctx),
        name,
        image_url
    };
    transfer::public_transfer(sleeper, to);
}


