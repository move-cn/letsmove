/// Module: fantasyni_game
/// 一元夺宝
module fantasyni_game::fantasyni_game {
    use std::vector;
    use sui::address;
    use sui::bcs::{Self};
    use sui::event::emit;
    use sui::hash::blake2b256;
    use sui::coin::{Self, Coin};
    use sui::object::{Self, UID, ID};
    use sui::clock::{Self, Clock};
    use sui::balance::{Self, Balance};
    use oracle::weather::{WeatherOracle};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer::{share_object, public_transfer};

    const ENumberZERO: u64 = 0;
    const ECoinAmountInvalid: u64 = 1;
    const EHuntEnded: u64 = 2;
    const EHasInsertedCoin: u64 = 3;
    const EGameStateInvalid: u64 = 4;
    const ETicketForIdNotValid: u64 = 5;

    struct CoinKey<phantom CoinType> has store {

    }

    struct OneCoinTreasureHunt<phantom CoinType> has key {
        id: UID,
        custody: Balance<CoinType>,
        addresses: vector<address>,
        hunt_number: u64
    }

    struct HuntEvent has copy, drop {
        hunt_index: u64,
        hunt_address: address,
        hunt_balance: u64
    }

    struct HuntTicket {
        for: ID,
        open_hunt: bool,
    }

    public entry fun new_game<CoinType>(hunt_number: u64, ctx: &mut TxContext) {
        assert!(hunt_number > 0, ENumberZERO);

        let game = OneCoinTreasureHunt {
            id: object::new(ctx),
            custody: balance::zero<CoinType>(),
            addresses: vector[],
            hunt_number
        };

        share_object(game);
    }

    public fun insert_coin<CoinType>(
        game: &mut OneCoinTreasureHunt<CoinType>,
        coin: Coin<CoinType>,
        ctx: &mut TxContext
    ): (HuntTicket, bool) {
        assert!(coin::value(&coin) == 1000_000_00, ECoinAmountInvalid);
        assert!(game.hunt_number > 0, EHuntEnded);
        assert!(!vector::contains(&game.addresses, &tx_context::sender(ctx)), EHasInsertedCoin);

        balance::join(&mut game.custody, coin::into_balance(coin));
        vector::push_back(&mut game.addresses, tx_context::sender(ctx));
        game.hunt_number = game.hunt_number - 1;

        let open_hunt = game.hunt_number == 0;
        (HuntTicket {
            for: object::uid_to_inner(&game.id),
            open_hunt
        }, open_hunt)
    }

    public fun open_ticket_end<CoinType>(
        ticket: HuntTicket,
        game: OneCoinTreasureHunt<CoinType>,
        weather_oracle: &WeatherOracle,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        assert!(ticket.open_hunt == true, EGameStateInvalid);
        assert!(ticket.for == object::uid_to_inner(&game.id), ETicketForIdNotValid);

        let HuntTicket { for: _, open_hunt: _ } = ticket;

        let OneCoinTreasureHunt {id, custody, addresses, hunt_number: _} = game;
        object::delete(id);

        let hunt_index = get_random(weather_oracle,vector::length(&addresses), clock, ctx);
        let hunt_address = *vector::borrow(&addresses, hunt_index);
        let hunt_balance = balance::value(&custody);

        public_transfer(coin::from_balance(custody, ctx), hunt_address);
        emit(HuntEvent {
            hunt_index,
            hunt_address,
            hunt_balance
        });
    }

    public fun open_ticket_normal(
        ticket: HuntTicket,
    ) {
        assert!(ticket.open_hunt == false, EGameStateInvalid);
        let HuntTicket { for: _, open_hunt: _ } = ticket;
    }

    fun u32_to_ascii(num: u32): vector<u8>
    {
        if (num == 0) {
            return b"0"
        };
        let bytes = vector::empty<u8>();
        while (num > 0) {
            let remainder = num % 10; // get the last digit
            num = num / 10; // remove the last digit
            vector::push_back(&mut bytes, (remainder as u8) + 48); // ASCII value of 0 is 48
        };
        vector::reverse(&mut bytes);
        return bytes
    }

    fun u64_to_ascii(num: u64): vector<u8>
    {
        if (num == 0) {
            return b"0"
        };
        let bytes = vector::empty<u8>();
        while (num > 0) {
            let remainder = num % 10; // get the last digit
            num = num / 10; // remove the last digit
            vector::push_back(&mut bytes, (remainder as u8) + 48); // ASCII value of 0 is 48
        };
        vector::reverse(&mut bytes);
        return bytes
    }

    fun get_random(weather_oracle: &WeatherOracle, max: u64, clock: &Clock, ctx: &TxContext): u64 {
        let sender = tx_context::sender(ctx);
        let tx_digest = tx_context::digest(ctx);
        let random_pressure_p = oracle::weather::city_weather_oracle_pressure(weather_oracle, 2988507);
        let random_pressure_l = oracle::weather::city_weather_oracle_pressure(weather_oracle, 88319);

        let random_vector = vector::empty<u8>();
        vector::append(&mut random_vector, address::to_bytes(copy sender));
        vector::append(&mut random_vector, u32_to_ascii(random_pressure_p));
        vector::append(&mut random_vector, u32_to_ascii(random_pressure_l));
        vector::append(&mut random_vector, u64_to_ascii(clock::timestamp_ms(clock)));
        vector::append(&mut random_vector, *copy tx_digest);

        let temp1 = blake2b256(&random_vector);
        let random_num_ex = bcs::peel_u64(&mut bcs::new(temp1));
        let random_value = ((random_num_ex % max) as u64);
        random_value
    }
}

