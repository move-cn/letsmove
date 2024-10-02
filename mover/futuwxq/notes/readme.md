##   01 hello move  

[x] 日志：

mac安装sui 直接使用brew安装 1.23.0版本，然后配置测试rpc地址， sui client new-env --alias <ALIAS> --rpc <RPC>，
然后通过sui client switch --env testnet 切换到测试网，然后通过sui client new-address <KEY_SCHEME>创建一个本地钱包，
保存好助记词，然后在sui钱包插件上领点测试币,然后通过sui move new task_1 创建move项目。

创建出的项目需要在sources下创建一个move文件，创建一个Hello结构体，has key表示拥有key ablity，每次实例化Hello结构体都会通过
object::new(ctx)创建一个新的id，init方法会在部署时触发。

最后先通过sui move build构建 看有没有问题，没问题后通过sui client publish 部署到测试网。

##   02 move coin

[x] 日志：

制作自己的FT这一节，和其他语言不同的是move将很多细节都封装好了，只需要调用即可。

参考官网[https://docs.sui.io/guides/developer/sui-101/create-coin]造币这一节主要用到了coin模块的`create_currency`函数，这个函数接收一系列参数,包含witness（保证FT金库只会被创建一次），币种精度，名字，币的logo, 交易上下文（sui的vm创建）：
```rust
public fun create_currency<T: drop>(
    witness: T,
    decimals: u8,
    symbol: vector<u8>,
    name: vector<u8>,
    description: vector<u8>,
    icon_url: Option<Url>,
    ctx: &mut TxContext
): (TreasuryCap<T>, CoinMetadata<T>) {}
```
再通过transfer模块的`public_freeze_object`设置币种冻结。

最后通过transfer模块的`public_transfer`将币种权限transfer给部署地址，这样只有部署地址才能mint,其他地址是无法mint的。

如果是测试币，也就是水龙头币的话，需要用transfer的`public_share_object`方法，让创造的代币成为每个人都可以访问和改变的可变共享对象。

铸造需要用到coin的`mint_and_transfer`方法，燃烧用到coin的`burn`方法。

最后将主网的coin通过mint方法发给task地址。

##   03 move NFT

[x] 日志：

 NFT表示非同质化代币，也就是每一次mint的nft都是独一无二的，在move中生成NFT可以使用display模块的`new_with_fields`方法
 创建一个可以显示图片的object。

 `new_with_fields`函数接收多个参数：
 ```rust
 public fun new_with_fields<T: key>(
    pub: &Publisher, fields: vector<String>, values: vector<String>, ctx: &mut TxContext
): Display<T> {}
 ```
 第一个参数需要一个发布者结构体，需要通过package模块的`claim`函数确定一个发布者，其实就是部署的地址，需要注意的是`claim`函数接收一次性证明和交互上下文参数
 ```rust
 public fun claim<OTW: drop>(otw: OTW, ctx: &mut TxContext): Publisher {}
 ```

 通过这些函数创建的Display结构体还需要通过display模块的`update_version`方法更新每个NFT的版本，保证每个NFT都是独一无二的。

 最后通过transfer的`public_transfer`方法将生成的NFT转移给部署地址。


