// 钱包状态组件
import { useCurrentAccount } from '@mysten/dapp-kit'
import { Card, CardContent, CardHeader } from '@/components/ui/card.tsx'
import OwnedObject from '@/pages/OwnedObject.tsx'

function WalletStatus() {
  const currentAccount = useCurrentAccount()
  return (
    <Card>
      <CardHeader> 账号状态 </CardHeader>
      <CardContent>
        {currentAccount
          ? (
            <>
              <div>
                钱包已连接
              </div>
              <div>
                {currentAccount.address}
              </div>
            </>
            )
          : <div>未连接钱包</div>}
        <OwnedObject />
      </CardContent>
    </Card>
  )
}

export default WalletStatus
