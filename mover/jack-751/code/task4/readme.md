# 完成游戏的上链部署

- 上链网络: 主网(mainnet)
- Package ID: `0xf93faed227c04480854d7745eea5051585e8ee5ea626c302920216b36a56a5e8`

## 需求

- 完成 链游相关知识的学习
- 完成 随机数的学习，游戏必须包含随机数
- 完成 存和取游戏资金池
- 完成 如何存储Coin在合约的学习，游戏必须能存取[task2] 发行的`Faucet Coin`,用`task2`的 `Faucet Coin`作为游戏输赢的资产
- 完成 第一个游戏合约部署主网
- 的game 必须包含自己的 `github id`的元素

## 遊戲介紹

### 翻轉遊戲 (FlipGame)
這是一個基於隨機數的猜正反面遊戲，使用 JACK_751_FAUCET_COIN 作為遊戲代幣。

### 遊戲規則
1. 玩家猜測隨機布林值的結果（true 或 false）
2. 投注金額不能超過遊戲資金池的 10%
3. 猜中獲得等額獎勵，猜錯則投注金額進入資金池
4. 管理員可以從資金池提取代幣

## 合約功能

### 結構體
- `FlipGame`: 遊戲主體，包含資金池
- `Admin`: 管理員物件，擁有特殊權限

### 主要函數
1. **deposit**: 存款到遊戲資金池
2. **withdraw**: 提款（僅限管理員）
3. **play**: 開始遊戲

## 腳本使用說明

### 檔案說明

- `scripts/env.sh` - 環境變數設定檔
- `scripts/deposit.sh` - 存款操作腳本
- `scripts/withdraw.sh` - 提款操作腳本（僅限管理員）
- `scripts/play.sh` - 遊戲操作腳本
- `scripts/game_scripts.sh` - 整合式腳本（支援多種操作）

### 使用前準備

1. **設定執行權限**：
   ```bash
   chmod +x scripts/*.sh
   ```

2. **更新物件 ID**：
   在部署遊戲合約後，請更新 `scripts/env.sh` 檔案中的物件 ID：
   - `FLIPGAME_ID` - FlipGame 物件 ID
   - `ADMIN_ID` - Admin 物件 ID（僅管理員擁有）

3. **載入環境變數**：
   ```bash
   source scripts/env.sh
   ```

### 基本操作

#### 1. 存款操作
```bash
# 直接執行
./scripts/deposit.sh

# 或者使用整合腳本
./scripts/game_scripts.sh deposit <flipgame_id> <coin_id> <amount>
```

#### 2. 遊戲操作
```bash
# 直接執行
./scripts/play.sh

# 或者使用整合腳本
./scripts/game_scripts.sh play <flipgame_id> <random_id> <guess> <coin_id> <amount>
```

#### 3. 提款操作（僅限管理員）
```bash
# 直接執行
./scripts/withdraw.sh

# 或者使用整合腳本
./scripts/game_scripts.sh withdraw <flipgame_id> <admin_id> <amount>
```

### 參數說明

- `flipgame_id` - FlipGame 物件的 ID
- `coin_id` - JACK_751_FAUCET_COIN 代幣物件的 ID
- `amount` - 金額（以最小單位計算）
- `guess` - 猜測結果（`true` 或 `false`）
- `random_id` - 隨機數物件 ID（通常是 `0x6`）
- `admin_id` - 管理員物件 ID

### 範例

```bash
# 設定環境變數
source scripts/env.sh

# 存款 1000 單位代幣
./scripts/game_scripts.sh deposit 0x123... 0x456... 1000

# 猜測 true，投注 100 單位代幣
./scripts/game_scripts.sh play 0x123... 0x6 true 0x456... 100

# 管理員提款 500 單位代幣
./scripts/game_scripts.sh withdraw 0x123... 0x789... 500
```

### 注意事項

1. 確保擁有足夠的 SUI 代幣支付 gas 費用
2. 提款操作僅限管理員（擁有 Admin 物件的地址）
3. 投注金額不能超過遊戲資金池的 10%
4. 請在執行前確認所有物件 ID 正確無誤

## 任务指南

## 学习要点

- 理解随机数
- 理解资金池
- 理解输赢逻辑