/// Module: task4
module task4::game {
		use sui::random::Random;
  	use sui::random;
    use sui::balance;
    use sui::balance::{Balance, zero};
    use sui::coin;
    use sui::coin::{into_balance, from_balance};

		public struct GamePool<phantom T> has key {
        id: UID,
        pool: Balance<T>,
    }

    public struct AdminCap has key {
        id: UID,
    }


		fun init( ctx: &mut TxContext) {
      let admin = AdminCap {
          id: object::new(ctx),
      };
      transfer::transfer(admin, ctx.sender());
	  }

		entry fun init_pool<T>(_: &AdminCap, ctx: &mut TxContext) {
				let pool = GamePool<T> {
						id: object::new(ctx),
						pool: zero<T>(),
				};
				transfer::share_object(pool);
		}

		// 消耗至少一个JERRY_FAUCET_TOKEN，如果随机数小于5000000，则将JERRY_FAUCET_TOKEN存入游戏池中，否则将随机数数量的JERRY_FAUCET_TOKEN转账给调用者
		public entry fun play<T>(
				game: &mut GamePool<T>,
				r: &Random,
				in: coin::Coin<T>,
				ctx: &mut TxContext,
		) {
				assert!(in.balance().value() > 999999, 0);
				let points = getRandomPoints(r, ctx);
				let winPoints = getRandomPoints(r, ctx);
				let in_balance = into_balance(in);
				balance::join(&mut game.pool, in_balance);
				if (points > 5000000 ) {
						let balance = balance::split(&mut game.pool, winPoints);
						let coin = from_balance(balance, ctx);
						transfer::public_transfer(coin, ctx.sender());
				}
		}

		fun getRandomPoints(r: &Random, ctx: &mut TxContext): u64 {
    	random::generate_u64_in_range(&mut random::new_generator(r, ctx), 1000000, 10000000)
  	}

    public entry fun deposit<T>(
        pool: &mut GamePool<T>,
        in: coin::Coin<T>,
    ) {
        let in_balance = into_balance(in);
        balance::join(&mut pool.pool, in_balance);
    }

		
    public entry fun withdraw<T>(_: &AdminCap, game: &mut GamePool<T>, amount: u64, ctx: &mut TxContext) {
        let balance = balance::split(&mut game.pool, amount);
        let coin = from_balance(balance, ctx);
        transfer::public_transfer(coin, ctx.sender());
    }
}
