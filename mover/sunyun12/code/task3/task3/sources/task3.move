module task3::task3;{
    use std::string;
    use sui::tx_context::{sender};
    use std::string::{utf8, String};
    use sui::package;
    use sui::display;

    public struct MyNFT has key, store {
        id: UID,
        name: String,
        image_url: String,
    }

    public struct MY_NFT has drop {}


    fun init(otw: MY_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"link"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"project_url"),
            utf8(b"creator"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"https://sui-heroes.io/hero/{id}"),
            utf8(b"{image_url}"),
            utf8(b"A true Hero of the Sui ecosystem!"),
            utf8(b"https://sui-heroes.io"),
            utf8(b"Unknown Sui Fan")
        ];

        let publisher = package::claim(otw, ctx);

        let mut display = display::new_with_fields<MyNFT>(
            &publisher, keys, values, ctx
        );

        display::update_version(&mut display);

        transfer::public_transfer(publisher, sender(ctx));
        transfer::public_transfer(display, sender(ctx));


        let nft = MyNFT {
            id: object::new(ctx),
            name: string::utf8(b"sunyun12 NFT"),
            image_url: string::utf8(
                b"https://s1.aigei.com/src/img/png/2c/2c4d5b8dbda34062b22d46365b573bda.png?imageMogr2/auto-orient/thumbnail/!282x282r/gravity/Center/crop/282x282/quality/85/%7CimageView2/2/w/282&e=2051020800&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:eU088z6GP5H7T9Ic_kuK354spBI="
            ),
        };
        transfer::public_transfer(nft, sender(ctx));
    }


    public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
        let id = object::new(ctx);
        let nft = MyNFT { id, name, image_url };
        transfer::public_transfer(nft, sender(ctx));
    }


