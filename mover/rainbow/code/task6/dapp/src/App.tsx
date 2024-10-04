import { ConnectButton, useCurrentAccount, useCurrentWallet,useSignAndExecuteTransaction} from '@mysten/dapp-kit'
import {depositCoin, borrowCoin} from 'navi-sdk/dist/libs/PTB'
import {pool,Sui,USDC} from "navi-sdk/dist/address"
import {Transaction} from "@mysten/sui/transactions"
import './App.css'
import { Pool, PoolConfig} from 'navi-sdk/dist/types'

function App() {
  const account = useCurrentAccount()
  const { currentWallet, connectionStatus } = useCurrentWallet()
  const {mutate:signAndExecuteTransaction} = useSignAndExecuteTransaction()
 
  const handelTask = async ()=>{
    if(connectionStatus!='connected'){
      return 
    }

    let tx = new Transaction()
    let amount = 1e9
    tx.setSender(account!.address)
    let [sui_coin] = tx.splitCoins(tx.gas,[amount])
    const sui_pool: PoolConfig  = pool[Sui.symbol as keyof Pool]
    let res = await depositCoin(tx, sui_pool,sui_coin,amount)
    console.log(res)

    let borrow_amount = Math.round(0.080301 * 1e6)
    const usdc_pool:PoolConfig = pool[USDC.symbol as keyof Pool]
    const [borrow_coin] = await borrowCoin(tx,usdc_pool, borrow_amount)
    const deposit_res = await depositCoin(tx, usdc_pool, borrow_coin, borrow_amount)
    console.log(deposit_res)
    signAndExecuteTransaction(
      {transaction:tx},
      {
        onSuccess(data, variables, context) {
          console.log(data,variables,context)
        },
        onError(err){
          console.log(err)
        }
      }
    )
    
  }

  return (
    <>
      <div className='header'>
        <span className='logo'>DAPP</span>
        <div className='wallet'>
          <div>
            {connectionStatus === 'connected'?
              <div className='wallet-info'>
                <img src={currentWallet.icon} />
                <span>{currentWallet.name}</span>
              </div>
            :
              <span>未连接钱包</span>
            }
            
          </div>
          <div className='connect-btn'>
            <ConnectButton  connectText="连接钱包" />
          </div>
        </div>
      </div>

      <div className="content">
        <div>当前账户：{account?.address}</div>
        <div className="actions">
          <button onClick={handelTask}>执行</button>
        </div>
      </div>
      
    </>
  )
}

export default App
