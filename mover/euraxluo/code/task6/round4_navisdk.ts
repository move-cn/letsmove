import { TransactionBlock } from '@mysten/sui.js/transactions'
import { NAVISDKClient } from 'navi-sdk'
import { Sui, USDC, USDT, pool } from 'navi-sdk/dist/address'
import { Pool, PoolConfig } from 'navi-sdk/dist/types'
import {
  depositCoin,
  borrowCoin,
  SignAndSubmitTXB,
  mergeCoins
} from 'navi-sdk/dist/libs/PTB'

const run = async () => {
  const mnemonic = ''
  const client = new NAVISDKClient({
    mnemonic,
    networkType: 'mainnet',
    numberOfAccounts: 1
  })

  const account = client.accounts[0]
  const address = account.address
  console.log('address:', address)

  const txb = new TransactionBlock()
  txb.setGasBudget(1_000_000_000)
  txb.setSender(address)

  const amount_to_deposit = 5_000_000
  const amount_to_borrow = 2_000_000

  const USDC_Pool: PoolConfig = pool[USDC.symbol as keyof Pool]
  const Sui_Pool: PoolConfig = pool[Sui.symbol as keyof Pool]

  const coins = await account.client.getCoins({
    owner: address,
    coinType: Sui.address
  })

  console.log('coins:', coins)

  if (coins.data.length == 0) {
    console.error('no coin found')
    return
  }

  const coin = await mergeCoins(txb, coins)

  await depositCoin(txb, Sui_Pool, coin, amount_to_deposit)

  const [borrow_coin] = await borrowCoin(txb, USDC_Pool, amount_to_borrow)

  await depositCoin(txb, USDC_Pool, borrow_coin, amount_to_borrow)

  const res = await SignAndSubmitTXB(txb, account.client, account.keypair)

  console.log('result:', res)
}

run()


