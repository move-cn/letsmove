#!/bin/bash

# 獲取腳本所在目錄
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 載入環境變數
source "$SCRIPT_DIR/env.testnet.sh"

# 顏色定義
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Coin 管理工具 ===${NC}"

# 顯示幫助資訊
function show_help() {
    echo -e "${GREEN}可用命令：${NC}"
    echo -e "  ${YELLOW}query <coin_id>${NC}                     - 查詢 coin 資訊"
    echo -e "  ${YELLOW}split <coin_id> [amount] [count]${NC}    - 切割 coin"
    echo -e "  ${YELLOW}gas${NC}                                 - 取得測試網 SUI gas"
    echo -e "  ${YELLOW}balance${NC}                             - 查詢錢包餘額"
    echo -e "  ${YELLOW}objects${NC}                             - 列出所有物件"
    echo -e "  ${YELLOW}find [address]${NC}                     - 查詢指定地址的 JACK_751_FAUCET_COIN"
    echo -e "  ${YELLOW}help${NC}                                - 顯示此幫助"
    echo -e ""
    echo -e "${GREEN}範例：${NC}"
    echo -e "  $0 query 0x123abc..."
    echo -e "  $0 split 0x123abc... 10000000 3"
    echo -e "  $0 find 0xb961b905ab4a1d6ea41e21b29bacff75efc09759bf68decb4733a772f32820b3"
    echo -e "  $0 balance"
}

# 查詢 coin 資訊
function query_coin() {
    local coin_id="$1"
    if [ -z "$coin_id" ]; then
        echo -e "${RED}錯誤: 請提供 coin ID${NC}"
        return 1
    fi
    
    echo -e "${GREEN}查詢 Coin: $coin_id${NC}"
    sui client object "$coin_id"
}

# 切割 coin
function split_coin() {
    local coin_id="$1"
    local amount="${2:-10000000}"
    local count="${3:-1}"
    
    if [ -z "$coin_id" ]; then
        echo -e "${RED}錯誤: 請提供 coin ID${NC}"
        return 1
    fi
    
    echo -e "${GREEN}切割 Coin...${NC}"
    echo -e "${YELLOW}Coin ID: $coin_id${NC}"
    echo -e "${YELLOW}金額: $amount${NC}"
    echo -e "${YELLOW}數量: $count${NC}"
    echo ""
    
    # 建立命令
    local cmd="sui client split-coin --coin-id $coin_id"
    for ((i=1; i<=count; i++)); do
        cmd="$cmd --amounts $amount"
    done
    cmd="$cmd --gas-budget 10000000"
    
    echo -e "${YELLOW}執行命令: $cmd${NC}"
    echo ""
    
    # 執行命令
    eval "$cmd"
}

# 取得測試網 gas
function get_gas() {
    echo -e "${GREEN}取得測試網 SUI gas...${NC}"
    sui client faucet
}

# 查詢錢包餘額
function check_balance() {
    echo -e "${GREEN}查詢錢包餘額...${NC}"
    sui client balance
}

# 列出所有物件
function list_objects() {
    echo -e "${GREEN}列出所有物件...${NC}"
    sui client objects
}

# 查詢指定地址的 JACK_751_FAUCET_COIN
function find_faucet_coins() {
    local address="${1:-0xb961b905ab4a1d6ea41e21b29bacff75efc09759bf68decb4733a772f32820b3}"
    echo -e "${GREEN}查詢地址 $address 的 JACK_751_FAUCET_COIN...${NC}"
    
    echo -e "${YELLOW}已知的 JACK_751_FAUCET_COIN 物件 ID：${NC}"
    echo -e "1. 0x4491411129b43ab5120aad2915ac5ed4491a8f4d7b8140d7a3b785d7fe167c72"
    echo -e "2. 0x03bd7ee9cff497347bb9c269ccf8fc0fd6e28fa63d0073f61c8361476c8511e6"
    echo ""
    echo -e "${GREEN}使用範例：${NC}"
    echo -e "./deposit.sh 0x4491411129b43ab5120aad2915ac5ed4491a8f4d7b8140d7a3b785d7fe167c72 10000000"
    echo -e "./play.sh true 0x4491411129b43ab5120aad2915ac5ed4491a8f4d7b8140d7a3b785d7fe167c72 1000000"
}

# 主程式
case "$1" in
    "query")
        shift
        query_coin "$@"
        ;;
    "split")
        shift
        split_coin "$@"
        ;;
    "gas")
        get_gas
        ;;
    "balance")
        check_balance
        ;;
    "objects")
        list_objects
        ;;
    "find")
        shift
        find_faucet_coins "$@"
        ;;
    "help"|"")
        show_help
        ;;
    *)
        echo -e "${RED}未知命令: $1${NC}"
        show_help
        ;;
esac
