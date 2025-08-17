# NFT 項目腳本使用指南

這個目錄包含了與 NFT 合約互動的 shell 腳本。

## 腳本列表

### 1. `env.sh` - 環境變數設定
設定項目的環境變數，包括包地址、網路設定等。

### 2. `deploy.sh` - 部署合約
部署 NFT 合約到 Sui 網路。

### 3. `mint_nft.sh` - 鑄造 NFT
鑄造新的 NFT。

### 4. `transfer_nft.sh` - 轉移 NFT
將 NFT 轉移給指定接收者。

### 5. `query_nfts.sh` - 查詢 NFT
查詢指定地址擁有的 NFT。

## 使用步驟

### 1. 部署合約
```bash
./scripts/deploy.sh
```

### 2. 設定環境變數
部署成功後，將包 ID 複製到 `env.sh` 文件中：
```bash
# 編輯 scripts/env.sh
export PACKAGE_ID="0x您的包地址"
```

### 3. 鑄造 NFT
```bash
./scripts/mint_nft.sh "NFT名稱" "圖片URL"
```

例子：
```bash
./scripts/mint_nft.sh "My First NFT" "https://example.com/image.png"
```

### 4. 查詢 NFT
```bash
./scripts/query_nfts.sh [地址]
```

如果不提供地址，會查詢當前活躍地址的 NFT。

### 5. 轉移 NFT
```bash
./scripts/transfer_nft.sh <NFT_OBJECT_ID> <接收者地址>
```

例子：
```bash
./scripts/transfer_nft.sh 0x1234567890abcdef 0xabcdef1234567890
```

## 注意事項

1. 確保已安裝並配置好 Sui CLI
2. 確保有足夠的 SUI 作為 gas 費用
3. 在 testnet 上測試後再部署到 mainnet
4. 備份好私鑰和重要的物件 ID

## 環境變數說明

- `PACKAGE_ID`: NFT 合約的包地址
- `NETWORK`: 網路設定 (mainnet, testnet, devnet, localnet)
- `GAS_BUDGET`: Gas 預算，預設為 10000000 MIST
