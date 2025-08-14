module challenge::Otter {

    // ---------------------------------------------------
    // DEPENDENCIES
    // ---------------------------------------------------

    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance, Supply};
    use sui::table::{Self, Table};
    use sui::url;

    // ---------------------------------------------------
    // CONST
    // ---------------------------------------------------

    // STATUSES
    const PREPARE_FOR_TROUBLE: u64 = 1;
    const ON_ADVENTURE: u64 = 2;
    const RESTING: u64 = 3;
    const SHOPPING: u64 = 4;
    const FINISHED: u64 = 5;

    // ERROR CODES
    const WRONG_AMOUNT: u64 = 1337;
    const BETTER_GET_EQUIPPED: u64 = 1338;
    const WRONG_PLAYER_STATE: u64 = 1339;
    const ALREADY_REGISTERED: u64 = 1340;
    const TOO_MANY_MONSTERS: u64 = 1341;
    const BUY_SOMETHING: u64 = 1342;
    const NO_SUCH_PLAYER: u64 = 1343;
    const NOT_SOLVED: u64 = 1344;

    // LIMITS
    const QUEST_LIMIT: u64 = 25;

    // ---------------------------------------------------
    // STRUCTS
    // ---------------------------------------------------

    public struct OTTER has drop {}

    public struct OsecSuply<phantom CoinType> has key {
        id: UID,
        supply: Supply<CoinType>
    }

    public struct Vault<phantom CoinType> has key {
        id: UID,
        cash: Coin<CoinType>
    }

    public struct Monster has store {
        reward: u64,
        power: u64
    }

    public struct QuestBoard has key, store {
        id: UID,
        quests: vector<Monster>,
        players: Table<address, bool> //<player_address, win_status>
    }

    public struct Player has key, store {
        id: UID,
        user: address,
        power: u64,
        status: u64,
        quest_index: u64,
        wallet: Balance<OTTER>
    }

    public struct TawernTicket {
        total: u64,
        flag_bought: bool
    }

    // ---------------------------------------------------
    // MINT CASH
    // ---------------------------------------------------

    fun init(witness: OTTER, ctx: &mut TxContext) {
        let (mut treasury, metadata) = coin::create_currency(witness, 9, b"OSEC", b"Osec", b"Otter ca$h", option::some(url::new_unsafe_from_bytes(b"https://osec.io/")), ctx);
        transfer::public_freeze_object(metadata);

        let pool_liquidity = coin::mint<OTTER>(&mut treasury, 50000, ctx);

        let vault = Vault<OTTER> {
            id: object::new(ctx),
            cash: pool_liquidity
        };

        let supply = coin::treasury_into_supply(treasury);

        let osec_supply = OsecSuply {
            id: object::new(ctx),
            supply
        };

        transfer::transfer(osec_supply, tx_context::sender(ctx));

        transfer::share_object(QuestBoard {
            id: object::new(ctx),
            quests: vector::empty(),
            players: table::new(ctx)
        });

        transfer::share_object(vault);
    }

    public fun mint(sup: &mut OsecSuply<OTTER>, amount: u64, ctx: &mut TxContext): Coin<OTTER> {
        let osecBalance = balance::increase_supply(&mut sup.supply, amount);
        coin::from_balance(osecBalance, ctx)
    }

    public entry fun mint_to(sup: &mut OsecSuply<OTTER>, amount: u64, to: address, ctx: &mut TxContext) {
        let osec = mint(sup, amount, ctx);
        transfer::public_transfer(osec, to);
    }

    public fun burn(sup: &mut OsecSuply<OTTER>, c: Coin<OTTER>): u64 {
        balance::decrease_supply(&mut sup.supply, coin::into_balance(c))
    }

    // ---------------------------------------------------
    // REGISTER - ADMIN FUNCTION
    // ---------------------------------------------------

    public fun register(_: &mut OsecSuply<OTTER>, board: &mut QuestBoard, vault: &mut Vault<OTTER>, player: address, ctx: &mut TxContext) {
        assert!(!table::contains(&board.players, player), ALREADY_REGISTERED);

        let new_cash = coin::into_balance(coin::split(&mut vault.cash, 250, ctx));

        let new_player_obj = Player {
            id: object::new(ctx),
            user: player,
            power: 10,
            status: RESTING,
            quest_index: 0,
            wallet: new_cash
        };

        table::add(&mut board.players, player, false);

        transfer::transfer(new_player_obj, player);
    }

    public fun check_winner(board: &QuestBoard, player: address) {
        assert!(table::contains(&board.players, player), NO_SUCH_PLAYER);
        assert!(table::borrow(&board.players, player) == true, NOT_SOLVED);
    }

    // ---------------------------------------------------
    // TAVERN
    // ---------------------------------------------------

    public fun enter_tavern(player: &mut Player): TawernTicket {
        assert!(player.status == RESTING, WRONG_PLAYER_STATE);

        player.status = SHOPPING;

        TawernTicket{ total: 0, flag_bought: false }
    }

    public fun buy_flag(ticket: &mut TawernTicket, player: &mut Player) {
        assert!(player.status == SHOPPING, WRONG_PLAYER_STATE);

        ticket.total = ticket.total + 537;
        ticket.flag_bought = true;
    }

    public fun buy_sword(player: &mut Player, ticket: &mut TawernTicket) {
        assert!(player.status == SHOPPING, WRONG_PLAYER_STATE);

        player.power = player.power + 213;
        ticket.total = ticket.total + 140;
    }

    public fun buy_shield(player: &mut Player, ticket: &mut TawernTicket) {
        assert!(player.status == SHOPPING, WRONG_PLAYER_STATE);

        player.power = player.power + 7;
        ticket.total = ticket.total + 20;
    }

    public fun buy_power_of_friendship(player: &mut Player, ticket: &mut TawernTicket) {
        assert!(player.status == SHOPPING, WRONG_PLAYER_STATE);

        player.power = player.power + 9000; //it's over 9000!
        ticket.total = ticket.total + 190;
    }

    public fun checkout(ticket: TawernTicket, player: &mut Player, ctx: &mut TxContext, vault: &mut Vault<OTTER>, board: &mut QuestBoard) {
        let TawernTicket{ total, flag_bought } = ticket;

        assert!(total > 0, BUY_SOMETHING);  
        assert!(balance::value<OTTER>(&player.wallet) >= total, WRONG_AMOUNT);

        let balance = balance::split(&mut player.wallet, total);
        let coins = coin::from_balance(balance, ctx);

        coin::join(&mut vault.cash, coins);

        if (flag_bought == true) {

            let flag = table::borrow_mut(&mut board.players, tx_context::sender(ctx));
            *flag = true;

            std::debug::print(&std::string::utf8(b"$$$$$$$$$$$$$$$$$$$$$$$$$ FLAG BOUGHT $$$$$$$$$$$$$$$$$$$$$$$$$")); //debug
        };

        player.status = RESTING;
    }

    // ---------------------------------------------------
    // ADVENTURE TIME
    // ---------------------------------------------------

    public fun find_a_monster(board: &mut QuestBoard, player: &mut Player) {
        assert!(player.status != SHOPPING && player.status != FINISHED && player.status != ON_ADVENTURE, WRONG_PLAYER_STATE);
        assert!(vector::length(&board.quests) <= QUEST_LIMIT, TOO_MANY_MONSTERS);

        let quest = if (vector::length(&board.quests) % 3 == 0) {
            Monster {
                reward: 100,
                power: 73
            }
        } else if (vector::length(&board.quests) % 3 == 1) {
            Monster {
                reward: 62,
                power: 81
            }
        } else {
            Monster {
                reward: 79,
                power: 94
            }
        };

        vector::push_back(&mut board.quests, quest);
        player.status = PREPARE_FOR_TROUBLE;
    }
    
    public fun bring_it_on(board: &mut QuestBoard, player: &mut Player, quest_id: u64) {
        assert!(player.status != SHOPPING && player.status != FINISHED && player.status != RESTING && player.status != ON_ADVENTURE, WRONG_PLAYER_STATE);

        let monster = vector::borrow_mut(&mut board.quests, quest_id);
        assert!(player.power > monster.power, BETTER_GET_EQUIPPED);

        player.status = ON_ADVENTURE;

        player.power = 10; //equipment breaks after fighting the monster, and friends go to party :c
        monster.power = 0; //you win! wow!
        player.quest_index = quest_id;
    }

    public fun return_home(board: &mut QuestBoard, player: &mut Player) {
        assert!(player.status != SHOPPING && player.status != FINISHED && player.status != RESTING && player.status != PREPARE_FOR_TROUBLE, WRONG_PLAYER_STATE);

        let quest_to_finish = vector::borrow(&board.quests, player.quest_index);
        assert!(quest_to_finish.power == 0, WRONG_AMOUNT);

        player.status = FINISHED;
    }

    public fun get_the_reward(vault: &mut Vault<OTTER>, board: &mut QuestBoard, player: &mut Player, ctx: &mut TxContext) {
        assert!(player.status != RESTING && player.status != PREPARE_FOR_TROUBLE && player.status != ON_ADVENTURE, WRONG_PLAYER_STATE);

        let monster = vector::remove(&mut board.quests, player.quest_index);

        let Monster {
            reward: reward,
            power: _
        } = monster;

        let coins = coin::split(&mut vault.cash, reward, ctx); 
        let balance = coin::into_balance(coins);

        balance::join(&mut player.wallet, balance);

        player.status = RESTING;
    }

}

