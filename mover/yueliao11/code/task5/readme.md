### swap

1. **进入 `faucetcoin` 目录并构建项目**
   - **命令**: `cd task2/faucetcoin && sui move build`

2. **发布 `faucetcoin` 项目**
   - **命令**: `sui client publish --gas-budget 100000000`

3. **进入 `mycoin` 目录并构建项目**
   - **命令**: `cd ../mycoin && sui move build`

4. **发布 `mycoin` 项目**
   - **命令**: `sui client publish --gas-budget 100000000`

5. **构建 `yueliao11_swap` 项目**
   - **命令**: `sui move build`

6. **发布 `yueliao11_swap` 项目**
   - **命令**: `sui client publish --gas-budget 100000000`

7. **创建流动性池**
   - **命令**: `sui client call --gas-budget 7500000 --package $SPACKAGE_ID --module yueliao11_swap --function create_pool --args $COIN_A_ID_1 $COIN_B_ID_1`

8. **执行 A 换 B 操作**
   - **命令**: `sui client call --gas-budget 7500000 --package $SPACKAGE_ID --module yueliao11_swap --function swap_a_to_b --args $POOL_ID $NEW_COIN_A_ID`

9. **执行 B 换 A 操作**
   - **命令**: `sui client call --gas-budget 7500000 --package $SPACKAGE_ID --module yueliao11_swap --function swap_b_to_a --args $POOL_ID $NEW_COIN_B_ID`
