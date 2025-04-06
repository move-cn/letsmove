import { CoinStruct, getFullnodeUrl, SuiClient } from '@mysten/sui/client';
import { MIST_PER_SUI } from '@mysten/sui/utils';
import { Transaction } from "@mysten/sui/transactions";
import { borrowCoin, depositCoin, NAVISDKClient, Pool, PoolConfig, repayDebt, withdrawCoin } from "navi-sdk";
import { pool, Sui, nUSDC} from "navi-sdk/dist/address";


//https://naviprotocol.gitbook.io/navi-protocol-developer-docs/navi-sdk/ptb-functions

const SUI_COIN_TYPE = "0x2::sui::SUI";

export async function buildNaviTaskTransaction(client: SuiClient, address?: string) {

    // _loginfo();

    const depositAmount = Math.floor(1 * 10 ** Sui.decimal);
    console.log("depositAmount:", depositAmount);

    let tx = new Transaction();
 
    const coins = tx.splitCoins(
        tx.gas,
        [depositAmount], //0.01 SUI
    );

    // console.log("coin:", coins[0]);

    const toDepositCoin = Sui;
    const toBorrowCoin = nUSDC;

    const toDepositPoolConfig: PoolConfig = pool[toDepositCoin.symbol as keyof Pool];
    console.log("toDepositPoolConfig:", toDepositPoolConfig);

    const toBorrowPoolConfig: PoolConfig = pool[toBorrowCoin.symbol as keyof Pool];
    console.log("toBorrowPoolConfig:", toBorrowPoolConfig);

    // 存入1 SUI
    console.log(`depositCoin: ${depositAmount} SUI`);
    await depositCoin(tx, toDepositPoolConfig, coins[0], tx.pure.u64(depositAmount)) //tx.object(coins[0])

    // const [returnedCoin] = await withdrawCoin(tx, toDepositPoolConfig, Number(depositAmount))
    // console.log("returnedCoin:", returnedCoin);
    // tx.transferObjects([returnedCoin], address!);

    // 借出当前日期的USDC：0.[月][天][小时]
    const currentDate = new Date();
    const month = String(currentDate.getMonth() + 1).padStart(2, '0');
    const day = String(currentDate.getDate()).padStart(2, '0');
    const hour = String(currentDate.getHours()).padStart(2, '0');
    const borrowAmountStr = `0.${month}${day}${hour}`;
    const debt = Math.floor(Number(borrowAmountStr) * 10 ** nUSDC.decimal);
    let borrowAmount = Math.floor(debt / (1 + 0.003)); //fee 0.3%
    console.log(`borrowAmount: ${borrowAmountStr} USDC, debt: ${debt} USDC, borrowAmount: ${borrowAmount} USDC`);

    //去掉误差
    let tmp = Math.floor(borrowAmount + borrowAmount * 0.003);
    if(tmp !== debt){
        if(tmp > debt){
            borrowAmount = borrowAmount - 1;
        }else{
            borrowAmount = borrowAmount + 1;
        }

        tmp = Math.floor(borrowAmount + borrowAmount * 0.003);
    }
    console.log('borrowAmount + borrowAmount * 0.003 === debt',  tmp, tmp === debt);


    console.log(`borrowCoin: ${borrowAmount} USDC,   debt: ${debt} USDC`);
    const [borrowedCoin] = await borrowCoin(tx, toBorrowPoolConfig, borrowAmount)
    // console.log("returnedCoin:", returnedCoin);

    // repay等额的USDC //使用钱包里已有的，余额比debt多的USDC coin
    console.log(`repayDebt: ${debt} USDC`);
    //获取usdc coin
    const usdcCoin = await getCoin(tx, client, address!, nUSDC.address, debt);
    // console.log("usdcCoin:", usdcCoin);
    await repayDebt(tx, toBorrowPoolConfig, usdcCoin, debt)

    //借出的转到自己钱包
    tx.transferObjects([borrowedCoin], address!);

    //build 的时候会执行 dry run, 能很快找到transaction 构建的错误
    tx.setSender(address!);
    const bytes = await tx.build({ client });
    // console.log("bytes:", bytes);

    // client.signAndExecuteTransaction({ signer: keypair, transaction: tx });
 

    //https://naviprotocol.gitbook.io/navi-protocol-developer-docs/contract-configuration/get-the-latest-package-id
    //https://suivision.xyz/package/0x81c408448d0d57b3e371ea94de1d40bf852784d3e225de1e74acab3e8395c18f?tab=Code

    //public entry fun entry_deposit<T0>(
    // arg0: &0x2::clock::Clock, 
    // arg1: &mut 0xd899cf7d2b5db716bd2cf55599fb0d5ee38a3061e7b6bb6eebf73fa5bc4c81ca::storage::Storage, 
    // arg2: &mut 0xd899cf7d2b5db716bd2cf55599fb0d5ee38a3061e7b6bb6eebf73fa5bc4c81ca::pool::Pool<T0>, 
    // arg3: u8, 
    // arg4: 0x2::coin::Coin<T0>, 
    // arg5: u64, 
    // arg6: &mut 0xd899cf7d2b5db716bd2cf55599fb0d5ee38a3061e7b6bb6eebf73fa5bc4c81ca::incentive_v2::Incentive, 
    // arg7: &mut Incentive, 
    // arg8: &mut 0x2::tx_context::TxContext) {

    
    //     let v0 = 0x2::tx_context::sender(arg8);
    //     0xd899cf7d2b5db716bd2cf55599fb0d5ee38a3061e7b6bb6eebf73fa5bc4c81ca::incentive_v2::update_reward_all(arg0, arg6, arg1, arg3, v0);
    //     update_reward_state_by_asset<T0>(arg0, arg7, arg1, v0);
    //     0xd899cf7d2b5db716bd2cf55599fb0d5ee38a3061e7b6bb6eebf73fa5bc4c81ca::lending::deposit_coin<T0>(arg0, arg1, arg2, arg3, arg4, arg5, arg8);
    // }
    

    return bytes;
}

