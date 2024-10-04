## 资料
- [ppt](https://docs.google.com/presentation/d/1MGwZtOzAJ66PbETBkI7lOxKat_K9A7hdZ5eTPb3puV8)

# 注释
> 注释不支持中文等UTF-8字符  ，只支持英文，否则会报错
-   `//`  注释
-   `/*   */` 块注释
-   `///`  文档注释


```move
/// this is mod comment
module comment::comment {

    // this is comment
    use sui::tx_context::TxContext;

    /// this is docs comment
    fun init(ctx: &mut TxContext) {

    }
    
    /**
        line 1
        line 2
        line 3
    */

}

```


# if

```rust

```


# while
- 语法
- `break`  `continue`


