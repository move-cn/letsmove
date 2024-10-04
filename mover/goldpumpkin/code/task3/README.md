## NFT

## Concept

[NFT](https://www.investopedia.com/non-fungible-tokens-nft-5115211)

## Reference

- [developer-nft](https://docs.sui.io/guides/developer/nft)
- [samples-nft](https://examples.sui.io/samples/nft.html)

## Build
`sui move build`

## Publish package
`sui client publish `

## Mint my first MFT

```
sui client call  \
--package  0xc3a53ecab42cf15733267b9d9dfa23aaa5b44046ef32d5e57034011b67d71906 \
--module nft \
--function mint_to_sender \
--args 'goldpumpkin nft' 'first nft of goldpumpkin' 'https://avatars.githubusercontent.com/u/22197388?v=4'
```

## Transfer the nft just minted to the specified address

```
sui client call  \
--package  0xc3a53ecab42cf15733267b9d9dfa23aaa5b44046ef32d5e57034011b67d71906 \
--module nft \
--function transfer \
--args 0x03c80ebec2bf7e61ad68783c99357d74f791198fb6a7e6dddc379d4d433dc33e 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```