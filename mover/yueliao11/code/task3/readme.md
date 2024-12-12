```
sui move build
sui client publish --gas-budget 100000000 
sui client call --function mint \
    --module yueliaoNFT \
    --package 0x3da83250affdd9e22d0a601dac90a9d927149bb94292cf781650ef1fdda6da68 \
    --args "yueliao11" "NFT for yueliao11" 0x7865c7cbd6dc262645ba44713f260e62a66ea99d74746e8823658270cb4a4398 \
    --gas-budget 100000000 

    # mint 一个 NFT 到指定地址
sui client call --function mint \
    --module yueliaoNFT \
    --package 0x3da83250affdd9e22d0a601dac90a9d927149bb94292cf781650ef1fdda6da68 \
    --args "yueliao11" "NFT for yueliao11" "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" \
    --gas-budget 100000000 \
![NFT Mint Screenshot](./nft.jpg)
```