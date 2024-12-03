# sui中一些操作和方法
use sui::balance::Balance

// Balance 结构体可以存储代币，避免管理过多对象
struct Game {
    id:UID,
    amt : Balance<SUI>
}
// 设置余额为零
balance::zero<SUI>()

// 将对象共享出去
share_object(game);

// 定义外部调用方法,使用Random的函数不能用public修饰
entry fun play(game:&mut Game,rand:&Random,in:bool,amt:Coin<SUI>,ctx){}

// 将Coin转为Balance
let in_amt_balance:Balance<> = coin::into_balance(amt);

// 使用balance相加
balance::join(game.amt,in_amt_balance);

// 从coin对象中取值
let val = amt.value() 

// 将game中余额拿出来一部分
let out_balance = game.amt.split(val)

// balance没有key能力，不能直接放入账户中
let out_coin = coin::from_balance(out_balance,ctx)

// 函数中使用&Random，外面直接传0x8
// 创建随机数生成器
// 生成随机数
let  mut gen = random::new_generator(rand,ctx);
let value = random::generate_bool(&mut gen);

# 命令
```shell

# 学习文档
https://move.sui-book.com/your-first-move/hello-world.html

# task代码
https://github.com/hoh-zone/move-bootcamp

# fork分支
https://github.com/move-cn/letsmove

# 配置代理拉取代码
git clone -c http.proxy="127.0.0.1:2334" https://github.com/fengfengxiong123/letsmove.git

# 配置git代理
git config --global https.proxy https://127.0.0.1:2334
git config --global http.proxy http://127.0.0.1:2334

git config --global --unset http.proxy
git config --global --unset https.proxy

# 查看版本
sui -V

# 零测试网sui币
sui client faucet

# 添加环境
sui client new-env --alias devnet --rpc https://fullnode.devnet.sui.io:443

# 正在使用的地址
sui client active-address

# 查看gas
sui client gas

# 创建新项目
sui move new xxx

# 发布上链
cd xxx
sui client publish

# 测试网查看package地址
https://testnet.suivision.xyz/

# 测试网查询的哈希
Transaction Digest: FuxCGHzDKWHko7UfiCxZbUFa7a7KKSLbdwPVgZyNt5Bc

# 找到package id
changes页 - Type为package/action为published

# PACKAGE_ID
0x8eff1442cf00ea873b5d76ebda77d3436503b2f9acdf51da77a007911abe5667

# 账户
0xd4d7fd4aef735c6da8d394c3f71f9ed5cd48ab277fe2be51c5b13761c0a5300c

# 使用ptb构建交易
sui client ptb \
--gas-budget 100000000 \
--assign sender @$MY_ADDRESS \
--move-call $PACKAGE_ID::todo_list::new \
--assign list \
--transfer-objects "[list]" sender

sui client ptb \
--gas-budget 100000000 \
--assign sender @0xd4d7fd4aef735c6da8d394c3f71f9ed5cd48ab277fe2be51c5b13761c0a5300c \
--move-call 0x8eff1442cf00ea873b5d76ebda77d3436503b2f9acdf51da77a007911abe5667::todo_list::new \
--assign list \
--transfer-objects "[list]" sender


# LIST_ID
0xb4e0cc01ad7bcb4bd3debdcb8bfa437b42435c313e2b05a28506dcb4779e49fa

# ptb交易
sui client ptb \
--gas-budget 100000000 \
--move-call 0x8eff1442cf00ea873b5d76ebda77d3436503b2f9acdf51da77a007911abe5667::todo_list::add @0xb4e0cc01ad7bcb4bd3debdcb8bfa437b42435c313e2b05a28506dcb4779e49fa "'Finish the Hello, Sui chapter'"



# 查看list_id 
sui client object 0xb4e0cc01ad7bcb4bd3debdcb8bfa437b42435c313e2b05a28506dcb4779e49fa


# 链式命令
sui client ptb \
--gas-budget 100000000 \
--move-call $PACKAGE_ID::todo_list::add @$LIST_ID "'Finish Concepts chapter'" \
--move-call $PACKAGE_ID::todo_list::add @$LIST_ID "'Read the Move Basics chapter'" \
--move-call $PACKAGE_ID::todo_list::add @$LIST_ID "'Learn about Object Model'" \
--move-call $PACKAGE_ID::todo_list::remove @$LIST_ID 0

sui client ptb \
--gas-budget 100000000 \
--move-call 0x8eff1442cf00ea873b5d76ebda77d3436503b2f9acdf51da77a007911abe5667::todo_list::add @0xb4e0cc01ad7bcb4bd3debdcb8bfa437b42435c313e2b05a28506dcb4779e49fa "'Finish Concepts chapter'" \
--move-call 0x8eff1442cf00ea873b5d76ebda77d3436503b2f9acdf51da77a007911abe5667::todo_list::add @0xb4e0cc01ad7bcb4bd3debdcb8bfa437b42435c313e2b05a28506dcb4779e49fa "'Read the Move Basics chapter'" \
--move-call 0x8eff1442cf00ea873b5d76ebda77d3436503b2f9acdf51da77a007911abe5667::todo_list::add @0xb4e0cc01ad7bcb4bd3debdcb8bfa437b42435c313e2b05a28506dcb4779e49fa "'Learn about Object Model'" \
--move-call 0x8eff1442cf00ea873b5d76ebda77d3436503b2f9acdf51da77a007911abe5667::todo_list::remove @0xb4e0cc01ad7bcb4bd3debdcb8bfa437b42435c313e2b05a28506dcb4779e49fa 0

# 查看list_id 
sui client object 0xb4e0cc01ad7bcb4bd3debdcb8bfa437b42435c313e2b05a28506dcb4779e49fa


```

