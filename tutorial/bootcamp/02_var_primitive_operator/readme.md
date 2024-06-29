## 资源
- [ppt](https://docs.google.com/presentation/d/14Y5Au0GQkOoRpjKQtwk9Ib41UvQaqbW7QQATL1z0SPw)

# 变量
Move程序使用let将变量名绑定到值:
```rust
let x = 1;
let y = x + x:
```
Let也可以在不将值绑定到局部的情况下使用。
然后可以为局部变量赋值。
```rust
let x;
if (cond) {
  x = 1u32
} else {
  x = 0u32
}
```

变量必须在使用前赋值

```rust
let x;
x + x // ERROR!
```


### 变量的名字

必须是 _a-zA-Z 开始 只能包含字母数字和下划线 _

```move
module var::var {

    use sui::tx_context::{TxContext};
    
    #[allow(unused_variable)]
    fun init(_: &mut TxContext) {
    
    let s = b"hello";
    
    let s2 = s;
    
    let x = 0;
    let b = false;
    let addr = @0x42;
    let x_ref = &x;
    
    let b2 = b;
    let addr2 = @0x42;
    let x_ref2 = x_ref;
}

}

```




# 无符号整数
- `u8` `u16` `u32` `u64` `u128` `u256`
-   `+` `-` `*` `/` `%`
-  `=` `>` `<` `!=`


# bool
- `false` `false`

# address 地址类型





