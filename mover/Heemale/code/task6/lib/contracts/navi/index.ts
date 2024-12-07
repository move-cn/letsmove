import {Transaction} from "@mysten/sui/transactions";
import {SUI_CLOCK_OBJECT_ID} from "@mysten/sui/utils";
import {getConfig, pool, wUSDC} from "navi-sdk";
import {convertLargeToSmall} from "@/utils/math";

export const borrowAmount = (): string => {
    const now = new Date();
    const month = (now.getMonth() + 1).toString().padStart(2, '0'); // 获取月份并补齐两位
    const day = now.getDate().toString().padStart(2, '0'); // 获取日期并补齐两位
    const hours = now.getHours().toString().padStart(2, '0'); // 获取小时并补齐两位

    return `0.${month}${day}${hours}`;
}

export const task6 = async () => {
    const tx = new Transaction();

    const packageId = '0x834a86970ae93a73faf4fff16ae40bdb72b91c47be585fff19a2af60a19ddca3';
    const config = await getConfig();

    const {
        StorageId,
        Incentive,
        IncentiveV2,
        PriceOracle
    } = config;

    const suiAmount = 1000000000;
    const usdcAmount = convertLargeToSmall(borrowAmount(), wUSDC.decimal);

    // 获取sui
    const [sui] = tx.splitCoins(tx.gas, [tx.pure.u64(suiAmount)]);

    // 存入sui
    tx.moveCall({
        typeArguments: [pool.Sui.type],
        target: `${packageId}::incentive_v2::entry_deposit`,
        arguments: [
            tx.object(SUI_CLOCK_OBJECT_ID),
            tx.object(StorageId),
            tx.object(pool.Sui.poolId),
            tx.pure.u8(pool.Sui.assetId),
            sui,
            tx.pure.u64(suiAmount),
            tx.object(Incentive),
            tx.object(IncentiveV2),
        ],
    });

    // 借出usdc
    const usdcBlance = tx.moveCall({
        typeArguments: [pool.nUSDC.type],
        target: `${packageId}::incentive_v2::borrow`,
        arguments: [
            tx.object(SUI_CLOCK_OBJECT_ID),
            tx.object(PriceOracle),
            tx.object(StorageId),
            tx.object(pool.nUSDC.poolId),
            tx.pure.u8(pool.nUSDC.assetId),
            tx.pure.u64(usdcAmount),
            tx.object(IncentiveV2),
        ],
    });

    // 类型转化
    const usdcCoin = tx.moveCall({
        typeArguments: [pool.nUSDC.type],
        target: `0x2::coin::from_balance`,
        arguments: [usdcBlance],
    });

    // 再次存入usdc
    tx.moveCall({
        typeArguments: [pool.nUSDC.type],
        target: `${packageId}::incentive_v2::entry_deposit`,
        arguments: [
            tx.object(SUI_CLOCK_OBJECT_ID),
            tx.object(StorageId),
            tx.object(pool.nUSDC.poolId),
            tx.pure.u8(pool.nUSDC.assetId),
            usdcCoin,
            tx.pure.u64(usdcAmount),
            tx.object(Incentive),
            tx.object(IncentiveV2),
        ],
    });

    return tx;
};