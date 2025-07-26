#!/bin/bash

# 設定環境變數
export PACKAGE_ID="0xf93faed227c04480854d7745eea5051585e8ee5ea626c302920216b36a56a5e8"

# 顏色定義
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== 翻轉遊戲操作腳本 ===${NC}"
echo -e "${YELLOW}Package ID: $PACKAGE_ID${NC}"

# 存款函數
function deposit_coins() {
    local flipgame_id="$1"
    local coin_id="$2"
    local amount="$3"
    
    if [ -z "$flipgame_id" ] || [ -z "$coin_id" ] || [ -z "$amount" ]; then
        echo -e "${RED}錯誤: deposit_coins <flipgame_id> <coin_id> <amount>${NC}"
        return 1
    fi
    
    echo -e "${GREEN}執行存款操作...${NC}"
    echo -e "${YELLOW}FlipGame ID: $flipgame_id${NC}"
    echo -e "${YELLOW}Coin ID: $coin_id${NC}"
    echo -e "${YELLOW}金額: $amount${NC}"
    
    sui client call \
        --package "$PACKAGE_ID" \
        --module "game" \
        --function "deposit" \
        --args "$flipgame_id" "$coin_id" "$amount" \
        --gas-budget 10000000
}

# 提款函數（僅限管理員）
function withdraw_coins() {
    local flipgame_id="$1"
    local admin_id="$2"
    local amount="$3"
    
    if [ -z "$flipgame_id" ] || [ -z "$admin_id" ] || [ -z "$amount" ]; then
        echo -e "${RED}錯誤: withdraw_coins <flipgame_id> <admin_id> <amount>${NC}"
        return 1
    fi
    
    echo -e "${GREEN}執行提款操作（僅限管理員）...${NC}"
    echo -e "${YELLOW}FlipGame ID: $flipgame_id${NC}"
    echo -e "${YELLOW}Admin ID: $admin_id${NC}"
    echo -e "${YELLOW}金額: $amount${NC}"
    
    sui client call \
        --package "$PACKAGE_ID" \
        --module "game" \
        --function "withdraw" \
        --args "$flipgame_id" "$admin_id" "$amount" \
        --gas-budget 10000000
}

# 遊戲函數
function play_game() {
    local flipgame_id="$1"
    local random_id="$2"
    local guess="$3"
    local coin_id="$4"
    local amount="$5"
    
    if [ -z "$flipgame_id" ] || [ -z "$random_id" ] || [ -z "$guess" ] || [ -z "$coin_id" ] || [ -z "$amount" ]; then
        echo -e "${RED}錯誤: play_game <flipgame_id> <random_id> <guess(true/false)> <coin_id> <amount>${NC}"
        return 1
    fi
    
    echo -e "${GREEN}開始遊戲...${NC}"
    echo -e "${YELLOW}FlipGame ID: $flipgame_id${NC}"
    echo -e "${YELLOW}Random ID: $random_id${NC}"
    echo -e "${YELLOW}猜測: $guess${NC}"
    echo -e "${YELLOW}Coin ID: $coin_id${NC}"
    echo -e "${YELLOW}投注金額: $amount${NC}"
    
    sui client call \
        --package "$PACKAGE_ID" \
        --module "game" \
        --function "play" \
        --args "$flipgame_id" "$random_id" "$guess" "$coin_id" "$amount" \
        --gas-budget 10000000
}

# 顯示幫助資訊
function show_help() {
    echo -e "${BLUE}=== 使用說明 ===${NC}"
    echo -e "${GREEN}1. 存款:${NC}"
    echo -e "   deposit_coins <flipgame_id> <coin_id> <amount>"
    echo -e ""
    echo -e "${GREEN}2. 提款（僅限管理員）:${NC}"
    echo -e "   withdraw_coins <flipgame_id> <admin_id> <amount>"
    echo -e ""
    echo -e "${GREEN}3. 遊戲:${NC}"
    echo -e "   play_game <flipgame_id> <random_id> <guess(true/false)> <coin_id> <amount>"
    echo -e ""
    echo -e "${GREEN}4. 顯示幫助:${NC}"
    echo -e "   show_help"
    echo -e ""
    echo -e "${YELLOW}範例:${NC}"
    echo -e "deposit_coins 0x123... 0x456... 1000"
    echo -e "play_game 0x123... 0x6... true 0x456... 500"
    echo -e "withdraw_coins 0x123... 0x789... 2000"
}

# 檢查參數
if [ $# -eq 0 ]; then
    show_help
fi

# 主程式
case "$1" in
    "deposit")
        shift
        deposit_coins "$@"
        ;;
    "withdraw")
        shift
        withdraw_coins "$@"
        ;;
    "play")
        shift
        play_game "$@"
        ;;
    "help")
        show_help
        ;;
    *)
        echo -e "${RED}未知命令: $1${NC}"
        show_help
        ;;
esac
