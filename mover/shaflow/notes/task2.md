## my_coin
编译合约
```
sui move build
```
部署合约
```
sui client publish --gas-budget=100000000 --skip-fetch-latest-git-deps --skip-dependency-verific
ation
```
Transaction Digest: DFQVcciovZhRye42HpiuaQovGTQTBcPai8mM72cZcUeR
packageid:0xbe31730986306e1279ca36ca988497ef42a83b546658ae4faf792ee42270c041
为 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2铸造 mycoin
```
sui client call --function mint --args 0xe290514ee7c0f4b3fc3a3a58f302883d25f6f79c4a8dfca6e2fc5e566b284a46 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 100000000000 --package 0xbe31730986306e1279ca36ca988497ef42a83b546658ae4faf792ee42270c041 --module mycoin --gas-budget=1000000000

```  
hash：F2UxxwNjv3rMGaXRZpx37Eky3myk4PL5b1FG2uHNNv5R  

## faucet coin
编译合约
```
sui move build --skip-fetch-latest-git-deps
```
部署合约
```
sui client publish --gas-budget=100000000 --skip-fetch-latest-git-deps --skip-dependency-verification
```
hash:HL2fPPmLecwNjiGCYZNQgfYnhV6p4mYw8jnN4UVhFF86  
packageid：0x2549ed70c51c37cdc184866e14474d454d55aa8e22cadeceaf3448bc0cf3f811  
领取水
```
sui client call --function airdrop --args 0xc17a3946ec1c728395442489697469d51e12af40d41f4ba61ee39cb828505320  --package 0x2549ed70c51c37cdc184866e14474d454d55aa8e22cadeceaf3448bc0cf3f811 --module faucetcoin --gas
-budget=1000000000
```
hash：GaTmqvL9LZ1nQhT6S6AjAjdY2xJQfHZBVC68yWQ6CDqr