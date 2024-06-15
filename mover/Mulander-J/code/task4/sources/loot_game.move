module task4::loot_game {
    use std::debug;
    use std::string::{Self, String, utf8};    
    use sui::url::{Self, Url};
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::coin::{TreasuryCap};
    use task2::mulander_faucet::{Self, MULANDER_FAUCET};

    // ===== Global constants =====

    const AuthorTag: vector<u8> = b"Made by @Mulander-J";
    const LoserBonus: u64 = 5_000_000;
    const WinnerBonus: u64 = LoserBonus * 2;

    // ===== NFT struct =====

    public struct LOOT_GAME has key, store {
        id: UID,
        /// Name for the token
        name: String,
        /// Description of the token
        description: String,
        /// URL for the token
        url: Url,
        /// traits for the token
        traits: vector<String>,
        ///  Point for the token
        point: u64,
        /// The no of NFT
        no: u64,
    }
    
    // ===== Event structs =====
    public struct EventNFTMinted has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The no of the NFT
        no: u64
    }
    public struct EventGameOutCome has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The value of player
        player_val: u64,
        // The value of machine
        machine_val: u64, 
        // The outcome of battle
        outcome: String
    }

    // ===== Public view functions =====

    /// Get the NFT's `name`
    public fun name(nft: &LOOT_GAME): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &LOOT_GAME): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &LOOT_GAME): &Url {
        &nft.url
    }

    /// Get the NFT's `traits`
    public fun traits(nft: &LOOT_GAME): &vector<String> {
        &nft.traits
    }

    /// Get the NFT's `point`
    public fun point(nft: &LOOT_GAME): &u64 {
        &nft.point
    }

    /// Get the NFT's `no`
    public fun no(nft: &LOOT_GAME): &u64 {
        &nft.no
    }

    // ===== Module Funcs =====
    fun trait1 ():vector<String> {
        vector[
            utf8(b"Aristotle"),
            utf8(b"Beethoven"),
            utf8(b"Einstein"),
            utf8(b"Leonardo"),
            utf8(b"Shakespeare"),
        ]
    }
    fun trait2 ():vector<String> {
        vector[
            utf8(b"Metal"),
            utf8(b"Wood"),
            utf8(b"Water"),
            utf8(b"Fire"),
            utf8(b"Earth"),
        ]
    }
    fun trait3 ():vector<String> {
        vector[
            utf8(b"Iron"),
            utf8(b"Gold"),
            utf8(b"Platinum"),
            utf8(b"Diamond"),
        ]
    }
    fun uint_to_string(num: u256): String {
        let mut res: vector<u8> = vector::empty();
        let mut t:u256 = 10;
        loop {
            let n1 = num / t;
            if (t == 10) {
                let ten = num % 10;
                res.push_back((48 + ten) as u8);
            };
            if (n1 <= 0) break;
            let n2 = n1 % 10;
            t = t * t;
            res.push_back((48 + n2) as u8);
        };
        res.reverse();
        utf8(res)
    }
    fun svg_url (traits: &vector<String>): Url {
        let mut str = utf8(b"data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'%3E%3Cstyle%3E.base { fill: white; font-family: serif; font-size: 14px; }%3C/style%3E%3Crect width='100%' height='100%' fill='black'/%3E");
        let size = vector::length(traits);
        let mut i = 0;
        loop {
            if (i >= size) break;
            let mut text = utf8(b"%3Ctext x='10' y='");            
            string::append(&mut text, uint_to_string((20*(i+1)) as u256));
            string::append(&mut text, utf8(b"' class='base'%3E"));
            string::append(&mut text, traits[i]);
            string::append(&mut text, utf8(b"%3C/text%3E"));
            string::append(&mut str, text);
            i = i + 1;
        };
        string::append(&mut str, utf8(b"%3C/svg%3E"));

        url::new_unsafe_from_bytes(*string::bytes(&str))
    }
    fun get_random_range(clock: &Clock, range: u64) : u64 {
        ((clock::timestamp_ms(clock) % range) as u64)
    }
    fun random_nft(nft: &mut LOOT_GAME, clock: &Clock) {
        let (t1, t2, t3) = (
            trait1(),
            trait2(),
            trait3()
        );
        let (len1, len2, len3) = (
            vector::length(&t1),
            vector::length(&t2),
            vector::length(&t3),
        );
        let (r1, r2, r3) = (
            get_random_range(clock, len1),
            get_random_range(clock, len2),
            get_random_range(clock, len3),
        );

        nft.no = (r1*len2*len3) + (r2*len3) + (r3+1);
        nft.traits = vector[t1[r1], t2[r2], t3[r3]];        
        nft.url = svg_url(&vector[t1[r1], t2[r2], t3[r3], utf8(AuthorTag)]);
        debug::print(&nft.url);
    }


    // ===== Entrypoints =====

    // Mint a new nft
    public entry fun mint(clock: &Clock, ctx: &mut TxContext) {        
        let sender = tx_context::sender(ctx);

        let mut nft = LOOT_GAME {
            id: object::new(ctx),
            name: string::utf8(b"Log2"),
            description: string::utf8(b"Player Card NFT for Loot Game"),
            url: url::new_unsafe_from_bytes(b""),
            traits: vector::empty(),
            point: 0,
            no: 0,
        };

        random_nft(&mut nft, clock);

        event::emit(EventNFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            no: nft.no,
        });

        transfer::public_transfer(nft, sender);
    }

    /// Start a battle in random
    public entry fun battle(
        treasury_cap: &mut TreasuryCap<MULANDER_FAUCET>,
        nft: &mut LOOT_GAME,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        let mut outcome = string::utf8(b"Draw");
        let bot = get_random_range(clock, 100);
        if (bot < nft.no) {
            outcome = utf8(b"You win");
            nft.point = nft.point + 1;
            mulander_faucet::mint(treasury_cap, WinnerBonus, tx_context::sender(ctx), ctx);
        } else if (bot > nft.no) {
            outcome = utf8(b"You lose");
            if (nft.point > 0) {
                nft.point = nft.point - 1;
            };
            mulander_faucet::mint(treasury_cap, LoserBonus, tx_context::sender(ctx), ctx);
        };

        event::emit(EventGameOutCome {
            object_id: object::id(nft),
            player_val: nft.no,
            machine_val: bot,
            outcome,
        });
    }

    /// Update `traits` & `no` for this nft
    public entry fun magic_finger(
        nft: &mut LOOT_GAME, clock: &Clock, _: &mut TxContext
    ) {
        random_nft(nft, clock)
    }

    /// Transfer `nft` to `recipient`
    public fun transfer(
        nft: LOOT_GAME, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// Permanently delete `nft`
    public fun burn(nft: LOOT_GAME, _: &mut TxContext) {
        let LOOT_GAME { id, name: _, description: _, url: _, traits: _, point: _, no: _, } = nft;
        object::delete(id)
    }
}

