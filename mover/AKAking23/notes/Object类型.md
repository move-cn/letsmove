# Object 类型

## struct 结构体

key-value 结构体
public struct开头
public struct 结构体名称 {}
例如：
```
public struct 钱包地址::hello_world::Hello has key {
    id: UID,
    say: String,
}
```

## UTXO 模型和普通账本的区别
utxo就是每个token都是单独的个体
就像每个sui都有一个id

### 对象定义
1. 必须有key的能力
2. 必须第一个字段是id 而且类型为sui::object::UID
```
public struct ColorObject has key {
    id: UID,
    red: u8,
    green: u8,
    blue: u8,
}
```

所有权
独享所有权、共享所有权
1. transfer 转移所有权  必须有key
2. public_transfer 转移所有权  必须有key、store
3. share_object 共享所有权  必须有key
4. public_share_object 共享所有权  必须有key、store
5. freeze_object 冻结所有权  必须有key
6. public_freeze_object 冻结所有权  必须有key、store

所有权在函数之间传递的访问权限
```
    fun f(consume:T,write:&mut T,read:&T){
        1.T: transfet,delete,write,read;
        2.&mut T: write,read;
        3.&T: read;
    }
```