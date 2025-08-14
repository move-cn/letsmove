/// Module: move_game
module move_game::move_game {
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin};
    use sui::event::emit;
    use sui::random;
    use sui::random::{Random, new_generator};
    use sui::table;
    use sui::table::Table;
    use sui::transfer::{transfer, share_object, public_transfer};
    use sui::tx_context::{sender};
    use move_coin::usd::USD;

    const EEmptyRound: u64 = 1;
    const EPlayerCntNotEnough: u64 = 2;
    const ELastRoundIsDrawed: u64 = 3;


    public struct Director has key {
        id: UID,
        rounds: vector<Round>
    }

    public struct AdminCap has key, store {
        id: UID
    }

    public struct Round has key, store {
        id: UID,
        balance: Balance<USD>,
        players: vector<address>,
        playersDeposit: Table<address, u64>,
        totalDeposit: u64,
        drawed: bool,
        winner1: Option<address>,
        winner2: Option<address>,
    }

    public struct EventDeposit has copy, drop {
        player: address,
        amount: u64
    }

    public struct EventDraw has copy, drop {
        winner1Index: u64,
        winner2Index: u64,
        winner1Address: address,
        winner2Address: address,
        winner1Amount: u64,
        winner2Amount: u64
    }

    public struct EventRnd has copy, drop {
        total: u8,
        winner1Index: u64,
        winner2Index: u64
    }

    public struct EventAmount has copy, drop {
        amount: u64,
        winner1PrizeAmount: u64,
        winner2PrizeAmount: u64
    }

    fun init(ctx: &mut TxContext) {
        let adminCap = AdminCap {
            id: object::new(ctx)
        };

        let director = Director {
            id: object::new(ctx),
            rounds: vector::empty<Round>()
        };

        share_object(director);

        transfer(adminCap, sender(ctx));
    }

    public entry fun deposit(director: &mut Director, coin: Coin<USD>, ctx: &mut TxContext) {
        if(vector::is_empty(&director.rounds)) {
            vector::push_back(&mut director.rounds, Round {
                id: object::new(ctx),
                balance: balance::zero(),
                players: vector::empty(),
                playersDeposit: table::new(ctx),
                totalDeposit: 0,
                drawed: false,
                winner1: option::none(),
                winner2: option::none()
            });
        };

        let len = vector::length(&director.rounds);
        let mut currentRound = vector::borrow_mut(&mut director.rounds, len - 1);

        if(currentRound.drawed){
            vector::push_back(&mut director.rounds, Round {
                id: object::new(ctx),
                balance: balance::zero(),
                players: vector::empty(),
                playersDeposit: table::new(ctx),
                totalDeposit: 0,
                drawed: false,
                winner1: option::none(),
                winner2: option::none()
            });
            let len2 = vector::length(&director.rounds);

            currentRound = vector::borrow_mut(&mut director.rounds, len2 - 1);
        };


        let depositBalance = coin::into_balance(coin);
        let amount = balance::value(&depositBalance);

        currentRound.totalDeposit = currentRound.totalDeposit + amount;

        let player = sender(ctx);

        if(table::contains(&currentRound.playersDeposit, player)){
            let oldAmount = table::borrow_mut(&mut currentRound.playersDeposit, player);
            *oldAmount = *oldAmount + amount;
        } else {
            table::add(&mut currentRound.playersDeposit, player, amount);
        };

        if (!vector::contains(&currentRound.players, &player)) {
            vector::push_back(&mut currentRound.players, player);
        };

        balance::join(&mut currentRound.balance, depositBalance);

        emit(EventDeposit {
            player,
            amount
        });
    }

    #[allow(lint(public_random))]
    public entry fun draw(_: &AdminCap, director: &mut Director, r: &Random, ctx: &mut TxContext) {
        assert!(vector::length(&director.rounds) > 0, EEmptyRound);

        let len = vector::length(&director.rounds);
        let currentRound = vector::borrow_mut(&mut director.rounds, len - 1);

        let playerCnt = vector::length(&currentRound.players);
        assert!(playerCnt > 1, EPlayerCntNotEnough);
        assert!(!currentRound.drawed, ELastRoundIsDrawed);


        let mut generator = new_generator(r, ctx);
        let winner1IdxR = random::generate_u64_in_range(&mut generator, 0, 1024);
        let winner2IdxR = random::generate_u64_in_range(&mut generator, 0, 1024);
        let winner1Idx = winner1IdxR % playerCnt;
        let winner2Idx = winner2IdxR % playerCnt;

        emit(EventRnd {
            total: (playerCnt as u8),
            winner1Index: winner1Idx,
            winner2Index: winner2Idx
        });

        let winner1Address = vector::borrow(&currentRound.players, winner1Idx);
        let winner2Address = vector::borrow(&currentRound.players, winner2Idx);

        let amount = balance::value(&currentRound.balance);

        let winner1PrizeAmount = amount / 2;
        let winner2PrizeAmount = amount - winner1PrizeAmount;


        emit(EventAmount {
            amount: amount,
            winner1PrizeAmount: winner1PrizeAmount,
            winner2PrizeAmount: winner2PrizeAmount
        });


        let winner1PrizeBalance = balance::split(&mut currentRound.balance, winner1PrizeAmount);
        let winner2PrizeBalance = balance::split(&mut currentRound.balance, winner2PrizeAmount);


        let winner1Coin = coin::from_balance(winner1PrizeBalance, ctx);
        let winner2Coin = coin::from_balance(winner2PrizeBalance, ctx);

        public_transfer(winner1Coin, *winner1Address);
        public_transfer(winner2Coin, *winner2Address);

        currentRound.winner1 = option::some(*winner1Address);
        currentRound.winner2 = option::some(*winner2Address);
        currentRound.drawed = true;

        emit(EventDraw {
            winner1Index: winner1Idx,
            winner2Index: winner2Idx,
            winner1Address: *winner1Address,
            winner2Address: *winner2Address,
            winner1Amount: winner1PrizeAmount,
            winner2Amount: winner2PrizeAmount
        })
    }


    entry fun rnd(r: &Random, ctx: &mut TxContext) {
        let mut generator = new_generator(r, ctx);
        let winner1Idx = random::generate_u64_in_range(&mut generator, 0, 100);
        let winner2Idx = random::generate_u64_in_range(&mut generator, 0, 100);

        emit(EventRnd {
            total: 3,
            winner1Index: winner1Idx,
            winner2Index: winner2Idx
        })
    }
}