## task2 调用命令
```shell
sui client call \
  --package 0x1234567890abcdef \
  --module MyCoin \
  --function mint \
  --args \
    "0xdeadbeef" \
    "1000" \
    "0xrecipient_address" \
  --gas-budget 2000
  

 sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args 0x375aa2e13fdd2b740ed93c9b90e0a1353875b721c2872925e50b92366c65e599::dao::DAO \
  --args \
    0x1021116270d1bee0eaabd4353a2b998009c74f86573df54a37a291cab33782d1 \
    1000000000 \
    0xd790d41adfffd48df8e38607991a297970743decff87517e647008a652587d4c 
    
```

## 共享币
```shell
 sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args 0x71d67141b2c06e7abdf6829aa2ca8e36cb469fe304519e084c3f29e9e6244824::dao::DAO \
  --args \
    0x7a2079da6aa6a74d5a3466f98afe96a47cecca0be6c79ef151aa370720f855fd \
    1000000000 \
    0x1cf6273dc8d5f7f8189fbae937741434d388fefeabe029ac128c2fed67633498 
```

## 主网
Digest: 9VCLdmeCVTtbcHs6ygV96YYMMSF3qnWrz1o6Aadx84QL

账户：0x1cf6273dc8d5f7f8189fbae937741434d388fefeabe029ac128c2fed67633498
pkg id : 0xae412de9df987063117db968d17e8f4dfa16b92f5f9527e36af47af427070b83

### coin对象id
obj id : 0x56d0bb3c37de365e23a2c56180601da49d8b23794b45119f4fbb4c64deb1825a
ObjectType: 0x2::coin::CoinMetadata<0xae412de9df987063117db968d17e8f4dfa16b92f5f9527e36af47af427070b83::faucetcoin::FAUCETCOIN> 

ObjectID: 0x6a64c9dbce72db96f7cc9cd7be8531f546a5ca3e9ebc43da2569f5e354bd6487
ObjectType: 0x2::coin::CoinMetadata<0xae412de9df987063117db968d17e8f4dfa16b92f5f9527e36af47af427070b83::dao::DAO>  

### TreasuryCap信息
DAO TreasuryCap obj id : 0xe880375ea3d82755a9c387bf3fb705a9bbc5982afc5d16349773e162754a9b86
faucet coin TreasuryCap obj id ： 0x56d0bb3c37de365e23a2c56180601da49d8b23794b45119f4fbb4c64deb1825a

## mint dao
```shell
 sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args 0xae412de9df987063117db968d17e8f4dfa16b92f5f9527e36af47af427070b83::dao::DAO \
  --args \
    0xe880375ea3d82755a9c387bf3fb705a9bbc5982afc5d16349773e162754a9b86 \
    7000000000 \
    0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \
   --gas-budget 100000000
```

## mint faucet coin

```shell
 sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args 0xae412de9df987063117db968d17e8f4dfa16b92f5f9527e36af47af427070b83::faucetcoin::FAUCETCOIN \
  --args \
    0x56d0bb3c37de365e23a2c56180601da49d8b23794b45119f4fbb4c64deb1825a \
    8000000000 \
    0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \
   --gas-budget 100000000
```
--args 第一个是 FAUCETCOIN 所在对象的id
## 使用sui cli转账
sui client transfer-sui --to 0x2e312e10390700d045ae462dcac090354bda4a81dc151c0d538a250beb0492f5 --amount 13266772 --sui-coin-object-id 0x1feb5ad79c303c52cca592272203b259119fc3fb02e037209ceaf9570474ce08  --gas-budget 100000000

## task3 
摘要： Hjn95SsHsm59si6zVhcLamy7wL7KS8Vx6YYbbXuQecXZ