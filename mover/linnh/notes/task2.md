## Task2

### Coin 协议

Sui 的 coin 包中为用户定义了一系列跟 `Coin` 相关工具。其中定义了 `Coin<T>` 泛型结构体，并提供了一个工具函数：`create_currency` 用于创建新的 `Token`。使用该函数创建的 `Token` 能够作为 `Coin` 的 `T`。这样用户自定义的 `Token` 在代码层面就能方便进行交换。

### 独享所有权和共享所有权

**独享所有权**
对象由一个明确的地址或对象独占拥有，同一时间只能被一个所有者控制。

**共享所有权**
对象可以被多个主体共同访问和修改。

### 参考
- [Coin Standard](https://docs.sui.io/standards/coin)
- [coin.md](https://github.com/MystenLabs/sui/blob/main/crates/sui-framework/docs/sui/coin.md)