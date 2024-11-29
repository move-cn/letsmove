# move的基本数据类型

## 整型/布尔型/地址类型
🧑‍💻作者：gracecampo
学习一门语言，必须先打好基础功，学习一门语言，必然需要掌握其对应的数据类型。
而move作为一门面向对象的编程语言，在对象定义中，选择合适的数据类型，才能更好的实现功能。
本文讲述在move中的基本数据结构，希望可能为你带来帮助。

在move语言中，分为基本数据类型,包装数据类型，这些数据类型是组成语言的基本构件。基本的数据类型可以单独使用定义变量，也可以组合起来在结构体中组成复杂对象。

### 整型类型
Move 语言支持六种无符号整数类型：u8、u16、u32、u64、u128 和 u256，它们表示的数值由大到小，适用于不同的场景，你可以根据自身业务进行使用。

下图举几个数值范围表：

| 类型           | 值范围                         |
|---------------| ------------------------------|
| u             | 0~255                         |
| u16           | 0~65535                       |
| u32           | 0~4294967295                  |
| u64           | 0~18446744073709551615        |

>定义整型变量
```sui move
module test::test {
    public entry fun test(){
        let x = 10u8;
        let y = 10u16;
    }
}
```

#### 支持的操作符
##### 算术运算：

加法 (+)：用于两个数值相加。如果结果超出整数类型的范围，会中止操作。
减法 (-)：用于从一个数值中减去另一个数值。如果结果小于零，会中止操作。
乘法 (*)：用于两个数值相乘。如果结果超出整数类型的范围，会中止操作。
模除 (%)：用于计算两个数值的余数。如果除数为0，会中止操作。
截断除法 (/)：用于两个数值相除并取整。如果除数为0，会中止操作。
这些运算要求操作数的类型必须匹配，否则编译器会报错。运算结果的类型与操作数相同。
```sui move
module test::test {
    public entry fun test(){
        //算法运算，必须是同类型
        let x = 10u8;
        let y = 10u8;
        let z = x+y;
        let z = x-y;
        let z = x*y;
        let z = x/y;
    }
}
```

#####  比较运算
整数类型是 Move 语言中唯一可以使用比较运算符的类型。两个操作数需要是相同类型。如果需要比较不同类型的整数，必须先进行类型转换。

比较运算不会中止。

语法	操作
```text
<	小于
>	大于
<=	小于等于
>=	大于等于
```
```sui move
module movenft::test {
    /*比较运算，返回值为布尔类型*/
    public entry fun test(){
        let x = 10u8;
        let y = 10u8;
        let z = x< y;
        let z = x>y;
        let z = x<=y;
        let z = x>=y;
    }
}
```

##### 相等运算
与所有具有 drop 能力的类型一样，所有整数类型都支持 "相等" 和 "不相等" 运算。两个操作数需要是相同类型。如果需要比较不同类型的整数，必须先进行类型转换。

语法	操作
```text
==	相等
!=	不相等
```
```sui move
module movenft::test {
    public entry fun test(){
        let x = 10u8;
        let y = 10u8;
        let z = (x== y);
        let z = (x!=y);
    }
}
```
##### 类型转换
整型是move中唯一支持类型转换的类型，当由高转低是，move并不会如其他语言以损失精度转换，而是会中断转换,简单说低转高可以，高转低不行。
语法： (x AS type)  
解释: x转化位其他整型，其中type只能是整数类型。
```sui move
    module movenft::test {
        public entry fun test(){
            let x = 10u8;
            let y = 10u16;
            let z= (x as u16);
        }
    }
```
#### 布尔类型
布尔类型和其他语言一样，用来表示true 和 false的原始类型。

#### 操作运算：
> 短路逻辑: &&
> 短路逻辑或：||
> 逻辑非：！

上述操作一般用于流程运算中，比如
```sui move
    module movenft::test {
    public entry fun test(){
        let  x = true;
        let  y = false;
        if(x){

        };
        while (y){

        };
        assert!(x,10u8)
    }
}

```

#### 地址类型
在move中就是就是用来表示在一个对象在区块链储存中的位置， 地址类型在move中表示为 address,这个和大多数区块链语言一样，属于内置类型.。
address类型就是一个32字节(256字节)的 标识符。
在sui区块链中,主要应用方向有两种
账户类型地址： 对于sui来说，address就是“账户”，用户区块链用户的转账，交易，参与链上活动。
例如：
```text
│ elastic-topaz          │ 0x9ae8ca9263455c1a1d9243ebc5986496bb315b1c3343f1100851e218e7575348 │               
│ vigilant-quartz        │ 0xb76dbc0cab651095651eb550a522d450ab2a1c267ddc5ea70a263fe5b51a6013 │     
│ determined-labradorite │ 0xc33c26e95d20423c2a4a9179ae59e845712f01682ac6bcbccf39f0f8542e6cdd │
```
命名对象地址：表示一个模块的包地址，用于确定部署上链的对象位置，用户与合约对象交互。
例如：
```text
│ ╭────────────┬──────────────────────────────────────────────────────────────────────╮ │
│ │ objectId   │  0x618967f768a9ffd20aeba77ae2659eb34dffd78a42afd30bc5086cb93e427816  │ │
│ │ version    │  206235085                                                           │ │
│ │ digest     │  jdSP7agpetC4IJKVqtu8rFQFtvwIKNd6j+fxFEu3BRY=                        │ │
│ │ objectType │  0x0000..0002::package::UpgradeCap                                   │ │
│ ╰────────────┴──────────────────────────────────────────────────────────────────────╯ 
```
💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove