import { useSignAndExecuteTransaction, useSuiClient } from "@mysten/dapp-kit";
import { Transaction } from "@mysten/sui/transactions";

function MintPublicCoin() {
  // 合约 package ID
  const PublicCoinPackageId = "0xc06d987d7169d158021136e08cbc650d2d5f9159b799513bbec8261968364807";
  // 获取suiClient
  const suiClient = useSuiClient(); // 链接sui网络
  // 使用useSignAndExecuteTransaction钩子提示用户用他们的钱包签署并执行交易块,获取执行合约命令的驱动
  const {mutate: signAndExecute, isPending, isSuccess } = useSignAndExecuteTransaction();

  // 点击方法
  const mintCoin = () => {
    console.log("====mintCoin")
    // 获取交易上下文对象
    const tx = new Transaction();
    // 补全合约命令，sui client call --packageID --moudle --function --ages
    tx.moveCall({
      arguments: [tx.object("0xfc7b09fea63d60a466adc38c7444c16d4f960f4c9f2280eff340b80010e91b93"),tx.pure.u64(3),tx.object("0xad348ef5fef1bf4071b1fb0b4dc9562bbcf0e2707262284d70a6f89798f053a9")],
      target: `${PublicCoinPackageId}::publiccoin::mint`,
    });
    // 执行合约命令
    signAndExecute(
      {
        transaction: tx,
      },
      {
        onSuccess: (tx) => {
          console.log(tx)
          suiClient.waitForTransaction({ digest: tx.digest }).then(async () => {
            console.log("===执行完成")
          });
        },
        onError: (tx) => {
          console.log("====执行失败")
        }
      }
    )


  }
  return (
    <button className="mintCoin" onClick={mintCoin}>Mint Public Coin</button>
  )
}
export default MintPublicCoin;