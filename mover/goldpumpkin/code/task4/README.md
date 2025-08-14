## Game

### Game 设计思路

- 猜数字-就是搏
  - 输赢逻辑：玩家把 faucet coin 的所有余额进行下注，最少下注 100，并猜测一个 0~999 的数字。并在方法的调用中，庄家下同样的注，同时按照时间生成随机数，如果玩家和庄家的数字小于 100 , 则玩家赢，否则庄家赢。
- 资金池
  - 可存入：无限制 address
  - 可取出：限制发布者

###   Game 开发注意

- 需要添加依赖

  - ```
    [dependencies]
    Sui = { git = "https://gitee.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/testnet" }
    faucet_coin = { local = "../../task2/faucet_coin"}
    ```

  - 标注 faucent coin 的链上地址

    - ```
      [addresses]
      game = "0x0"
      faucet_coin = "0xc2ef43cfeac82601ff1384bcb8ae45cfd8a632503f60fbc92aa71ea776ee1707"
      ```

- Unit Tests

  - 在单元测试中，发现 Task2 写错了。并把 Task2 的 Unit Test 补上。

  - 重新发布 task2

    由于 Task2 的 faucet coin 的 Object 没有 shared. 因此重新发布。并在 task2 的 Move.toml 中标注发布地址：

    ```
    published-at = "0xc2ef43cfeac82601ff1384bcb8ae45cfd8a632503f60fbc92aa71ea776ee1707"
    ```


###  Game call steps

- Publish
  -  `sui client publish --gas-budget 100000000 --skip-dependency-verification`
- Call `place_bet_and_create_game`
  -  `sui client call --function initialize_house_data --module game --package 046f6e814cb4068300300cc2cf1f7a2b601186dd82fdeb11a12b1e686069cfa6 --args 0xeabd6d077f121e0b4e3a426faf98a25e63f4bd736e133b18f4a39e4a6fb52f28 0xc3aac8c457cb7ec391d369f1046f7b486c996ab3cbcaead8ad4168aef110b75b --gas-budget 10000000`
- Play
  -  `export PACKAGE_ID=046f6e814cb4068300300cc2cf1f7a2b601186dd82fdeb11a12b1e686069cfa6
    export GAME_COUNTER_ID=0x4b1806b5c8b943a1e4e397070501b7b2be2edae3ddf35cec4ae7578b8c4b4c91
    export HOUSE_DATA_ID=0x9507ad7afd3443f54727791de70cb41065cff0f88af981dbc4c3df7d2c70c682
    export PLAYER_GUESS=666
    export COIN_OBJECT_ID=0x13dcc3bc2bee19884f1293b2f13f61a3ac95a2a89728f72da183c4e90f5d1ed3
    sui client call --function place_bet_and_create_game --module game --package $PACKAGE_ID --args $GAME_COUNTER_ID $HOUSE_DATA_ID $PLAYER_GUESS $COIN_OBJECT_ID 0x6 --gas-budget 10000000`

### Game Scan

- [Object: GameCounter](https://suiscan.xyz/mainnet/object/0x4b1806b5c8b943a1e4e397070501b7b2be2edae3ddf35cec4ae7578b8c4b4c91)
- [Object: HouseData](https://suiscan.xyz/mainnet/object/0x9507ad7afd3443f54727791de70cb41065cff0f88af981dbc4c3df7d2c70c682)
- [Object: Game](https://suiscan.xyz/mainnet/object/0xbb231bc631a195b5caaefb8a23011713418cda41f2d4915ee11758987d70b6f5)
