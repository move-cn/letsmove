import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Box, Button, Card, Container, DataList, Flex, Text } from "@radix-ui/themes";
import { pool, Sui, nUSDC } from 'navi-sdk/dist/address'
import { getLatestProtocolPackageId } from 'navi-sdk/dist/libs/PoolInfo'
import { NAVISDKClient } from "navi-sdk/dist/naviSDK";
import { useEffect, useState } from "react";
import { Transaction } from "@mysten/sui/transactions";
import { depositCoin, borrowCoin, repayDebt } from 'navi-sdk/dist/libs/PTB'
import { Pool, PoolConfig } from "navi-sdk/dist/types";


export const addZero = (v: number) => {
    if (v < 10) {
      return '0' + v
    } else {
      return '' + v
    }
  }

  export const getCurrentTime = () => {
    const myDate=new Date();
    const year = myDate.getFullYear();
    const month = myDate.getMonth()+1;
    const date = myDate.getDate();
    const hour = myDate.getHours();
    const min = myDate.getMinutes();
    const second = myDate.getSeconds();
    return {
      year,
      month,
      date,
      hour,
      min,
      second
    }
  }


export function PtbBlock() {
  const [realtimeData, setRealtimeData] = useState<{[key: string]: any}[]>()
  const [digest, setDigest] = useState('')

  const naviClient = new NAVISDKClient({ networkType: 'mainnet' });
  const account = useCurrentAccount();

  const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();

  const getNaviPackageId = async () => {
    const id = await getLatestProtocolPackageId()
    console.log(id)
  }

  const getRealTimeData = async () => {
    const res = await Promise.all([naviClient.getPoolInfo(nUSDC), naviClient.getPoolInfo(Sui)])
    setRealtimeData(res)
  }

  // usdc精度为6
  const getCurrentDateAmount = () => {
    const {
      month,
      date,
      hour,
    } = getCurrentTime()
    // [月][天][小时] 5位
    return parseInt(`${addZero(month)}${addZero(date)}${addZero(hour)}`)

  }
  const startPtb =async () => {
    if (!account) {
      return
    }
    const tx = new Transaction();

    // 存入 1 Sui
    // 获取sui池子配置
    const suiAmount = 1000000000
    const suiPoolConfig: PoolConfig = pool[Sui.symbol as keyof Pool];
    const suiCoin = tx.splitCoins(tx.gas, [suiAmount])
    await depositCoin(tx, suiPoolConfig, suiCoin, suiAmount)
    console.log('存入Sui：', suiAmount)

    // 借出当前时间的nUSDC
    const nUSDCPoolConfig: PoolConfig = pool[nUSDC.symbol as keyof Pool];
    // 借出nUSDC的数量 0.[月][天][小时]
    const nUSDCAmount = getCurrentDateAmount()
    const [borrowBalance] = await borrowCoin(tx, nUSDCPoolConfig, nUSDCAmount)
    console.log('借出 nUSDC：', nUSDCAmount)

    // 归还nUSDC
    await repayDebt(tx, nUSDCPoolConfig, borrowBalance, nUSDCAmount)
    console.log('归还 nUSDC：', nUSDCAmount)

    // 执行ptb
    signAndExecuteTransaction(
      {
        transaction: tx,
      },
      {
        onSuccess: (result) => {
          console.log('executed transaction', result);
          setDigest(result.digest);
        },
        onError: (error) => {
          console.error(error.message)
        }
      }
    )
  }

  useEffect(() => {
    getNaviPackageId()

    getRealTimeData()
    // setInterval(() => {
    //   getRealTimeData()
    // }, 10000)
  }, [])
  return (
    <Container my="2">
      {account ? (
        <Flex direction="column">
          <Text>钱包已连接</Text>
          <Text>Address: {account.address}</Text>
        </Flex>
      ) : (
        <Text>钱包未连接</Text>
      )}
      <div className="ctrl-block">
        <Button onClick={startPtb}>开始ptb</Button>
        <div>{digest}</div>
      </div>
      <Flex align="center" justify="between">
      {
        realtimeData?.map((data, realtimeKey) => (
          <Box width="50%" key={realtimeKey}>
            <Card variant="surface">
              <DataList.Root>
                {
                  data && Object.keys(data).map(key => {
                    if (key !== 'rewardTokenAddress' && key !== 'coin_type') {
                      return (
                        <DataList.Item align="center" key={key}>
                          <DataList.Label minWidth="88px">{ key }</DataList.Label>
                          <DataList.Value>
                            { data[key] }
                          </DataList.Value>
                        </DataList.Item>
                      )
                    }
                  })
                }
              </DataList.Root>
            </Card>
          </Box>
        ))
      }
      </Flex>

    </Container>
  );
}
