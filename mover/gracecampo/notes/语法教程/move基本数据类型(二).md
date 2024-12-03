# move的基本数据类型
🧑‍💻作者：gracecampo
##  向量/引用/元组与单位类型
### 向量类型(vector)

向量(vector)是move中提供的唯一集合类型的数据，向量类型支持泛型vector<T>，move也提供了一系列函数进行对向量类型的数据进行操作。
T可以是整型，地址型，包类型，甚至是向量类型。
如果要在包中调用，需要导入std::vector

### 向量声明
```

        // 泛型为布尔型的空集合
        let empty: vector<bool> = vector[];

        // 泛型为u8类型的集合
        let v: vector<u8> = vector[10, 20, 30];

        // 泛型为集合是u8的集合
        let vv: vector<vector<u8>> = vector[
            vector[10, 20],
            vector[30, 40]
        ];
```
### 向量操作函数
push_back: 在向量末尾添加一个元素。
pop_back: 移除向量的最后一个元素。
length: 返回向量中元素的数量。
is_empty: 如果向量为空则返回 true。
remove: 移除给定索引处的元素。

```
        let mut v = vector[10, 20, 30];
        vector::push_back(&mut v, 5);
        vector::push_back(&mut v, 6);
        vector::pop_back(&mut v);
        vector::length(&mut v);
        vector::is_empty(&mut v);
        vector::removetest(&mut v, 1);
```

###  向量复制及销毁

```
/*当且仅当T具有copy能力时,vector<T>才具有copy能力*/
let x = vector[10];
let y = x; // 隐式复制
let z = x;
(y, z)


/*如果不具备drop能力的泛型需要显式销毁*/
let v = vector<NoDrop>[];
v.destroy_empty();
```
## 引用类型
move中声明引用类型方式有两种：&e(不可变) 和 &mut e(可变) 。

区别：

不可变引用为只读，不能修改值

可变引用可以进行修改值。**通常用于将值传递，但是保留对象的所有权**

接下来我们定义两个函数来说明：


```sui move
module movetest::test {
    use std::string;

    /*定义一商品库存结构体，我们规定商品名称不可修改，库存数量可以修改*/
    public struct Shop{
        shopName:string::String,
        num:u8
    }

    /*定义一个不可变引用,用于返回商品的库存*/
    public fun showNum(shop: &Shop): u8{
        shop.num
    }
    /*定义一个可变引用,用于修改库存*/
    public fun editNum(shop: &mut Shop){
        shop.num = shop.num - 1;
    }
}
```
总结来说，& 用于只读访问，而 &mut 用于读写访问。

## 元组与单位类型
元组释义： 拥有0或者多个元素的数组，可用于变量定义以及函数返回值
定义元组：元组通过在括号内使用逗号分隔的表达式列表创建。
元组限制：
1. 只能出现在表达式中（通常在函数的返回位置）。
2. 不能绑定到局部变量。
3. 不能存储在结构体中。
4. 元组类型不能用于实例化泛型。
   () 空元组
   (e1, ..., en) 包含N个元素的元组


变量应用
```sui move
    let (x0, x1) = (0, 1);
    let (y0, y1, y2) = (0, 1, 2);
    let (z0, z1, z2, z3) = (0, 1, 2, 3);
```
函数应用
```sui move

    fun returns_unit() {}
    fun returns_2_values(): (bool, bool) { (true, false) }
    fun returns_4_values(x: &u64): (&u64, u8, u128, vector<u8>) { (x, 0, 1, b"foobar") }
```
💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove