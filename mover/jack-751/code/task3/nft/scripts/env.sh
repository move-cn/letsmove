#!/bin/bash

# NFT 項目環境變數設定
# 請根據實際部署情況修改以下變數

# 包地址 - 請在部署後填入實際的包地址
export PACKAGE_ID="0x016b58bb7d487fe0078a327d8acb6645c0067c98a875667dd99bf734d9c6ba48"

# 網路設定 (mainnet, testnet, devnet, localnet)
export NETWORK="mainnet"

# 發送者地址 - 可選，如果不設定會使用當前活躍地址
# export SENDER_ADDRESS="YOUR_SENDER_ADDRESS_HERE"

# Gas 預算
export GAS_BUDGET="10000000"

# 顯示當前設定
echo "=== NFT 項目環境變數 ==="
echo "Package ID: $PACKAGE_ID"
echo "Network: $NETWORK"
echo "Gas Budget: $GAS_BUDGET"

if [ "$PACKAGE_ID" = "0x016b58bb7d487fe0078a327d8acb6645c0067c98a875667dd99bf734d9c6ba48" ]; then
    echo ""
    echo "⚠️  警告: 請先設定正確的 PACKAGE_ID"
    echo "   請編輯 scripts/env.sh 文件，將 0x016b58bb7d487fe0078a327d8acb6645c0067c98a875667dd99bf734d9c6ba48 替換為實際的包地址"
fi

echo "=========================="
