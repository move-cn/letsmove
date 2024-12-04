## 日志

- 水龙头 Coin, 使用 public_share_object

- sui 系统代码包含 public fun 的方法，可以直接调用

- 编译:

  `sui move build --skip-fetch-latest-git-deps`

- 发布:

  `sui client publish --skip-fetch-latest-git-deps --gas-budget 10000000`

- Digest:

  `GQKRX6oawqQvdgX3jzX2TfE54JJr4QpAUfPZ6LJuf11f`

- Package ID:

  `0x165a8a636ad781363c998df06bc2c887193a7a2c428c1e97b944e81148772068`

- mint and transfer faucet coin

  ```
  sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --args 0xd2263603f032484b66a2c273724b67ee6cdaa0885a029ae565d8bfc1e2021f61 100000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \
  --type-args 0x165a8a636ad781363c998df06bc2c887193a7a2c428c1e97b944e81148772068::faucet_coin::FAUCET_COIN \
  --gas-budget 10000000
  ```

- mint and transfer my coin
  ```
  sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --args 0x0fa0b89037b6af5d6daff94524314444138fc373cfe9f1da7f5122a5baca2195 200000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \
  --type-args 0x165a8a636ad781363c998df06bc2c887193a7a2c428c1e97b944e81148772068::my_coin::MY_COIN \
  --gas-budget 10000000
  ```
