# move入门之集合(一) : Vector数据类型深度分析
**🧑‍💻作者：gracecampo**
## 概述
在之前的文章中，我们对基本数据类型有了基本的认识，在move中，定义了多种集合类型。
集合类型的数据结构主要包括以下几种：

1. **Vector**: 用于存储同一类型的元素集合，类似于动态数组。

2. **Table**: 类似于映射的集合，用于存储键值对。键和值的类型可以是指定的或通用的，但必须是同质的。

3. **Bag**: 可以存储任何类型的数据，是一种非泛型类型的集合。

4. **ObjectBag**: 类似于 Bag，但只能存储对象。

5. **ObjectTable**: 类似于 Table，但只能存储对象。

这些集合类型在 Move 中被设计为同质集合，即集合中的所有元素必须是相同类型的。

本节将对move中的**Vector**类型做一个深度的讲解和实战，增加对于集合数据类型认识和使用。

## Vector是什么？

Vector类似于其他编程语言中的数组，但有一些不同之处。。

Vector 是一种用于存储元素集合的原生类型，它是在move基础库中的原生类型。

它位于std包下，是move基础库中的重要组成模块。

```move
#[defines_primitive(vector)]
/// A variable-sized container that can hold any type. Indexing is 0-based, and
/// vectors are growable. This module has many native functions.
module std::vector;
```

### 定义和语法

在move中的定义： 一个可变大小的容器，可以容纳任何类型。索引是从0开始，元素数据可以不断增加。

Vector 类型使用 `vector` 关键字定义，后跟元素类型,使用`<>`包裹。

**元素类型可以是任何有效的 Move 类型,也可以是其他集合**

通过定义我们，可以这样理解,就是说可以把vector看作一个容器，这个容器中，可以防止任意类型的数据，比如u8,string,address,也可以放vector类型。

例子：
```move
// 一个空的 bool 类型的向量
let empty: vector<bool> = vector[];
// 一个 u8 类型的向量
let v: vector<u8> = vector[10, 20, 30];
// 一个 vector<u8> 类型的向量
let vv: vector<vector<u8>> = vector[
    vector[10, 20],
    vector[30, 40]
];
```
上述例子，仅仅只是用bool,u8,vector<u8> ,**Vector的元素类型可以是任意的类型**

## vector是如何实现的？

**作为move语言的基本模块，vector 的底层实现是基于 Rust 的动态数组类型 Vec<T>实现的**

