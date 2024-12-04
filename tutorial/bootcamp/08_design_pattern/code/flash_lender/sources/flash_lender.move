module flash_lender::flash_lender {
    use sui::coin::{Self, Coin};
    use sui::balance::Balance;
    #[test_only]
    use std::vector::swap;
    #[test_only]
    use sui::object;
    #[test_only]
    use sui::test_scenario;
    #[test_only]
    use sui::test_scenario::sender;
    #[test_only]
    use sui::transfer::public_transfer;


    public struct FlashLender<phantom T> has key {
        id: UID,
        to_lend: Balance<T>,
        fee: u64,
    }


    // 类型
    // 关联
    public struct Receipt<phantom T> {
        flash_lender_id: ID,
        repay_amount: u64
    }


    public struct AdminCap has key, store {
        id: UID,
        flash_lender_id: ID,
    }


    const ELoanTooLarge: u64 = 0;
    const EInvalidRepaymentAmount: u64 = 1;
    const ERepayToWrongLender: u64 = 2;
    const EAdminOnly: u64 = 3;
    const EWithdrawTooLarge: u64 = 4;


    public fun new<T>(to_lend: Balance<T>, fee: u64, ctx: &mut TxContext): AdminCap {
        let id = object::new(ctx);
        let flash_lender_id = id.to_inner();
        let flash_lender = FlashLender { id, to_lend, fee };

        transfer::share_object(flash_lender);

        AdminCap { id: object::new(ctx), flash_lender_id }
    }


    public entry fun create<T>(to_lend: Coin<T>, fee: u64, ctx: &mut TxContext) {
        let balance = to_lend.into_balance();
        let admin_cap = new(balance, fee, ctx);

        transfer::public_transfer(admin_cap, ctx.sender())
    }


    public fun loan<T>(
        self: &mut FlashLender<T>, amount: u64, ctx: &mut TxContext
    ): (Coin<T>, Receipt<T>) {
        let to_lend = &mut self.to_lend;
        assert!(to_lend.value() >= amount, ELoanTooLarge);
        let loan = coin::take(to_lend, amount, ctx);

        let repay_amount = amount + self.fee;
        let receipt = Receipt { flash_lender_id: object::id(self), repay_amount };

        (loan, receipt)
    }


    public fun repay<T>(self: &mut FlashLender<T>, payment: Coin<T>, receipt: Receipt<T>) {
        let Receipt { flash_lender_id, repay_amount } = receipt;
        assert!(object::id(self) == flash_lender_id, ERepayToWrongLender);
        assert!(payment.value() == repay_amount, EInvalidRepaymentAmount);

        coin::put(&mut self.to_lend, payment)
    }


    public fun withdraw<T>(
        self: &mut FlashLender<T>,
        admin_cap: &AdminCap,
        amount: u64,
        ctx: &mut TxContext
    ): Coin<T> {
        // only the holder of the `AdminCap` for `self` can withdraw funds
        check_admin(self, admin_cap);

        let to_lend = &mut self.to_lend;
        assert!(to_lend.value() >= amount, EWithdrawTooLarge);
        coin::take(to_lend, amount, ctx)
    }

    /// Allow admin to add more funds to `self`
    public entry fun deposit<T>(
        self: &mut FlashLender<T>, admin_cap: &AdminCap, coin: Coin<T>
    ) {
        // only the holder of the `AdminCap` for `self` can deposit funds
        check_admin(self, admin_cap);
        coin::put(&mut self.to_lend, coin);
    }

    /// Allow admin to update the fee for `self`
    public entry fun update_fee<T>(
        self: &mut FlashLender<T>, admin_cap: &AdminCap, new_fee: u64
    ) {
        // only the holder of the `AdminCap` for `self` can update the fee
        check_admin(self, admin_cap);

        self.fee = new_fee
    }

    fun check_admin<T>(self: &FlashLender<T>, admin_cap: &AdminCap) {
        assert!(object::borrow_id(self) == &admin_cap.flash_lender_id, EAdminOnly);
    }

    // === Reads ===

    /// Return the current fee for `self`
    public fun fee<T>(self: &FlashLender<T>): u64 {
        self.fee
    }

    /// Return the maximum amount available for borrowing
    public fun max_loan<T>(self: &FlashLender<T>): u64 {
        self.to_lend.value()
    }

    /// Return the amount that the holder of `self` must repay
    public fun repay_amount<T>(self: &Receipt<T>): u64 {
        self.repay_amount
    }

    /// Return the amount that the holder of `self` must repay
    public fun flash_lender_id<T>(self: &Receipt<T>): ID {
        self.flash_lender_id
    }

    // #[test]
    // fun test() {
    //     use sui::sui::SUI;
    //     let mut xx = test_scenario::begin(@0x1111);
    //     let ctx = test_scenario::ctx(&mut xx);
    //     let flash_lender = FlashLender { id: object::new(ctx), to_lend, 100 };
    //     let (coin, reeipt) = loan<SUI>(&mut flash_lender, 10000000000, ctx);
    //
    //     1000;
    //     let usdc = sui_swap(coin);
    //
    //     let sui_coin = uni_swap(usdc);
    //     2000 = 1000;
    //
    //
    //
    //     let re_coin = coin::split(sui_coin, 1100, ctx);
    //
    //     repay(&mut flash_lender, re_coin, reeipt);
    //
    //
    //     /// 900
    //     public_transfer(sui_coin, @x222222);
    // }
}


