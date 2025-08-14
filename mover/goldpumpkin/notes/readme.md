## Task2

### Requirement

- 创建自己 coin，只有管理员可以 `mint`
- 创建水龙头，任何人都可以 `mint`

### Create Coin Steps

- define your coin struct, like `public struct MYCOIN has drop {}`
- define coinmeta of your coin in `init` method
- transfer the `TreasuryCap` to the sender, so they can mint and burn
- metadata is typically frozen after creation

### Transfer 

- transfer coin your created to the specific address through calling the method `mint`

### SUI Command 

- `sui client switch --address <address> `
- `sui client new-env --alias mainnet --rpc https://fullnode.mainnet.sui.io:443`
- `sui client switch --env mainnet`
- `sui client balance`
- `sui client publish `
- `sui keytool import <seed phrase> ed25519  `
- `sui client call --function <Function_Name> --module <Module_Name> --package <Published_Package_ID> --args <TreasuryCap_Object_ID> <Amount> <Recipient_Address> `

### Reference

- [coin-standards-doc](https://docs.sui.io/standards/coin)

- [suiscan](https://suiscan.com/)

- [sui-keytool](https://docs.sui.io/references/cli/keytool)

- [quick-start-to-build-on-sui](https://docs.nodereal.io/reference/quick-start-to-build-on-sui)

  