module task3::nft {
    use std::string::{Self, String};
    use sui::object::{Self,UID, ID};
    use sui::tx_context::{TxContext, sender};

    const TOTAL_SUPPLY: u64 = 237u64;
    const URL: vector<u8> = b"https://avatars.githubusercontent.com/u/20042669?s=96&v=4";
    const DISCRIPTION: vector<u8> = b"twiagle nft";
    const ETooManyNums: u64 = 0;

    public struct TWIAGLENFT has key, store {
        id: UID,
        idx: u64,
        description: String,
        url: String,
    }

    public struct TwiagleNftCap has key, store {
        id: UID,
        cur_supply: u64
    }

    fun init(ctx: &mut TxContext) {
        let twiagle_nft_cap = TwiagleNftCap {
            id: object::new(ctx),
            cur_supply: 0
        };
        transfer::public_transfer(twiagle_nft_cap, sender(ctx));
    }

    public entry fun mint_nft(
        mint_cap: &mut TwiagleNftCap,
        ctx: &mut TxContext,
    ) {
        mint_cap.cur_supply = mint_cap.cur_supply + 1;
        let nft = TWIAGLENFT {
            id: object::new(ctx),
            idx: mint_cap.cur_supply,
            description: string::utf8(DISCRIPTION),
            url: string::utf8(URL)
        };
        assert!(mint_cap.cur_supply <= TOTAL_SUPPLY, ETooManyNums);
        transfer::public_transfer(nft, sender(ctx));
    }

    public entry fun transfer(nft: TWIAGLENFT, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient)
    }
}