- `sui::coin` 和 `sui::transfer` 提供了与SUI货币和资产转移相关的功能。
- `sui::tx_context` 包含与交易上下文相关的类型和功能。
- 调用`coin::create_currency`函数创建一种新货币。这个函数的参数包括：
	- `waitness`：授权对象，用于创建货币。
	- `2`：货币的小数位数。
	- `b"C_NELL"`：货币的名称。
	- `b"FC"`：货币的符号。
	- `b"TESTCOIN"`：货币的描述。
	- URL对象，包含货币图标的链接地址。
	- `ctx`：交易上下文。
```move
public entry fun faucet(treasury_cap: &mut TreasuryCap<C_NELL>, recipient: address, ctx: &mut TxContext){
```
- 定义一个名为`faucet`的公共入口函数，用于给指定的接收者地址发放货币。