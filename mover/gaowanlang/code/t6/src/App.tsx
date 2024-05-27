// PTB（Programmable Transaction Block）是一种特殊的交易结构，
// 能够在Sui区块链上执行复杂的操作。它不仅仅是一个简单的交易，
// 而是一个包含多种指令和逻辑的区块，可以在单个交易中实现多个操作。
import './App.css'
import { ConnectButton, useCurrentAccount, useSignAndExecuteTransactionBlock } from '@mysten/dapp-kit'
import { TransactionBlock } from '@mysten/sui.js/transactions'
import dayjs from 'dayjs'
import { Sui, USDC, pool } from 'navi-sdk/dist/address'
import type { Pool } from 'navi-sdk/dist/types'
import { borrowCoin, depositCoin } from 'navi-sdk/dist/libs/PTB'
import WalletStatus from '@/pages/WalletStatus.tsx'
import { Button } from '@/components/ui/button.tsx'

// SUI 代币的符号
const SUI_SYMBOL = Sui.symbol as keyof Pool
// USDC 代币的符号
const USDC_SYMBOL = USDC.symbol as keyof Pool
// SUI的精度
const SUI_DECIMAL = 1e9
// USDC的精度
const USDC_DECIMAL = 1e6

function App() {
  // 任务 必须在同一个PTB完成 Navi SDK
  // 1.[存入Navi Protocol 1 SUI]
  // 2.[借出当前日期的USDC 0.[月][天][小时] 的 USDC ]
  // 3.[然后在存入等额的USDC]

  // 当前账户
  const currentAccount = useCurrentAccount()
  // 钱包对象
  // const wallet = useWallet()
  // 签名和执行交易块的函数
  const { mutate } = useSignAndExecuteTransactionBlock()

  // 应该借出的USDC金额
  const shouldBorrowAmount = () => {
    const currentTime = dayjs().format('MMDDHH')
    const borrowFloat = Number.parseFloat('0.'.concat(currentTime))
    return borrowFloat * USDC_DECIMAL
  }
  // 存入和借出,再存入
  const depositBorrowDeposit = async () => {
    if (!currentAccount)
      return
    const sender = currentAccount.address
    const txBlock = new TransactionBlock()
    txBlock.setSender(sender) // 给交易数据绑定发送者

    // 1.[存入Navi Protocol 1 SUI]
    const depositAmount = SUI_DECIMAL // 存入的金额
    const suiPool = pool[SUI_SYMBOL]
    const [toDepositCoin] = txBlock.splitCoins(txBlock.gas, [depositAmount]) // 切割coin
    await depositCoin(txBlock, suiPool, toDepositCoin, depositAmount)

    // 2.[借出当前日期的USDC 0.[月][天][小时] 的 USDC ]
    const borrowAmount = shouldBorrowAmount()
    const usdcPool = pool[USDC_SYMBOL]
    const [toBorrowCoin] = await borrowCoin(txBlock, usdcPool, borrowAmount)

    // console.log('toBorrowCoin', toBorrowCoin)
    // 3.[然后在存入等额的USDC]
    await depositCoin(txBlock, usdcPool, toBorrowCoin, borrowAmount)

    // 上面三个过程的交易的变动,都存在txBlock中,将txBlock签名并发送到链上
    mutate({
      transactionBlock: txBlock,
      // chain: 'sui::testnet',
      chain: 'sui::mainnet',
    }, {
      onSuccess: (result) => {
        console.log('执行交易成功:', result)
      },
      onError: (error) => {
        console.log('执行交易失败:', error)
      },
      onSettled: (result) => {
        console.log('交易结束:', result)
      },
    })
  }

  return (
    <>
      <div className="flex-col">
        <div>
          {/* 连接钱包的按钮 */}
          <ConnectButton />
        </div>
        <div>
          {/* 连接的状态 */}
          <WalletStatus />
        </div>
        <Button onClick={depositBorrowDeposit}>
          发送交易
        </Button>
      </div>
    </>
  )
}

export default App
