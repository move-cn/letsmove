# 翻轉遊戲腳本使用說明

## 檔案說明

- `env.testnet.sh` - 測試網環境變數設定檔（已配置實際物件 ID）
- `env.sh` - 原始環境變數設定檔（範本）
- `deposit.sh` - 存款操作腳本
- `withdraw.sh` - 提款操作腳本（僅限管理員）
- `play.sh` - 遊戲操作腳本
- `game_scripts.sh` - 整合式腳本（支援多種操作）
- `test_env.sh` - 測試腳本（驗證環境變數載入）
- `split_coin.sh` - 基本 coin 切割腳本
- `split_coin_advanced.sh` - 進階 coin 切割腳本（多個相同金額）
- `split_coin_optimized.sh` - 最佳化 coin 切割腳本（支援不同金額）
- `query_coin.sh` - coin 資訊查詢腳本
- `find_faucet_coins.sh` - 查詢當前錢包的 JACK_751_FAUCET_COIN
- `find_target_coins.sh` - 查詢指定地址的 JACK_751_FAUCET_COIN
- `coin_manager.sh` - 整合式 coin 管理工具

## 已知的 JACK_751_FAUCET_COIN 物件 ID

以下是已經鑄造的 JACK_751_FAUCET_COIN 物件 ID：
- `0x4491411129b43ab5120aad2915ac5ed4491a8f4d7b8140d7a3b785d7fe167c72` (100,000,000 單位)
- `0x03bd7ee9cff497347bb9c269ccf8fc0fd6e28fa63d0073f61c8361476c8511e6` (100,000,000 單位)

擁有者地址：`0xb961b905ab4a1d6ea41e21b29bacff75efc09759bf68decb4733a772f32820b3`

## 環境變數配置

目前所有腳本都會自動載入 `env.testnet.sh` 中的環境變數：

```bash
PACKAGE_ID="0xf93faed227c04480854d7745eea5051585e8ee5ea626c302920216b36a56a5e8"
FLIPGAME_ID="0xcb75a7005177533aa3d1b5382b0fad3ae45472c1a8590dabc13c023ec5046f53"
ADMIN_ID="0xb32c93856837634e9ad97b51deca0d4d7a67b859942ae59573d080e4a1d4301e"
RANDOM_ID="0x6"
```

## 使用前準備

1. **確認執行權限**：
   ```bash
   chmod +x scripts/*.sh
   ```

2. **測試環境變數載入**：
   ```bash
   ./scripts/test_env.sh
   ```

## 基本操作

### 1. 存款操作
```bash
# 使用預設金額 (1000)
./scripts/deposit.sh <COIN_ID>

# 指定金額
./scripts/deposit.sh <COIN_ID> <AMOUNT>

# 範例
./scripts/deposit.sh 0x123abc... 1000
```

### 2. 遊戲操作
```bash
# 使用預設金額 (100)
./scripts/play.sh <GUESS> <COIN_ID>

# 指定金額
./scripts/play.sh <GUESS> <COIN_ID> <AMOUNT>

# 範例
./scripts/play.sh true 0x123abc... 100
./scripts/play.sh false 0x123abc... 200
```

### 3. 提款操作（僅限管理員）
```bash
# 使用預設金額 (500)
./scripts/withdraw.sh

# 指定金額
./scripts/withdraw.sh <AMOUNT>

# 範例
./scripts/withdraw.sh 500
```

## Coin 管理工具

### 1. 整合式 Coin 管理工具
```bash
# 查詢 coin 資訊
./scripts/coin_manager.sh query <COIN_ID>

# 切割 coin（預設 10000000）
./scripts/coin_manager.sh split <COIN_ID>

# 切割指定金額和數量
./scripts/coin_manager.sh split <COIN_ID> <AMOUNT> <COUNT>

# 取得測試網 gas
./scripts/coin_manager.sh gas

# 查詢錢包餘額
./scripts/coin_manager.sh balance

# 列出所有物件
./scripts/coin_manager.sh objects

# 列出所有物件
./scripts/coin_manager.sh objects

# 查詢 JACK_751_FAUCET_COIN
./scripts/coin_manager.sh find

# 顯示幫助
./scripts/coin_manager.sh help
```

### 2. 基本 Coin 切割
```bash
# 切割一個 coin（預設 10000000）
./scripts/split_coin.sh <COIN_ID>

# 切割指定金額
./scripts/split_coin.sh <COIN_ID> <AMOUNT>

# 範例
./scripts/split_coin.sh 0x123abc... 10000000
```

### 3. 進階 Coin 切割
```bash
# 切割多個相同金額的 coin
./scripts/split_coin_advanced.sh <COIN_ID> <AMOUNT> <COUNT>

# 範例：切割 3 個 5000000 的 coin
./scripts/split_coin_advanced.sh 0x123abc... 5000000 3
```

### 4. 最佳化 Coin 切割
```bash
# 切割不同金額的 coin（更靈活）
./scripts/split_coin_optimized.sh <COIN_ID> <AMOUNT1> [AMOUNT2] [AMOUNT3] ...

# 範例：
./scripts/split_coin_optimized.sh 0x123abc... 10000000          # 切割一個
./scripts/split_coin_optimized.sh 0x123abc... 5000000 3000000   # 不同金額
./scripts/split_coin_optimized.sh 0x123abc... 1000000 1000000   # 相同金額
```

### 5. 查詢 Coin 資訊
```bash
./scripts/query_coin.sh <COIN_ID>
```

## 參數說明

- `COIN_ID` - JACK_751_FAUCET_COIN 代幣物件的 ID
- `GUESS` - 猜測結果（`true` 或 `false`）
- `AMOUNT` - 金額（可選，會使用預設值）

## 自動載入機制

所有腳本都使用以下方式自動載入環境變數：

```bash
# 獲取腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 載入環境變數
source "$SCRIPT_DIR/env.testnet.sh"
```

這樣確保：
- 無論從哪個目錄執行腳本都能正確載入環境變數
- 不需要手動 source 環境變數檔案
- 所有腳本使用統一的配置

## 錯誤處理

腳本包含以下安全檢查：
- 環境變數是否正確載入
- 必要參數是否提供
- 清楚的錯誤訊息和使用說明

## 範例操作流程

```bash
# 1. 測試環境
./scripts/test_env.sh

# 2. 取得測試網 gas
./scripts/coin_manager.sh gas

# 3. 查詢錢包餘額
./scripts/coin_manager.sh balance

# 4. 列出所有物件，找到您的 JACK_751_FAUCET_COIN
./scripts/coin_manager.sh objects

# 5. 切割已知的 coin 為遊戲所需大小（10000000）
./scripts/coin_manager.sh split 0x4491411129b43ab5120aad2915ac5ed4491a8f4d7b8140d7a3b785d7fe167c72 10000000 5

# 6. 存款到遊戲（需要切換到擁有 coin 的錢包）
./scripts/deposit.sh 0x456def... 1000

# 7. 開始遊戲
./scripts/play.sh true 0x456def... 100

# 8. 管理員提款
./scripts/withdraw.sh 500
```

## 注意事項

1. 確保擁有足夠的 SUI 代幣支付 gas 費用
2. 提款操作僅限管理員（擁有 Admin 物件的地址）
3. 投注金額不能超過遊戲資金池的 10%
4. 腳本會自動驗證環境變數是否正確載入
