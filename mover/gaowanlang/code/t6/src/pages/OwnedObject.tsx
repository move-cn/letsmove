// 显示连接的钱包地址,持有的objects
import { useCurrentAccount, useSuiClientQuery } from '@mysten/dapp-kit'

function OwnedObject() {
  const currentAccount = useCurrentAccount()

  const { data, isPending, error } = useSuiClientQuery(
    'getOwnedObjects',
    {
      owner: `${currentAccount?.address}`,
    },
    {
      enabled: !!currentAccount,
    },
  )
  if (!currentAccount)
    return

  if (error) {
    return (
      <div>
        Error:
        {error.message}
      </div>
    )
  }
  if (isPending || !data)
    return <div>Loading...</div>

  return (
    <div className="flex flex-col">
      {data.data.length > 0
        ? (
          <span>
            连接的钱包拥有以下对象:
          </span>
          )
        : (
          <span>连接的钱包没有拥有任何对象</span>
          )}
      {data.data.map(obj => (
        <div key={obj.data?.objectId}>
          <span>
            ObjectId:
            {obj.data?.objectId}
          </span>
        </div>
      ))}
    </div>
  )
}

export default OwnedObject
