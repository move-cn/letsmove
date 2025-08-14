task2 发布了两个代币，其中 my_coin 的 packgageID 如下：

```bash
my_coin: 0x2d132ce774d7a7063ee2cd79c729dc939719c4bfc80a34d3e015c599c4095f8d
```

另一种代币用 Sui，则这两种代币的 type 分别是

```bash
my_coin: 0x2d132ce774d7a7063ee2cd79c729dc939719c4bfc80a34d3e015c599c4095f8d::my_coin::MY_COIN
Sui: 0x2::sui::SUI
```

先 mint 一些 MY_COIN 到自己账户，这里`0x75856288b7609c28a9864711ff30134706050c522ec1d8ba9e40d1833aa16045`换成自己的地址。

```bash
sui client call --function mint --module my_coin --package  0x2d132ce774d7a7063ee2cd79c729dc939719c4bfc80a34d3e015c599c4095f8d --args 0x8d900f465f22d9185c445d7b0a9374dd444a653138f06ebc1d1e144bcefe433f 2000000000000 0x75856288b7609c28a9864711ff30134706050c522ec1d8ba9e40d1833aa16045 --gas-budget 90000000
```

接下来调用 swap 合约的 `new_pool`（在浏览器中操作更方便），参数填写如下：

```bash
type0: 0x2::sui::SUI
type1: 0x2d132ce774d7a7063ee2cd79c729dc939719c4bfc80a34d3e015c599c4095f8d::my_coin::MY_COIN
arg0: 0x0b33527a8e0ce8b4b4b8590c4d29b0911539bf79fba8763c8f137c2ef985ac13
arg1: 0x6cc44e40d6bf756619121812c6db6b57b6fcb64a96f65413ee9569d1aecb47f8
```

记下创建出来的共享 Pool_ID，`0xa7c1e8b452e517c5b630ff89555a8ec848869e9643edf96e2de2675aec01889f`

接下来调用 swap 合约的 `swap_b_to_a` 函数 ，参数填写如下

```bash
type0: 0x2::sui::SUI
type1: 0x2d132ce774d7a7063ee2cd79c729dc939719c4bfc80a34d3e015c599c4095f8d::my_coin::MY_COIN
arg0: 0xa7c1e8b452e517c5b630ff89555a8ec848869e9643edf96e2de2675aec01889f
arg1: 0x76f65141d4f42a39ede914468ba5dc0d1dccffab024768f280c581479006fe58
```

该交易记录：https://suiscan.xyz/testnet/tx/coZfatvk97FimLkGmCZe1aybPjiZ62Lgbb9d9L2wuJg
