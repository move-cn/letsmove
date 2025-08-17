# 实现一个最简单的swap

- 上链网络: 主网(mainnet)

## 需求

- 完成 swap相关知识的学习
- 完成第一个Swap合约的上链部署
- swap 必须是 swap 自己发行的 task2 两个 Coin的互换，包名必须是自己的`github id`

## 实现说明

这个任务实现了一个简单的 swap 功能，允许用户在 task2 中创建的两个 coin 之间进行互换：
- `JACK_751` (来自 jack_751.move)
- `JACK_751_FAUCET_COIN` (来自 jack_751_faucet_coin.move)

### 功能特性

#### 主要功能
1. **流动性管理**
   - `add_liquidity()`: 向交换池添加流动性
   - 支持同时添加两种 coin 的流动性

2. **代币交换**
   - `swap_jack_751_to_faucet()`: 将 JACK_751 换成 JACK_751_FAUCET_COIN
   - `swap_faucet_to_jack_751()`: 将 JACK_751_FAUCET_COIN 换成 JACK_751
   - 目前使用 1:1 的简单交换比例

3. **查询功能**
   - `get_pool_info()`: 获取池子中的余额和交换比例信息
   - `calculate_swap_output()`: 计算交换输出数量

4. **管理功能**
   - `update_swap_ratio()`: 更新交换比例

### 数据结构

#### SwapPool
```move
public struct SwapPool has key {
    id: UID,
    jack_751_balance: Balance<JACK_751>,
    faucet_coin_balance: Balance<JACK_751_FAUCET_COIN>,
    swap_ratio: u64, // 交换比例 (乘以1000用于精度)
}
```

### 事件

#### SwapEvent
记录每次交换的详细信息：
```move
public struct SwapEvent has copy, drop {
    user: address,
    jack_751_in: u64,
    faucet_coin_in: u64,
    jack_751_out: u64,
    faucet_coin_out: u64,
}
```

#### LiquidityEvent
记录流动性操作：
```move
public struct LiquidityEvent has copy, drop {
    user: address,
    jack_751_amount: u64,
    faucet_coin_amount: u64,
    action: vector<u8>, // "add" 或 "remove"
}
```

## 使用方法

### 1. 部署合约
```bash
cd jack_751_swap
sui move build
sui client publish --gas-budget 20000000
```

### 2. 添加流动性
在进行交换之前，需要先向池子添加流动性：
```bash
sui client call --package <PACKAGE_ID> --module jack_751_swap --function add_liquidity \
    --args <POOL_ID> <JACK_751_COIN_ID> <FAUCET_COIN_ID> \
    --gas-budget 10000000
```

### 3. 进行交换

#### 将 JACK_751 换成 JACK_751_FAUCET_COIN
```bash
sui client call --package <PACKAGE_ID> --module jack_751_swap --function swap_jack_751_to_faucet \
    --args <POOL_ID> <JACK_751_COIN_ID> \
    --gas-budget 10000000
```

#### 将 JACK_751_FAUCET_COIN 换成 JACK_751
```bash
sui client call --package <PACKAGE_ID> --module jack_751_swap --function swap_faucet_to_jack_751 \
    --args <POOL_ID> <FAUCET_COIN_ID> \
    --gas-budget 10000000
```

### 4. 查询池子信息
```bash
sui client call --package <PACKAGE_ID> --module jack_751_swap --function get_pool_info \
    --args <POOL_ID> \
    --gas-budget 1000000
```

## 测试

运行测试以验证功能：
```bash
sui move test
```

测试包括：
- 初始化测试
- 添加流动性测试
- 双向交换测试
- 输出计算测试

## 错误代码

- `EInsufficientLiquidity (1)`: 流动性不足
- `EZeroAmount (2)`: 输入金额为零
- `EInvalidSwapRatio (3)`: 无效的交换比例

## 任务指南