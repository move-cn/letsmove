module design::trade_in {
    use sui::sui::SUI;
    use sui::coin::Coin;


    const MODEL_ONE_PRICE: u64 = 10000;
    const MODEL_TWO_PRICE: u64 = 20000;
    const EWrongModel: u64 = 1;
    const EIncorrectAmount: u64 = 2;

    public struct Phone has key, store { id: UID, model: u8 }

    public struct Receipt { price: u64 }

    public fun buy_phone(model: u8, ctx: &mut TxContext): (Phone, Receipt) {
        assert!(model == 1 || model == 2, EWrongModel);

        let price = if (model == 1) MODEL_ONE_PRICE else MODEL_TWO_PRICE;

        (
            Phone { id: object::new(ctx), model },
            Receipt { price }
        )
    }


    public fun pay_full(receipt: Receipt, payment: Coin<SUI>) {
        let Receipt { price } = receipt;

        assert!(payment.value() == price, EIncorrectAmount);

        // for simplicity's sake transfer directly to @examples account
        transfer::public_transfer(payment, @examples);
    }


    public fun trade_in(receipt: Receipt, old_phone: Phone, payment: Coin<SUI>) {
        let Receipt { price } = receipt;

        let tradein_price = if (old_phone.model == 1) {
            MODEL_ONE_PRICE
        } else {
            MODEL_TWO_PRICE
        };
        let to_pay = price - (tradein_price / 2);

        assert!(payment.value() == to_pay, EIncorrectAmount);

        transfer::public_transfer(old_phone, @examples);
        transfer::public_transfer(payment, @examples);
    }
}


module design::trade_in_2 {

    use sui::coin::Coin;
    use sui::sui::SUI;
    use sui::transfer::public_transfer;
    use sui::tx_context::sender;
    use design::trade_in::{buy_phone, pay_full};


    public fun test(payment: Coin<SUI>, ctx: &mut TxContext) {
        let (iphone, receipt) = buy_phone(1u8, ctx);

        //
        public_transfer(iphone, sender(ctx));
        //

        pay_full(receipt, payment)
    }
}