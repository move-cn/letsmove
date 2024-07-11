
## 部署测试币，管理员各 10000 个，并转移给 Alice 1000 个
```
sui client publish

sui client call --package 0xe43565c32957c9c433a129466038e58b91a1f5eab67ea23c508e8cf33581bfec --module YJSHI2015 --function mint --args 0x91eea83e3ac40d4fe6ee29e224e3bd8d94207ebd38d2e46ea5b06283cdca91f9 10000 0xc494732d09de23389dbe99cb2f979965940a633cf50d55caa80ed9e4fc4e521e

sui client call --package 0xe43565c32957c9c433a129466038e58b91a1f5eab67ea23c508e8cf33581bfec --module YJSHI2015FAUCET --function mint --args 0x46e95d6c4952ca3a49a07f7e8b1d2080c8d1f2005487fcfd65f0325203bf03b7 10000 0xc494732d09de23389dbe99cb2f979965940a633cf50d55caa80ed9e4fc4e521e

```
## 部署 swap 合约
```
sui client publish
```

## 创建流动性池子
```
sui client call --package 0x720963b103e2190780ecf74ce503ec2c84955d857d4da5ccb0ff60852a87025e --module coin_swap --function create_pool --args 0x3959e370aed0e58e086cbcb25dca8edd3864982939e1d1d10aebdc1090bb7d47  --type-args 0xe43565c32957c9c433a129466038e58b91a1f5eab67ea23c508e8cf33581bfec::YJSHI2015::YJSHI2015 0xe43565c32957c9c433a129466038e58b91a1f5eab67ea23c508e8cf33581bfec::YJSHI2015FAUCET::YJSHI2015FAUCET
```

## 管理员添加流动性，各 2000 个
池子对象ID：0x109f76856e264b7a41bd6d69d49ff9049be480b15a5450aab14372182508b90b
```
sui client call --package 0x720963b103e2190780ecf74ce503ec2c84955d857d4da5ccb0ff60852a87025e --module coin_swap --function add_liq --args 0x10b552a049dad419ec35b157ab2ad8a9bda3916d2b0289cfe7d565edbae58967 0x1a23c557203b3fe7a13bb3ea7f427ae5d8996082950ec9a528d7e5f6bd91eb1c  0x109f76856e264b7a41bd6d69d49ff9049be480b15a5450aab14372182508b90b --type-args 0xe43565c32957c9c433a129466038e58b91a1f5eab67ea23c508e8cf33581bfec::YJSHI2015::YJSHI2015 0xe43565c32957c9c433a129466038e58b91a1f5eab67ea23c508e8cf33581bfec::YJSHI2015FAUCET::YJSHI2015FAUCET

```

## swap，Alice 使用 100 个 TokenA 兑换 100 个 TokenB
```
// 先把 Alice 的 1000 个 TokenA 拆成 100 + 900 个
sui client call --package 0x2 --module pay --function split_and_transfer --args 0xaff0c81277f056728a8f215577c2747703b00210fb4b2e8d8194cde50430f26d 100 0xc4301a727914c051c987331f30d002ef907f6f6e4badfec8981e6275ed22486c --type-args 0xe43565c32957c9c433a129466038e58b91a1f5eab67ea23c508e8cf33581bfec::YJSHI2015::YJSHI2015 --gas-budget 100000000

sui client call --package 0x720963b103e2190780ecf74ce503ec2c84955d857d4da5ccb0ff60852a87025e --module coin_swap --function swap_x2y --args 0xdc67573571e6b91a2bb4544ae776748715ef2aec83304b3960a67eca5a36cdb4   0x109f76856e264b7a41bd6d69d49ff9049be480b15a5450aab14372182508b90b --type-args 0xe43565c32957c9c433a129466038e58b91a1f5eab67ea23c508e8cf33581bfec::YJSHI2015::YJSHI2015 0xe43565c32957c9c433a129466038e58b91a1f5eab67ea23c508e8cf33581bfec::YJSHI2015FAUCET::YJSHI2015FAUCET

```