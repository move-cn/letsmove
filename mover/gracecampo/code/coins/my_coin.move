module coins::my_coin {
		use sui::coin::{Self, TreasuryCap};
        use sui::transfer::transfer;
        use sui::tx_context::{TxContext, sender};

		public struct MY_COIN has drop {}

		fun init(witness: MY_COIN, ctx: &mut TxContext) {
				let (treasury, metadata) = coin::create_currency(witness, 6, b"MY_COIN", b"", b"", option::none(), ctx);
				transfer::public_freeze_object(metadata);
				transfer::public_transfer(treasury, ctx.sender());
		}

        public entry fun mint(
				treasury_cap: &mut TreasuryCap<MY_COIN>, 
				amount: u64, 
				recipient: address, 
				ctx: &mut TxContext,
		) {
				let coin = coin::mint(treasury_cap, amount, ctx);
				transfer::public_transfer(coin, recipient)
		}
}