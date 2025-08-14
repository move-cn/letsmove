/// Module: lihuazhang_nft
module lihuazhang_nft::lihuazhang_nft {
    use std::string::{utf8, String};
    use sui::package;
    use sui::display;
    
    /// OTW
    public struct LIHUAZHANG_NFT has drop {}

    /// Hero结构体 - 用以代表数字藏品
    public struct GithubAvatarNFT has key, store {
        id: UID,
        name: String,
        github_id: String,
        img_url: String,
    }

    public struct GithubAvatarNFTIssuerCap has key {
        id: UID,
        supply: u64,
        issued_counter: u64,
    }
    const MAX_SUPPLY: u64 = 1000;
    const ETooManyNums: u64 = 0;


    fun init(otw: LIHUAZHANG_NFT, ctx: &mut TxContext) {

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
            utf8(b"https://github.com/{github_id}"),
            utf8(b"{img_url}"),
            utf8(b"My Github Avatar NFT"),
            utf8(b"https://github.com/lihuazhang/letsmove"),
            utf8(b"Sui Move Beginner")
        ];

         // 为整个包创建`Publisher`对象
        let publisher = package::claim(otw, ctx);

        // 为`GithubAvatarNFT`类型创建`Display` 对象
        let mut display = display::new_with_fields<GithubAvatarNFT>(
            &publisher, keys, values, ctx
        );

        // 提交第一个版本`Display`
        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));

        let issuer_cap = GithubAvatarNFTIssuerCap {
            id: object::new(ctx),
            supply: 0,
            issued_counter: 0,
        };
        transfer::transfer(issuer_cap, tx_context::sender(ctx))
    }

     /// 任何人都可以创建`GithubAvatarNFT`
    public fun mint(cap: &mut GithubAvatarNFTIssuerCap, name: String, github_id: String, img_url: String, recipient: address, ctx: &mut TxContext) {
        let n = cap.issued_counter;
        cap.issued_counter = n + 1;
        cap.supply = cap.supply + 1;
        assert!(cap.supply <= MAX_SUPPLY, ETooManyNums);

        let id = object::new(ctx);
        let nft = GithubAvatarNFT { id, name, github_id, img_url };
        transfer::transfer(nft, recipient);
    }

    public fun burn(cap: &mut GithubAvatarNFTIssuerCap, nft: GithubAvatarNFT) {
        let GithubAvatarNFT { id, name:_, github_id:_, img_url: _ } = nft;
        cap.supply = cap.supply - 1;
        object::delete(id);
    }
}