具体可查看[vector.rs](https://github.com/MystenLabs/sui/blob/main/external-crates/move/move-execution/v2/crates/move-stdlib-natives/src/vector.rs)

接下来，我们看下vector的具体代码：

### 异常码定义

定义常量：EINDEX_OUT_OF_BOUNDS，用于表示索引超出范围的错误代码。

之前我们在[move入门之基础语法(一)](https://learnblockchain.cn/article/9966)对常量进行过讲解。

```
const EINDEX_OUT_OF_BOUNDS: u64 = 0x20000;
```
0x20000 是常量的值，表示为十六进制的数值，转化为10进制数为：131072

它在vector实现中,主要用于对向量的索引超出范围时,进行异常提示。

```move
public fun remove<Element>(v: &mut vector<Element>, mut i: u64): Element {
    let mut len = v.length();
    // i out of bounds; abort
    if (i >= len) abort EINDEX_OUT_OF_BOUNDS;

    len = len - 1;
    while (i < len) v.swap(i, {
        i = i + 1;
        i
    });
    v.pop_back()
}
```

比如在remove函数中，当索引下标大于向量长度是，将进行异常提示。
### 函数定义

在 Move 语言中，`vector` 模块提供了一系列函数来操作向量。以下是一些常用的 `vector` 函数：

1. **创建空向量**:
   ```move
   public fun empty<Element>(): vector<Element>
   ```

2. **获取向量长度**:
   ```move
   public fun length<Element>(v: &vector<Element>): u64
   ```

3. **获取元素的不可变引用**:
   ```move
   public fun borrow<Element>(v: &vector<Element>, i: u64): &Element
   ```

4. **向向量末尾添加元素**:
   ```move
   public fun push_back<Element>(v: &mut vector<Element>, e: Element)
   ```

5. **获取元素的可变引用**:
   ```move
   public fun borrow_mut<Element>(v: &mut vector<Element>, i: u64): &mut Element
   ```

6. **从向量末尾移除元素**:
   ```move
   public fun pop_back<Element>(v: &mut vector<Element>): Element
   ```

7. **销毁空向量**:
   ```move
   public fun destroy_empty<Element>(v: vector<Element>)
   ```

8. **交换向量中两个元素的位置**:
   ```move
   public fun swap<Element>(v: &mut vector<Element>, i: u64, j: u64)
   ```

当然，还有除了这几个常用的函数，`vector` 模块还有许多函数没有列出，感兴趣的可以自定查阅。

## Vector应该如何使用？
上面我们已经列出了`vector` 模块日常开发常用到的一些函数，接下来我们将一一实践，增加对`vector` 模块函数的理解和使用。
```move
//初始化一个空向量
let vec = vector::empty<u64>();
```

上述代码验证一个向量是否为空，我们声明了vector<u64>[]的空向量

```move
let vec = vector::empty<u64>();
//判断向量长度
assert!(vec.length() == 1);
```

上述代码验证一个向量是否为空，我们声明了vector<u64>[]的空向量，然后调用is_empty()进行判断

is_empty() 函数返回一个布尔值，表示向量是否为空。如果向量为空，断言通过；否则，断言不通过。

```move
let v = vector[1, 3, 1, 4];
let elem_ref = vector::borrow(&v, 1);
```

上述代码声明一个四个元素的数组,通过borrow函数获取了向量 v 中索引为 1 的元素的不可变引用，即元素 3。

```move
let mut v = vector[1, 3, 1, 4];
vector::push_back(&mut v, 40);
```
在这里需要注意的时，当我们使用push_back的时候,向量需要可变引用(mut)。

push_back第一个参数要求是可变引用，需要通过&mut修饰。

引用相关可以参看：[move基本数据类型(二)](https://learnblockchain.cn/article/9933)
上述代码声明一个四个元素的数组,通过push_back函数将元素40加入到向量末端，向量变为`[1, 3, 1, 4, 40]`。

```move
let mut v = vector[1, 3, 1, 4];
let elem_ref = vector::borrow_mut(&mut v, 1);
*elem_ref = 25;
```

上述代码声明一个四个元素的数组,通过borrow_mut函数获取到向量元素elem_ref，并将其修改为25,此时向量的结果为`[1, 25, 1, 4]`。

```move
let mut v = vector[1, 3, 1, 4];
let elem_ref = vector::pop_back(&mut v);
```
上述代码声明一个四个元素的数组,通过pop_back函数移除末尾元素，此时向量的结果为`[1, 3, 1]`。

```move
let v = vector[]; 
vector::destroy_empty(v); 
```
上述代码声明空的向量,通过destroy_empty函数销毁此向量。
应用场景可以在,当我们将一个向量元素清空后，进行向量对象的销毁。
因为对于move而言，资源的管理是非常严格的，所有的资源都必须被显式地销毁或转移。
该函数提供了一种机制来确保一个向量在销毁时确实是空的，这有助于防止资源泄漏。

```move
let mut v = vector[1, 3, 1, 4];
vector::swap(&mut v, 1, 3); 
```
上述代码声明一个四个元素的数组,通过swap函数交换下标为1和3的元素位置，此时向量的结果为`[1, 1, 3, 4]`。

## 总结
通过本节我们系统的学习到vector的实现,以及如何在日常开发中使用它的一些函数，希望可以帮助到你，在move开发中对vector有更深的认识和有效使用。

💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove










