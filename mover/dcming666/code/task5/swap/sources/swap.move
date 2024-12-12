module swap::swap;
    use dcm_faucet_coin::dcm_faucet_coin::DCM_FAUCET_COIN;
    use dcm_coin::dcm_coin::DCM_COIN;
    use sui::balance::{Self, Balance};
    use sui::transfer::{transfer, share_object, public_transfer};
    use sui::coin::{Self, Coin};

    public struct AdminCap has key {
        id: UID
    }
    
    public struct Bank has key {
        id: UID,
        dcm: Balance<DCM_COIN>,
        dcm_faucet: Balance<DCM_FAUCET_COIN>
    }

    fun init(ctx: &mut TxContext) {
        let bank = Bank {
            id: object::new(ctx),
            dcm: balance::zero<DCM_COIN>(),
            dcm_faucet: balance::zero<DCM_FAUCET_COIN>()
        };
        share_object(bank);

        let admin_cap = AdminCap { id: object::new(ctx) };
        transfer(admin_cap, ctx.sender());
    }

    public entry fun deposit_dcm(_: &AdminCap, bank: &mut Bank, dcm: Coin<DCM_COIN>, _: &mut TxContext) {
        let dcm_balance = coin::into_balance(dcm);
        balance::join(&mut bank.dcm, dcm_balance);
    }

    public entry fun deposit_dcm_faucet(_: &AdminCap, bank: &mut Bank, dcm_faucet: Coin<DCM_FAUCET_COIN>, _: &mut TxContext) {
        let dcm_faucet_balance = coin::into_balance(dcm_faucet);
        balance::join(&mut bank.dcm_faucet, dcm_faucet_balance);
    }

public entry fun withdraw_dcm(_: &AdminCap, bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
    let dcm_balance = balance::split(&mut bank.dcm, amount);
    let dcm = coin::from_balance(dcm_balance, ctx);
    public_transfer(dcm, ctx.sender());
}

public entry fun withdraw_dcm_faucet(_: &AdminCap, bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
    let dcm_faucet_balance = balance::split(&mut bank.dcm_faucet, amount);
    let dcm_faucet = coin::from_balance(dcm_faucet_balance, ctx);
    public_transfer(dcm_faucet, ctx.sender());
}

public entry fun swap_dcm_to_faucet(bank: &mut Bank, dcm: Coin<DCM_COIN>, ctx: &mut TxContext) {
    let amount = coin::value(&dcm);
    balance::join(&mut bank.dcm, coin::into_balance(dcm));

    let amount_end = amount;
    let faucet = balance::split(&mut bank.dcm_faucet, amount_end);
    public_transfer(coin::from_balance(faucet, ctx), ctx.sender());
}

public entry fun swap_faucet_to_dcm(bank: &mut Bank, dcm_faucet: Coin<DCM_FAUCET_COIN>, ctx: &mut TxContext) {
    let amount = coin::value(&dcm_faucet);
    balance::join(&mut bank.dcm_faucet, coin::into_balance(dcm_faucet));

    let amount_end = amount;
    let dcm = balance::split(&mut bank.dcm, amount_end);
    public_transfer(coin::from_balance(dcm, ctx), ctx.sender());
}