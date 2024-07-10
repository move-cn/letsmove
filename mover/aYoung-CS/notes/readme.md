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
发布：`sui client publish `

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

### 查看object

```shell
sui client objects
sui client objects <ADDR>
sui client object <OBJECT_ID>
```

## 语法

### Struct

只有模块内才能访问结构体字段，模块外结构体字段是不可见的
要外部可读 实现getter方法

### Object

对象在Sui上存储，维护了一个全局的Map数据结构 Map<ID,object>

必须有`key`能力
第一个字段是`id`，类型`sui::object::UID`
为 Sui 对象创建新对象的唯一方法UID是调用`object::new`，该函数将当前事务上下文作为生成唯一 ID 的参数

### Object ownership

每个对象都有一个owner字段，有4种不同类型的所有权

#### address-owned objects

由一个地址拥有
使用下面函数之一创建
```move
public fun transfer<T: key>(obj: T, recipient: address)
public fun public_transfer<T: key + store>(obj: T, recipient: address)
```

自定义transfer策略，用`sui::transfer::transfer`
有`store`能力，用`sui::transfer::public_transfer`

访问adress-owned obj：
- 所有者对应object id，则必须在transaction执行期间使用`Transfer to Object`中定义的机制访问并动态验证它
- 所有者对应签名派生的地址（账户地址），可以在执行transaction期间将其左右拥有的对象直接使用和访问，其他地址不能在transaction中以任何方式访问

#### Immutable objects

不可变对象是不能被改变、转移或删除的，没有所有者，任何人都可以使用

下面函数将一个对象转变为不可变对象，操作不可逆
```move
public native fun public_freeze_object<T: key>(obj: T);
```

只能将不可变对象作为只读、不可变的引用`&T`传递给函数

`test_scenario::take_immutable<T>`获取
`test_scenario::return_immutable`返回
`test_scenario::has_most_recent_for_sender`对不可变对象返回false

#### shared object

用`sui::transfer::share_object`共享，都可以访问，需要`key`能力

`sui::transfer::share_object`创建共享对象
需要共识来排序读取和写入

#### Wrapped Objects

要在sui对象结构（有`key`能力）嵌入一个结构体类型，该结构体类型要有`store`能力

swap
```move
struct SwapRequest has key {
    id: UID,
    owner: address,
    object: Object,
    fee: Balance<SUI>,
}
```

swap请求
```move
public fun request_swap(
    object: Object,
    fee: Coin<SUI>,
    service: address,
    ctx: &mut TxContext,
) {
    assert!(coin::value(&fee) >= MIN_FEE, EFeeTooLow);

    let request = SwapRequest {
        id: object::new(ctx),
        owner: tx_context::sender(ctx),
        object,
        fee: coin::into_balance(fee),
    };

    transfer::transfer(request, service)
}
```

之后第三方调用`execute_swap`
```move
public fun execute_swap(s1: SwapRequest, s2: SwapRequest): Balance<SUI>;
```

然后unpack，检查，转移，删除`SwapRequest`对象，最后返回费用
```move
let SwapRequest {id: id1, owner: owner1, object: o1, fee: fee1} = s1;
let SwapRequest {id: id2, owner: owner2, object: o2, fee: fee2} = s2;

assert!(o1.scarcity == o2.scarcity, EBadSwap);
assert!(o1.style != o2.style, EBadSwap);

transfer::transfer(o1, owner2);
transfer::transfer(o2, owner1);

object::delete(id1);
object::delete(id2);

balance::join(&mut fee1, fee2);
fee1
```

例子：https://github.com/MystenLabs/sui/tree/main/examples/move/trusted_swap


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

### On-Chain Randomness

```move
entry fun roll_dice(r: &Random, ctx: &mut TxContext): Dice {
  let generator = new_generator(r, ctx); // generator is a PRG
  Dice { value: random::generate_u8_in_range(&mut generator, 1, 6) }
}
```

为了安全访问随机：
- 定义函数(private)`entry`
- 生成随机数时，建议使用函数级别`RandomGenerator`，避免状态变量收到其他合约的影响
- 异常情况（unhappy path）消耗的gas不应超过正常情况（happy path）

要使用`entry`修饰，否则攻击者可以部署合约直接进行`extract`，返回空则提取失败，触发异常从而造成transaction revert，猜错就中止交易退回手续费

即使函数定义为`entry play_dice(guess: u8, fee: Coin<SUI>, r: &Random, ctx: &mut TxContext): Option<GuessedCorrectly> { … }`，攻击者可以构造PTB攻击
发布一个函数
```move
public fun attack(output: Option<GuessedCorrectly>): GuessedCorrectly {
  option::extract(output)
}
```
然后发送一个PTB，包含两个指令：play_dice(...)和attack(Result(0))。Result(0)是第一个指令play_dice的返回结果
由于PTB是原子执行的，如果猜测失败，play_dice支付的手续费会被全部revert回去，攻击者不会损失任何费用

为了防止这种基于PTB的攻击，Sui引入了一个新的限制:
如果一个PTB中，在使用了Random作为输入的MoveCall指令之后，还包含了非TransferObjects或MergeCoins的其他指令，Sui将拒绝执行该PTB

Move编译器会拒绝`public`的函数将`RandomGenerator`作为参数类型，确保`RandomGenerator`只能在模块内部使用，不被外部代码访问

要让happy path的gas更高，否则如果happy path的gas比unhappy path 的低，攻击者提供gas只cover happy path，则结果只会是win或者revert transaction（且不会失去支付的费用）

`Profile a transaction`可以验证不同flow的成本

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

### letsmove

task2: 修改了一下之前写的，share出TreasuryCap让所有人都可以mint

task4: 参考Coin Flip写，GameData记录游戏信息，可以通过initial函数初始化，等同于做庄家，得到一个game_data共享对象，玩家可以通过这个共享对象参与游戏，开游戏的creator可以增加奖池（balance），收走奖金，收取手续费
mygame.move里面可以通过start_game参与一局游戏，输入一个0-100的数字并下注，通过finish_game结束游戏，随机数由交易哈希产生，如果guess和随机数差值>50则获胜，玩家下的注和庄家的奖池合并作为所有赌注，赢了收取20%手续费，剩下的给玩家，输了则玩家下的注被加入奖池

task4中将task2的faucet coin作为依赖引入，修改faucet_coin的move.toml，增加`published-at = <Address>`，并修改`[addresses]`下的`faucet_coin = <Address>`，然后task4的move.toml中，`[dependencies]`内增加`faucet_coin = { local = "../../task2/faucet_coin"}`，之后代码中使用`use faucet_coin::AYOUNG_FAUCET_COIN::AYOUNG_FAUCET_COIN;`导入