#[test_only]
module task4::loot_game_tests {
    use task4::loot_game::{Self, LOOT_GAME};
    use sui::test_scenario as ts;
    use sui::clock::{Self};
    use task2::mulander_faucet::{Self, MULANDER_FAUCET};

    #[test]
    fun mint_transfer_update() {
        let addr1 = @0xA;
        let addr2 = @0xB;
        // create the NFT
        let mut scenario = ts::begin(addr1);
        {
            let ctx = ts::ctx(&mut scenario);
            let mut clock = clock::create_for_testing(ctx);
            clock::set_for_testing(&mut clock, 54);
            // assert!(clock::timestamp_ms(&clock) == 52, 1);
            loot_game::mint(&clock, ctx);
            clock::destroy_for_testing(clock);
        };
        // send it from A to B
        ts::next_tx(&mut scenario, addr1);
        {
            let nft = ts::take_from_sender<LOOT_GAME>(&scenario);
            transfer::public_transfer(nft, addr2);
        };
        // update its description
        // ts::next_tx(&mut scenario, addr2);
        // {
        //     let mut nft = ts::take_from_sender<LOOT_GAME>(&scenario);
        //     let ctx = ts::ctx(&mut scenario);
        //     let mut clock = clock::create_for_testing(ctx);
        //     clock::set_for_testing(&mut clock, 99);
        //     // let faucet_coin = mulander_faucet::mint(,10_000_000_000,addr2, ctx);
        //     loot_game::battle(&mut nft, &clock, ctx);
        //     clock::destroy_for_testing(clock);
        //     ts::return_to_sender(&scenario, nft);
        // };
        // magic it
        ts::next_tx(&mut scenario, addr2);
        {
            let mut nft = ts::take_from_sender<LOOT_GAME>(&scenario);
            let ctx = ts::ctx(&mut scenario);
            let mut clock = clock::create_for_testing(ctx);
            clock::set_for_testing(&mut clock, 99);
            loot_game::magic_finger(&mut nft, &clock, ctx);
            clock::destroy_for_testing(clock);
            ts::return_to_sender(&scenario, nft);
        };
        ts::end(scenario);
    }
}