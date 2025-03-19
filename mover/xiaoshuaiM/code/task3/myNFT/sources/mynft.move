module mynft::mintNFT {
    use std::string;
    use std::string::String;
    use sui::transfer::transfer;
    use sui::tx_context::sender;

    public struct MyNFT has key, store {
        id: UID,
        name: String,
        url: String,
    }

    fun init(ctx: &mut TxContext) {
        let myNft = MyNFT {
            id: object::new(ctx),
            name: string::utf8(b"MyNFT"),
            url: string::utf8(
                b"https://avatars.githubusercontent.com/u/200202346?s=400&u=0bf2998d9aa3fbc7db0ef75b0ce17540049dddb1&v=4"
            ),
        };
        transfer(myNft, sender(ctx))
    }

    public entry fun myMint(url: String, ctx: &mut TxContext) {
        let myNft = MyNFT {
            id: object::new(ctx),
            name: string::utf8(b"MyNFT"),
            url: url
        };
        transfer(myNft, sender(ctx))
    }

    public entry fun transer_nft(nft: MyNFT, to: address) {
        transfer::public_transfer(nft, to);
    }
}