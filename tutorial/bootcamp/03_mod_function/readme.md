## 资料
- [ppt](https://docs.google.com/presentation/d/1Rj7ZzdVsJCUUucYkJ9X6X3al3ZSYmJEWveAEoYpl4Fg)

## 什么是包
包是同一个合约地址包含的全部代码的集合，由很多模块组成

## 什么是模块
代码模块是代码划分访问权限和代码的组织方式


## 什么是方法
方法是组织代码调用和抽象片段的最小单位


## init方法

- 只能是私有的
- 会在发布合约的是自动调用一次
- 只有两种形式

```rust
fun init(ctx: &mut TxContext){}
fun init(witness: Struct, ctx: &mut TxContext) {}
```
