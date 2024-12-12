
//第一个是简单的SWAP,交换的代币为QWRDXER_RMB 和QWRDXER_USDT
module qwrdxer::task5_swap{
    use sui::balance::{Self,Balance, zero};
    use sui::coin;
    use sui::coin::{Coin};
    use sui::event::emit;
    use sui::transfer::{share_object, public_transfer};
    use sui::tx_context::sender;
    use task5_coin::qwrdxer_RMB::QWRDXER_RMB;
    use task5_coin::qwrdxer_USDT::QWRDXER_USDT;

    //日志结构体
    public struct LogBank has drop,copy{
        bank_value_RMB:u64,
        bank_value_USDT:u64,
        bank_value_change:u64
    }

    public struct AdminCap has key{
        id:UID
    }
    public struct SwapBank has store,key{
        id:UID,
        Coin_RMB:Balance<QWRDXER_RMB>,
        Coin_USDT:Balance<QWRDXER_USDT>,
    }
    fun init(ctx:&mut TxContext){
        //初始化银行
        let bank= SwapBank{
            id:object::new(ctx),
            Coin_RMB:zero<QWRDXER_RMB>(),
            Coin_USDT:zero<QWRDXER_USDT>()
        };
        //共享出去
        share_object(bank);
        //创建管理员权限
        transfer::transfer(AdminCap{id:object::new(ctx)},tx_context::sender(ctx))
    }

    // 管理员能调用的存取函数
    public entry fun deposit_CoinRMB(_:&AdminCap,bank:&mut SwapBank,rmbcoin:Coin<QWRDXER_RMB>,_:&mut TxContext){
        let rmbbalance=coin::into_balance(rmbcoin);
        let changevalue=balance::value(&rmbbalance);
        bank.Coin_RMB.join(rmbbalance);
        emit(
            LogBank{
                bank_value_RMB:balance::value(&bank.Coin_RMB),
                bank_value_USDT:balance::value(&bank.Coin_USDT),
                bank_value_change:changevalue
            }
        )
    }

    public entry fun withDraw_CoinRMB(_:&AdminCap,bank:&mut SwapBank,amt:u64,ctx:&mut TxContext){
        let rmbbalance=balance::split<QWRDXER_RMB>(&mut bank.Coin_RMB,amt);
        let cach=coin::from_balance(rmbbalance,ctx);
        transfer::public_transfer(cach,ctx.sender());
        emit(
            LogBank{
                bank_value_RMB:balance::value(&bank.Coin_RMB),
                bank_value_USDT:balance::value(&bank.Coin_USDT),
                bank_value_change:amt
            }
        )
    }
    public entry fun deposit_CoinUSDT(_:&AdminCap,bank:&mut SwapBank,usdtcoin:Coin<QWRDXER_USDT>,_:&mut TxContext){
        let usdtbalance=coin::into_balance(usdtcoin);
        let changevalue=balance::value(&usdtbalance);
        bank.Coin_USDT.join(usdtbalance);
        emit(
            LogBank{
                bank_value_RMB:balance::value(&bank.Coin_RMB),
                bank_value_USDT:balance::value(&bank.Coin_USDT),
                bank_value_change:changevalue
            }
        )
    }

    public entry fun withDraw_CoinUSDT(_:&AdminCap,bank:&mut SwapBank,amt:u64,ctx:&mut TxContext){
        let usdtbalance=balance::split<QWRDXER_USDT>(&mut bank.Coin_USDT,amt);
        let cach=coin::from_balance(usdtbalance,ctx);
        transfer::public_transfer(cach,ctx.sender());
        emit(
            LogBank{
                bank_value_RMB:balance::value(&bank.Coin_RMB),
                bank_value_USDT:balance::value(&bank.Coin_USDT),
                bank_value_change:amt
            }
        )
    }
    //swap交换函数实现
    public entry fun swap_RMB_TO_USDT(bank:&mut SwapBank,rmbCoin: Coin<QWRDXER_RMB>,ctx:&mut TxContext){
        let coinvalue=coin::value(&rmbCoin);
        let swapbalance=coinvalue *730000 /100000;
        //RMB 入 Bank
        let rmbbalance=coin::into_balance(rmbCoin);
        balance::join(&mut bank.Coin_RMB,rmbbalance);
        //取出 USDT
        let usdtbalance=balance::split(&mut bank.Coin_USDT,swapbalance);
        let usdtcoin=coin::from_balance(usdtbalance,ctx);
        //发送给对方
        public_transfer(usdtcoin,sender(ctx));
    }
    public entry fun swap_USDT_TO_RMB(bank:&mut SwapBank,usdtCoin: Coin<QWRDXER_USDT>,ctx:&mut TxContext){
        let coinvalue=coin::value(&usdtCoin);
        let swapbalance=coinvalue*100000 /730000;
        //RMB 入 Bank
        let usdtbalance=coin::into_balance(usdtCoin);
        balance::join(&mut bank.Coin_USDT,usdtbalance);
        //取出 USDT
        let rmbbalance=balance::split(&mut bank.Coin_RMB,swapbalance);
        let rmbtcoin=coin::from_balance(rmbbalance,ctx);
        //发送给对方
        public_transfer(rmbtcoin,sender(ctx));
    }
}