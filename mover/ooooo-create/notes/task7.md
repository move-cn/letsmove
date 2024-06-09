# task7

## 获取 object 属性

```
sui clint object 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56
```

## 将数字转换成 ASCII 码

powershell 中执行 `[char]number`

```
>>> [char]76
>>> L
```

## cli 调用与合约交互

```
sui client call --function get_flag --module check_in --package 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd --args "lsLF" 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56 0x8 --gas-budget 10000000
```

## 注意

gas -budget 不能太小，否则会报错

```
Gas budget: 10000 is lower than min: Caused by:
    RPC call failed: ErrorObject { code: ServerError(-32002), message: "Transaction execution failed due to issues with transaction inputs, please review the errors and try again: Gas budget: 10000 is lower than min: 1000000.", data: None }
```