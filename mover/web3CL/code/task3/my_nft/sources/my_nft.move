module my_nft::Testnft {
    use sui::package;
    use sui::display;
    use sui::url::{Self, Url};
    use std::string;
    use sui::event;

    // 模块的单例标记
    public struct TESTNFT has drop {}

    public struct TestNetNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    // ===== Events ===== 事件

    public struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    // ===== 初始化函数 =====

    fun init(witness: TESTNFT, ctx: &mut TxContext) {
        let keys = vector[
            string::utf8(b"name"),
            string::utf8(b"description"),
            string::utf8(b"image_url"),
        ];
        let values = vector[
            string::utf8(b"{name}"),
            string::utf8(b"{description}"),
            string::utf8(b"{url}"), // 假设 url 字段也用作图片 URL
        ];
        
        let publisher = package::claim(witness, ctx);
        let mut display = display::new_with_fields<TestNetNFT>(
            &publisher, keys, values, ctx
        );
        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    // ===== Public view functions ===== 公共视图函数

    public fun name(nft: &TestNetNFT): &string::String {
        &nft.name
    }

    public fun description(nft: &TestNetNFT): &string::String {
        &nft.description
    }

    public fun url(nft: &TestNetNFT): &Url {
        &nft.url
    }

    // ===== Entrypoints ===== 入口函数

    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = TestNetNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    public entry fun mint_to_someone(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        someone: address,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = TestNetNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, someone);
    }


    public entry fun transfer(
        nft: TestNetNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    public entry fun update_description(
        nft: &mut TestNetNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    public entry fun burn(nft: TestNetNFT, _: &mut TxContext) {
        let TestNetNFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }
}