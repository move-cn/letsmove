

## my coin 
-- 

```shell
 sui move build --skip-fetch-latest-git-deps

# testnet
sui client publish --skip-fetch-latest-git-deps
Transaction Digest: EMoZPucPYzKqMuDjz5H1xeWGNnEoZNAQhjRngZD1vZ6C
PackageID: 0xb3a01d23dcc9c2631d949af2f7bfdc4aa4f466b3018a6b4f45629ee2ff516dd8                                                                              │
ObjectID: 0x2c350c3cf19db2a704e64a39f1d5a0767fc16e79d515b903d1c325cd35e00403

# 0xb3a01d23dcc9c2631d949af2f7bfdc4aa4f466b3018a6b4f45629ee2ff516dd8
   --gas-budget 10000000
sui client call --package 0x2 --module coin --function mint_and_transfer \
--type-args 0xb3a01d23dcc9c2631d949af2f7bfdc4aa4f466b3018a6b4f45629ee2ff516dd8::creatoryuan_coin::CREATORYUAN_COIN \
--args "0x75eee2a5666cb3b969c872fe9c520898782e48a93816aa5d07b740c480e6ddc3" 100000000 0x0d84de6050a42cd695d1b71aaf58ade0db2514a3a11a153b1e1afec62210d24c
Transaction Digest: BHUHcbCu9xYVjCqQDBxWZec63FyUYbfFdLr5vqmMZW8X
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0xb3a01d23dcc9c2631d949af2f7bfdc4aa4f466b3018a6b4f45629ee2ff516dd8::creatoryuan_coin::CREATORYUAN_COIN --args "0x75eee2a5666cb3b969c872fe9c520898782e48a93816aa5d07b740c480e6ddc3" 10000000 0x0d84de6050a42cd695d1b71aaf58ade0db2514a3a11a153b1e1afec62210d24c
Transaction Digest: GBZAQTGkWkopkYqBTR1LtchUXxchCGiq9aVZVBNLV8Zk
0x75eee2a5666cb3b969c872fe9c520898782e48a93816aa5d07b740c480e6ddc3

sui client call --package 0x2 --module coin --function mint_and_transfer \
--type-args 0xb3a01d23dcc9c2631d949af2f7bfdc4aa4f466b3018a6b4f45629ee2ff516dd8::creatoryuan_coin_faucet::CREATORYUAN_COIN_FAUCET \
--args "0xec5a1dab9cbda797b6ec4d053bcc705eb6262a5e65b24059bc648936befcaed2" 100000000 0x0d84de6050a42cd695d1b71aaf58ade0db2514a3a11a153b1e1afec62210d24c
Transaction Digest: 2X1x3UAqY2Dt3wuV1CmQE7wNixhcvWvPgZXEy8i9zaHn

sui client transfer --to 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --object-id  0x98edec905780605c94181b85d0d8ae87193d8605e4cacd765fcef47233508e4f
Transaction Digest: 7sVu2yRdcCx723W6JbTRhnDBidKfhcWVsTeN7wLgPteG


######### mainnet
sui client publish --skip-fetch-latest-git-deps
# Transaction Digest: 3K3x5phePmPg4mgjDHBvgZpZ9TbwF984nCvn4sHNW2io
# PackageID: 0x4700c160a3f4ea9fc84bc56fde8f7f02da283bee1c8b1758fd573f488f6c006e

sui client call --package 0x2 --module coin --function mint_and_transfer \
--type-args 0x4700c160a3f4ea9fc84bc56fde8f7f02da283bee1c8b1758fd573f488f6c006e::creatoryuan_coin::CREATORYUAN_COIN \
--args "0xad930714cb148fb483187400d9e4f90b136c029dc10d14ec416bf1c8328a4547" 100000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
# Transaction Digest: 7sau5AWKGJBQDKxWryrrNKPCXtMVUDyr5joufvAQ1tVZ

sui client call --package 0x2 --module coin --function mint_and_transfer \
--type-args 0x4700c160a3f4ea9fc84bc56fde8f7f02da283bee1c8b1758fd573f488f6c006e::creatoryuan_coin::CREATORYUAN_COIN \
--args "0xad930714cb148fb483187400d9e4f90b136c029dc10d14ec416bf1c8328a4547" 100000000 0xf6811db11e9e7840efab14e32de8594c4133cc5998eec2e8e98bcb4ad73c70da
# Transaction Digest: CcNe9LrQKqNTje8pfzhKZbVuMdVqPW95fpDWnmM7Up8D

sui client call --package 0x2 --module coin --function mint_and_transfer \
--type-args 0x4700c160a3f4ea9fc84bc56fde8f7f02da283bee1c8b1758fd573f488f6c006e::creatoryuan_coin::CREATORYUAN_COIN \
--args "0xad930714cb148fb483187400d9e4f90b136c029dc10d14ec416bf1c8328a4547" 100000000 0x0d84de6050a42cd695d1b71aaf58ade0db2514a3a11a153b1e1afec62210d24c
# Transaction Digest: 3YjJwd4aKnfSVXaQAWEKvaZXYkegVU65DSAuHSVMqZEt

sui client call --package 0x2 --module coin --function mint_and_transfer \
--type-args 0x4700c160a3f4ea9fc84bc56fde8f7f02da283bee1c8b1758fd573f488f6c006e::creatoryuan_coin_faucet::CREATORYUAN_COIN_FAUCET \
--args "0x73e179fb3059a19c6d86b6e1383ee2b7bec06c61f10f66311ed55b545eaad9d3" 100000000 0x0d84de6050a42cd695d1b71aaf58ade0db2514a3a11a153b1e1afec62210d24c
# Transaction Digest: HYBCdN21XNYe2TBokjTNRNPi3VUiD81HbVPgQ6C2niYk


sui client call --package 0x2 --module coin --function mint_and_transfer \
--type-args 0x4700c160a3f4ea9fc84bc56fde8f7f02da283bee1c8b1758fd573f488f6c006e::creatoryuan_coin_faucet::CREATORYUAN_COIN_FAUCET \
--args "0x73e179fb3059a19c6d86b6e1383ee2b7bec06c61f10f66311ed55b545eaad9d3" 100000000 0xf6811db11e9e7840efab14e32de8594c4133cc5998eec2e8e98bcb4ad73c70da
# Transaction Digest: 4Ut8uMb6yYBLGKiEJ2n4gyaSUhvmGWrCUCFKVobRudwR

```

