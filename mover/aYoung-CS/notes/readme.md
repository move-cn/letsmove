# sui

## 安装

https://docs.sui.io/guides/developer/getting-started/sui-install
windows直接`choco install sui`就好了

## 连接到sui本地网络

每次执行`sui-test-validator`都是新开一个网络，没有之前的数据

访问本地节点，成功回显：
```shell
ubuntu@VM-16-7-ubuntu:~/sui/target/release$ curl --location --request POST 'http://127.0.0.1:9000' \
> --header 'Content-Type: application/json' \
> --data-raw '{
>   "jsonrpc": "2.0",
>   "id": 1,
>   "method": "sui_getTotalTransactionBlocks",
>   "params": []
> }'
{"jsonrpc":"2.0","result":"2","id":1}
```

### 管理网络

- 切换网络: `sui client switch --env [network alias]`
- 默认网络别名:
  - 本地网 localnet: http://0.0.0.0:9000
  - 开发网 devnet: https://fullnode.devnet.sui.io:443
  - 测试网 testnet: https://fullnode.testnet.sui.io:443
- 列出当前所有网络别名: `sui client envs`
- 添加新的网络别名: `sui client new-env --alias <ALIAS> --rpc <RPC>`

### 查询启用地址和 Gas Objects

- 查询当前保存了密钥的地址: `sui client addresses`
- 查询当前启用的地址: `sui client active-address`
- 列出所拥有的 gas objects: `sui client gas`
- 查询余额：`sui client balance`

## 获取token

在discord频道发消息

或者
```shell
curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "<YOUR SUI ADDRESS>"
    }
}'
```

## sui cli

### 导出私钥

命令行创建的默认钱包，使用`sui keytool export --key-identity <suiAddress>`可以得到以`suiprivkey`开头的私钥

### Package

新建：`sui move new <xxxx>`
测试：`sui move test`或者`sui move test <xxxx>`，后者测试名字包含xxxx的
发布：`sui client publish --gas-budget 100000000`

发布后`init`返回的object id会在object changes - created objects里体现

### call

```
#调用一个没有参数的函数
sui client call [OPTIONS] --package <package id> --module <module名称> --function <函数名> --gas-budget <GAS_BUDGET>
#调用带参数的函数
sui client call [OPTIONS] --package <package id> --module <module名称> --function <函数名> --gas-budget <GAS_BUDGET>  --args <参数1> <参数2>
#调用泛型函数,必须指定所有的类型参数否则会报错
sui client call [OPTIONS] --package <package id> --module <module名称> --function <函数名> --gas-budget <GAS_BUDGET>  --type-args <类型参数1> <类型参数2>
```

> 更多sui cli 使用https://learnblockchain.cn/article/7766

## 语法

### 函数可见性

- private: 默认private；只允许同一 module 内的函数获取
- public: 可以被同一 module 内的函数获取，也可以被其他 module 定义的函数获取

friend和public(friend)已被移除
如果想让函数只对package可见（只有指定模块能调用）：
```move
module pkg::m {
    public(package) fun f() { ... }
}

module pkg::a {
    // this now works directly
    fun calls_f() { ... pkg::m::f() ... }
}
```

### Entry functions

`entry`修饰符允许从可编程事务块（Programmable Transaction Block）直接调用函数，作为模块的“入口点”

以这种方式调用时，传给entry函数的参数必须是transaction block的输入，而不是该块中之前的transactions的结果，也不能被该块中先前的transactions修改。entry函数只允许返回具有drop的类型

> `entry fun call()`  只能Dapp(RPC)调用

### Abilities

- Copy - 被修饰的值可以被复制
- Drop - 被修饰的值在作用域结束时可以被丢弃
- Key - 被修饰的值可以作为键值对全局状态进行访问
- Store - 被修饰的值可以被存储到全局状态

基本类型和内建类型的 abilities 是预先定义好的并且不可改变: integers, vector, addresses 和 boolean 类型的值先天具有 copy，drop 和 store ability

结构体的ability可以指定，需要drop才能被丢弃

### One-Time Witness

OTW，一种特殊的类型，保证只有一个实例。满足下面条件，该类型被认为是OTW：
- 名字和模块名字相同，全大写
- 只有drop ability
- 没有字段，或只有一个bool字段

包含它的package被published的时候，该类型的唯一实例被传递给其module的init函数
`sui::types::is_one_time_witness` 检查类型是否可以用作OTW

eg.
```move
module examples::mycoin {

    /// Name matches the module name
    struct MYCOIN has drop {}

    /// The instance is received as the first argument
    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        /* ... */
    }
}
```

### Event

Move event structure
An event object in Sui consists of the following attributes:

- id: JSON object containing the transaction digest ID and event sequence.
- packageId: The object ID of the package that emits the event.
- transactionModule: The module that performs the transaction.
- sender: The Sui network address that triggered the event.
- type: The type of event being emitted.
- parsedJson: JSON object describing the event.
- bcs: Binary canonical serialization value.
- timestampMs: Unix epoch timestamp in milliseconds.

使用`event::emit`在想要监视的操作触发时触发事件

subscribe事件（以typescript sdk为例）
```typescript
import { JsonRpcProvider, testnetConnection } from '@mysten/sui.js';

// Package is on Testnet.
const provider = new JsonRpcProvider(testnetConnection);
const Package = '<PACKAGE_ID>';

const MoveEventType = '<PACKAGE_ID>::<MODULE_NAME>::<METHOD_NAME>';

console.log(
	await provider.getObject({
		id: Package,
		options: { showPreviousTransaction: true },
	}),
);

let unsubscribe = await provider.subscribeEvent({
	filter: { Package },
	onMessage: (event) => {
		console.log('subscribeEvent', JSON.stringify(event, null, 2));
	},
});

process.on('SIGINT', async () => {
	console.log('Interrupted...');
	if (unsubscribe) {
		await unsubscribe();
		unsubscribe = undefined;
	}
});
```

响应返回：
```json
subscribeEvent {
  "id": {
    "txDigest": "HkCBeBLQbpKBYXmuQeTM98zprUqaACRkjKmmtvC6MiP1",
    "eventSeq": "0"
  },
  "packageId": "0x2d6733a32e957430324196dc5d786d7c839f3c7bbfd92b83c469448b988413b1",
  "transactionModule": "coin_flip",
  "sender": "0x46f184f2d68007e4344fffe603c4ccacd22f4f28c47f321826e83619dede558e",
  "type": "0x2d6733a32e957430324196dc5d786d7c839f3c7bbfd92b83c469448b988413b1::coin_flip::Outcome",
  "parsedJson": {
    "bet_amount": "4000000000",
    "game_id": "0xa7e1fb3c18a88d048b75532de219645410705fa48bfb8b13e8dbdbb7f4b9bbce",
    "guess": 0,
    "player_won": true
  },
  "bcs": "3oWWjWKRVu115bnnZphyDcJ8EyF9X4pgVguwhEtcsVpBf74B6RywQupm2X",
  "timestampMs": "1687912116638"
}
```


## coin

### Fungible token

`Coin<T>`代表开环可替代代币（open-loop fungible tokens），`Token<T>`代表闭环代币（closed-loop tokens）
由其类型参数`T`命名
`Coin<T>`持有的`T`单位可以与任何其他`T`单位互换

### Treasury capability

用`coin::create_currency`函数创建coin后，创建coin的合约发布者收到一个`TreasuryCap`对象，用来mint或burn。`TreasuryCap`对象可转移

### Regulated coins

`coin::create_regulated_currency`可以创建受监管的coin，函数内部调用`coin::create_currency`，并返回`DenyCap`capability，`DenyCap`capability允许维护一个不允许使用tokens的地址列表

无法使用的地址保存在`DenyList`共享对象；相关操作函数：`coin::deny_list_add`,`coin::deny_list_remove`,`coin::deny_list_contain`

### Coin metadata

通常智能合约创建coin时用`transfer::public_freeze_object`冻结coin的metadata；regulated coin创建时自动冻结其metadata

普通coin对应`CoinMetadata`对象
regulated coin对应`RegulatedCoinMetadata`对象，多包含deny list信息

`CoinMetadata`：id、decimals、name、symbol、description、icon_url

`RegulatedCoinMetadata`：id、coin_metadata_object、deny_cap_object

### Mint

```move
public fun mint<T>(
  cap: &mut coin::TreasuryCap<T>, 
  value: u64, 
  ctx: &mut tx_context::TxContext
): coin::Coin<T>
```

函数自动更新`TreasuryCap `的总供给量

### Burn

```move
public entry fun burn<T>(
  cap: &mut coin::TreasuryCap<T>, 
  c: coin::Coin<T>
): u64
```

返回供应量减少的数量

## nft

Non-fungible token

### 动态 NFT（dNFT）

静态 NFT 的迭代，可以根据数据的反馈实时更改 NFT 的数据
dNFT 接受「链上数据」和「链下数据」
链上数据可以通过智能合约直接访问，链下数据则需要由名为「预言机（Oracle）」的实体验证后，再添加到区块链中

### ERC21

以太坊上最早也是最基础的NFT底层协议标准。作为一种**非同质化**代币智能合约标准接口，允许发行基于ERC721的NFT，它规定了NFT资产的最小单位为1、不可拆分且非同质化（独一无二）的特性，ERC721是目前NFT资产的主要规范标准与基础之一（并也为其他链上NFT标准的制定提供了参照），目前以太坊绝大多数NFT都是ERC721标准的

