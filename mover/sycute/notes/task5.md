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

接下来调用 swap 合约的 `add_liquididity`（在浏览器中操作更方便），参数填写如下：

```bash
Type0: 0x2::sui::SUI
Type1: 0x2d132ce774d7a7063ee2cd79c729dc939719c4bfc80a34d3e015c599c4095f8d::my_coin::MY_COIN
```