## my nft 
- mainnet publish AMHyMemSbqgdrEeLMGHyJKQd6HnLq7LkvpU8zUAHaJez
- mainnet mint 

```shell
sui.exe client call --package <PACKAGE> --module <MODULE> --function <FUNCTION>
sui.exe client transfer --to <TO> --object-id <OBJECT_ID>


# mainnnet
sui client publish --skip-fetch-latest-git-deps
sui client publish --skip-dependency-verification --skip-fetch-latest-git-deps
# AMHyMemSbqgdrEeLMGHyJKQd6HnLq7LkvpU8zUAHaJez

sui client call --package 0x60cea112ab74106087f3d8ccd783af45cceca73a0c3d250ffe9451ac91c081e6 --module my_nft --function mint --args "CreatorYuan mint NFT" "https://vcg05.cfp.cn/creative/vcg/800/new/VCG211512884088.jpeg"   
# CTgL4hQR7djY9VtWqaK72wj7PYv4eM4A8vkaonQysimC

# 0x15f64b67efc7df69091550f2f6821d88b12acf5bbe821b4be83ec443bbc79a18
sui client transfer --to 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --object-id  0x15f64b67efc7df69091550f2f6821d88b12acf5bbe821b4be83ec443bbc79a18
# ATrd4yFycgeYhED2yWRMyCCDfPRDbmXx9RErWEpJW4QS
```

