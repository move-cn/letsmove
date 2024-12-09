import { NAVI_CONSTANTS, QueryKey } from "@/constants/constants";
import { useTransactionExecution } from "@/hooks/useTransactionExecution";
import { useCurrentAccount } from "@mysten/dapp-kit";
import {
  Transaction,
  TransactionResult,
  TransactionArgument,
} from "@mysten/sui/transactions";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import toast from "react-hot-toast";
import { nUSDC, pool, Sui } from "navi-sdk";
import { Pool, PoolConfig } from "navi-sdk/dist/types";

interface NaviLendParams {
  supplySUI: number;
  borrowUSDC: number;
  resupplyUSDC: number;
}

export function useNaviLend() {
  const account = useCurrentAccount();
  const executeTransaction = useTransactionExecution();
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async ({
      supplySUI,
      borrowUSDC,
      resupplyUSDC,
    }: NaviLendParams) => {
      if (!account?.address) {
        throw new Error("Wallet not connected");
      }

      const tx = new Transaction();
      tx.setSender(account.address);

      const amountToSupply = supplySUI * 10 ** Sui.decimal;
      const supplyCoin = tx.splitCoins(tx.gas, [amountToSupply]);
      const supplyCoinPool: PoolConfig = pool[Sui.symbol as keyof Pool];
      naviDepositCoin(tx, supplyCoinPool, supplyCoin, amountToSupply);

      const borrowCoinPool: PoolConfig = pool[nUSDC.symbol as keyof Pool];
      const amountToBorrow = borrowUSDC * 10 ** nUSDC.decimal;
      const [borrowCoin] = naviBorrowCoin(tx, borrowCoinPool, amountToBorrow);

      const amountToResupply = resupplyUSDC * 10 ** nUSDC.decimal;
      naviDepositCoin(tx, borrowCoinPool, borrowCoin, amountToResupply);

      return executeTransaction(tx);
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: [QueryKey.NaviLend] });
      toast.success("Successfully completed NAVI lending operations");
    },
    onError: (error) => {
      console.error("NAVI lending operations failed:", error);
      toast.error("Failed to complete NAVI lending operations");
    },
  });
}

function naviDepositCoin(
  tx: Transaction,
  pool: PoolConfig,
  coinObject: TransactionResult | TransactionArgument,
  amount: number
) {
  tx.moveCall({
    target: `${NAVI_CONSTANTS.ProtocolPackage}::incentive_v2::entry_deposit`,
    arguments: [
      tx.object("0x06"), // clock object id
      tx.object(NAVI_CONSTANTS.StorageId), // object id of storage
      tx.object(pool.poolId), // pool id of the asset
      tx.pure.u8(pool.assetId), // the id of the asset in the protocol
      coinObject, // the object id of the Coin you own.
      tx.pure.u64(amount), // The amount you want to deposit, decimals must be carried, like 1 sui => 1000000000
      tx.object(NAVI_CONSTANTS.Incentive),
      tx.object(NAVI_CONSTANTS.IncentiveV2), // The incentive object v2
    ],
    typeArguments: [pool.type],
  });

  return tx;
}

function naviBorrowCoin(tx: Transaction, pool: PoolConfig, borrowAmount: number) {
  const [ret] = tx.moveCall({
    target: `${NAVI_CONSTANTS.ProtocolPackage}::incentive_v2::borrow`,
    arguments: [
      tx.object("0x06"), // clock object id
      tx.object(NAVI_CONSTANTS.PriceOracle), // object id of oracle
      tx.object(NAVI_CONSTANTS.StorageId), // object id of storage
      tx.object(pool.poolId), // pool id of the asset
      tx.pure.u8(pool.assetId), // the id of the asset in the protocol
      tx.pure.u64(borrowAmount), // The amount you want to borrow, decimals must be carried, like 1 sui => 1000000000
      tx.object(NAVI_CONSTANTS.IncentiveV2), // The incentive object v2
    ],
    typeArguments: [pool.type],
  });
  const [coin] = tx.moveCall({
    target: `0x2::coin::from_balance`,
    arguments: [tx.object(ret)],
    typeArguments: [pool.type],
  });
  return [coin];
}
