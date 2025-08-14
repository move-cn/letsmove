
module my_nft::my_nft {
    use std::string::{String, utf8};
    use sui::package;
    use sui::display;

    public struct CourseInfo has key, store {
        id: UID,
        name: String,
        image_url: String,
        time: u64,
    }

    public struct MY_NFT has drop {}

    fun init(otw: MY_NFT, ctx: &mut TxContext) { 
        let key:vector<String> = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"creator"),
            utf8(b"project_url"),
        ];

        let values:vector<String> = vector[
            utf8(b"{name} Course Series"),
            utf8(b"{image_url}"),
            utf8(b"welcome to the {name} course series,it costs {time} hours to complete!"),
            utf8(b"cuijiawei123"),
            utf8(b"https://github.com/cuijiawei123/letsmove"),
        ];

        let publisher: sui::package::Publisher = package::claim(otw,ctx);

        let mut display: sui::display::Display<my_nft::my_nft::CourseInfo> = display::new_with_fields(&publisher, key, values, ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, ctx.sender());
        transfer::public_transfer(display, ctx.sender());
    }

    public entry fun mint(name: String, image_url:String, time: u64, receipt: address, ctx: &mut TxContext){
        let id: sui::object::UID = object::new(ctx);
        let course: my_nft::my_nft::CourseInfo = CourseInfo{id, name, image_url, time};
        transfer::transfer(course, receipt)
    }



}