# move的基本数据类型

🧑‍💻作者：gracecampo

##  向量/引用/元组与单位类型

### 向量类型(vector)

向量(vector)是move中提供的唯一集合类型的数据，向量类型支持泛型vector<T>，move也提供了一系列函数进行对向量类型的数据进行操作。

T是一个泛型类型，可以是整型，地址型，包类型，甚至是向量类型。

如果要在包中调用，需要导入std::vector

### 向量声明

```move

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
push_back: 在向量末尾添加一个元素
```move
public native fun push_back<Element>(v: &mut vector<Element>, e: Element);
```
pop_back: 移除向量的最后一个元素。
```move
public native fun pop_back<Element>(v: &mut vector<Element>): Element;
```
length: 返回向量中元素的数量。
```move
public native fun length<Element>(v: &vector<Element>): u64;
```
is_empty: 如果向量为空则返回 true。
```move
public fun is_empty<Element>(v: &vector<Element>): bool 
```
remove: 移除给定索引处的元素。
```move
public fun remove<Element>(v: &mut vector<Element>, mut i: u64): Element 
```
可以注意都以上代码，**当对向量做出改变时，传入的都必须为可变引用，当只是对向量进行查找是要求必须为不可变引用**

接下来我们来编写一个测试类，用于加强方法的学习：
```move
    #[test]
    // Create an instance of the `IgnoreMe` struct and ignore it.
    // Even though we constructed the instance, we don't need to unpack it.
    fun test_vec() {
        //声明一个具有三个元素的向量
        let mut v = vector[10, 20, 30];
        //通过push_back方法，添加值为5的元素
        vector::push_back(&mut v, 5);
        //通过push_back方法，添加值为6的元素
        vector::push_back(&mut v, 6);
        //通过pop_back方法，取出末尾数据
        let last_value = vector::pop_back(&mut v);
        debug::print(&last_value);
        //获取向量长度
        let vec_length = vector::length(&mut v);
        debug::print(&vec_length);
        //判断向量是否为空
        let is_empty = vector::is_empty(&mut v);
        debug::print(&is_empty);
        //根据下标移除向量并返回移除向量的值
        let remove_value = v.remove(1);
        debug::print(&remove_value);
    }
```
运行测试用例后的输出：

![img.png](image/vec_test.png)


vector模块，还有很多基础方法，比如 insert, swap_remove 等，此节只为基础入门，就不做过多讲解。

###  向量复制及销毁
因为向量中元素是泛型的，可以接受任何类型

但是如果我们需要对向量进行复制时，要求向量元素是拥有copy的能力，当我们复制了一个向量时，必须要进行处理，否则编译会失败。

因为从一开始，我们就强调过，move是一种面向对象，面向资源的编程。

如果我们需要对元素进行复制时，如果向量被复制的，复制后的资源必须进行处理

```
/*当且仅当T具有copy能力时,vector<T>才具有copy能力*/
let x = vector[10];
let y = x; // 隐式复制
let z = x;
(y, z)
```

## 引用类型
接下来，我们进入对于引用类型的使用，在开发过程中，我们希望去使用一些已经存在的数据。

对于面向资源编程的语言来说，我们需要区分，在某个方法函数中，我们是对数据做修改还是只读。

所以引出了，可变引用与不可变引用。

move中声明引用类型方式有两种：`&e(不可变)` 和 `&mut e(可变)` 。

我们通常在数据前加 & 符号，用以给虚拟机标识，这个数据时怎样的引用类型。

当我们需要对数据进行修改时，声明一个数据为 `&mut`，当我们只需要读取数据，而不对数据做变更时，只需要添加 `&` 符号即可
区别：

1. 不可变引用为只读，不能修改值

2. 可变引用可以进行修改值,**通常用于将值传递，但是保留对象的所有权**

接下来我们定义两个函数来说明：

```move
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

```

总结来说，& 用于只读访问，而 &mut 用于读写访问。

可以直观的看到，当我们需要对引用数据，进行修改操作时，需要声明引用数据为可变的

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

如何理解：
元组，我们可以理解为拥有多个元素的数组，多用于函数方法的返回值中，比如函数需要返回多个元素时，我们就可以将其包装为一个元组类型，

调用者可以根据我们的返回值，对返回值进行解构，进行自主获取需要的结果。

变量应用
```move
    //声明两个元素的元组，并返回，以下类似
    let (x0, x1) = (0, 1);
    let (y0, y1, y2) = (0, 1, 2);
    let (z0, z1, z2, z3) = (0, 1, 2, 3);
```
函数应用
```move
    //返回一个拥有两个bool元素的元组
    fun returns_2_values(): (bool, bool) { (true, false) }
    //返回一个拥有4个元素的元组： 元组中元素可以是数值类型，也可以是向量类型
    fun returns_4_values(x: &u64): (&u64, u8, u128, vector<u8>) { (x, 0, 1, b"foobar") }
```
接下来，我们可以参考以下源码，看一下，官方是如何使用的
```move
public fun index_of<Element>(v: &vector<Element>, e: &Element): (bool, u64) {
    let mut i = 0;
    let len = v.length();
    while (i < len) {
        if (&v[i] == e) return (true, i);
        i = i + 1;
    };
    (false, 0)
}
```
以vector模块中的(index_of)为例，我们可以看到，

通过对输入向量以及元素的判断

当向量中存在e元素时，返回元素是否存在以及元素在向量中的下标为 (true, i)

当向量中不存在e元素时，返回元素是否存在以及元素在向量中的下标为 (false, 0)

这是我们通过返回的元组结果，进行业务逻辑判断。

总结：

我们通过向量/引用/元组 的基本类型进行学习，进一步增加对move中的各个基本类型的理解以及使用

此节是基础入门，是学习复杂数据结构的基础，复杂的数据类型，都是以此为基础发展而来的

因为在接下来的文章中，我们将对复杂的数据类型进行详细的讲解，并进行相关函数的学习

希望大家通过此节，可以学有所获。


💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove