# Task 4 - game

### 构建、发布
```bash
sui move build
sui client publish --gas-budget=20000000 
# 得到packageid: 0x79c2ade03df588affaa5efc468afc40381a939e0da8c75bab2c6c757ba68396a

# 启动一个游戏
sui client call --function create_game --module guess --package 0x79c2ade03df588affaa5efc468afc40381a939e0da8c75bab2c6c757ba68396a --args 0x6 --gas-budget 50000000
# 得到游戏id 0xcaef1790f53baf4033cf7944e2243298f90ee3b6fe3dd940d55e454926256ff6

# 猜数字
sui client call --function play --module guess --package 0x79c2ade03df588affaa5efc468afc40381a939e0da8c75bab2c6c757ba68396a --args 50 0xcaef1790f53baf4033cf7944e2243298f90ee3b6fe3dd940d55e454926256ff6 --gas-budget 50000000

```