function _loginfo(){
    console.log("CoinInfo nUSDC: ", nUSDC);
    //{
    //     "symbol": "nUSDC",
    //     "address": "0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC",
    //     "decimal": 6
    // }
    console.log("CoinInfo Sui: ", Sui);
    //{
    //     "symbol": "Sui",
    //     "address": "0x2::sui::SUI",
    //     "decimal": 9
    // }
    console.log("pool: ", JSON.stringify(pool, null, 2));
}

function getCoinObjectIds(coins: CoinStruct[], coinType: string){
    const coinList = coins.filter((coin) => coin.coinType === coinType);
    return coinList.map((coin) => coin.coinObjectId);
}

async function getCoin(tx: Transaction, client: SuiClient, address: string, coinType: string, amount: number){
    const {data, nextCursor, hasNextPage} = await client.getCoins({
        owner: address,
        coinType: coinType,
    });

    //如果一个都没有找到，报错
    if(data.length === 0){
        throw new Error("No coin found");
    }

    //算一下合并起来的钱够不够，如果合并起来的coin 的amount 小于amount，报错 //判断第（或某）一个够不够就不做了
    const totalAmount = data.reduce((acc, coin) => acc + Number(coin.balance), 0);
    if(totalAmount < amount){
        throw new Error("Total amount is less than the amount to repay");
    }
    // console.log("Coins:", JSON.stringify(data, null, 2));
    console.log("totalAmount:", totalAmount);


    const coinObjectIds = data.map((coin) => coin.coinObjectId);
    

    //如果有多于1个object
    if(coinObjectIds.length > 1){
        await tx.mergeCoins(coinObjectIds[0], coinObjectIds.slice(1));
    }


    
    const [coin] = await tx.splitCoins(coinObjectIds[0], [amount]);

    return coin;
}