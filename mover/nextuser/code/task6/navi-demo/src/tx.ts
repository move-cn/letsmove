import { Transaction } from "@mysten/sui/transactions";
import { get_number } from "./date_proc";

const navi_pkg="0x834a86970ae93a73faf4fff16ae40bdb72b91c47be585fff19a2af60a19ddca3"
const usdc_type='0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC'
const sui_type='0x2::sui::SUI'
const usdc_asset=10;
const sui_asset=0;
const usdc_decimal = 6

const storage='0xbb4e2f4b6205c2e2a2db47aeb4f830796ec7c005f88537ee775986639bc442fe';
const pool_sui = '0x96df0fce3c471489f4debaaa762cf960b3d97820bd1f3f025ff8190730e958c5'
const pool_usdc='0xa3582097b4c57630046c0c49a88bfc6b202a3ec0a9db5597c31765f7563755a8';
const incentive_v1 = '0xaaf735bf83ff564e1b219a0d644de894ef5bdc4b2250b126b2a46dd002331821';
const incentive_v2 = '0xf87a8acb8b81d14307894d12595541a73f19933f88e1326d5be349c7a6f7559c';
const price_oracle= '0x1568865ed9a0b5ec414220e8f79b3d04c77acc82358f6e5ae4635687392ffbef'


export function get_nav_test_tx() : Transaction
{
    let d = new Date();
    let usdc_amount = get_number(d,usdc_decimal);
    console.log('1.time:',d);
    console.log('2.usdc num',usdc_amount);
    const tx = new Transaction();
    //# 1. 分离一个sui
    const coin_1_sui = 1000000000n;
    const [coin1] = tx.splitCoins(tx.gas, [coin_1_sui]);

    //# 2. 调用entry_deposit 接口
    /**
     *  entry_deposit<CoinType>(clock: &Clock, storage: &mut Storage, pool: &mut Pool<CoinType>, 
     *          asset: u8, deposit_coin: Coin<CoinType>, amount: u64, 
     *          incentive_v1: &mut IncentiveV1, incentive_v2: &mut Incentive,
     *           ctx: &mut TxContext);
     */
    console.log("##################entry_deposit sui##################");
    tx.moveCall({
        arguments: [tx.object('0x6'), tx.object(storage),tx.object(pool_sui),
                    tx.pure.u8(sui_asset) , coin1, tx.pure.u64(coin_1_sui),
                    tx.object(incentive_v1),tx.object(incentive_v2)],
        typeArguments:[sui_type],  
        target: `${navi_pkg}::incentive_v2::entry_deposit`,
    } );


    //# 3. 调用entry_borrow接口 usdc
    /*
    public fun borrow<CoinType>(clock: &Clock, oracle: &PriceOracle, storage: &mut Storage, 
                        pool: &mut Pool<CoinType>, asset: u8, amount: u64, 
                        incentive: &mut Incentive,ctx: &mut TxContext): Balance<CoinType>;//  */
    console.log("##################borrow usdc balance##################");
    let balance_usdc = tx.moveCall({
        arguments: [tx.object('0x6'), tx.object(price_oracle),tx.object(storage),
                    tx.object(pool_usdc),tx.pure.u8(usdc_asset) , tx.pure.u64(usdc_amount),
                    tx.object(incentive_v2)],
        typeArguments:[usdc_type],  
        target: `${navi_pkg}::incentive_v2::borrow`,
    } );

    console.log("##################from balance => usdc coin##################");
    let coin_usdc = tx.moveCall({
        arguments :[balance_usdc],
        typeArguments : [usdc_type],
        target : "0x2::coin::from_balance"
    });

    //# 4. 存入entry_deposit, 存入usdc
    console.log("##################entry_deposit => usdc coin##################");
    tx.moveCall({
        arguments: [tx.object('0x6'), tx.object(storage),tx.object(pool_usdc),
                    tx.pure.u8(usdc_asset) , coin_usdc, tx.pure.u64(usdc_amount),
                    tx.object(incentive_v1),tx.object(incentive_v2)],
        typeArguments:[usdc_type],  
        target: `${navi_pkg}::incentive_v2::entry_deposit`,
    } );
    return tx;
}


/**
- 完成 必须在同一个PTB完成 Navi SDK 1.[存入Navi Protocol 1 SUI]  2.[借出当前日期的USDC 0.[月][天][小时] 的 USDC ]
  3.[然后在存入等额的USDC]

> 当前时间是2024年4月25日15点 借出的金额就是 `0.042515`   月 天 小时 必须是两位数 2024年5月1日2点  `0.050102`

*/