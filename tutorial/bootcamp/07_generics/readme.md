## 资料
- [PPT](https://docs.google.com/presentation/d/1mTSYySPi0fClm7_RRryrEC4pkrb8gip-z6ziJxP8Hwc)


# Generics 范型

Generics 在计算机术语中被称为范型，引用 [Rust Book](https://doc.rust-lang.org/stable/book/ch10-00-generics.html) 对于泛型的定义：*泛型是具体类型或其他属性的抽象替代品*。范型使得在编写 Move 代码时提供更强的灵活性，并避免逻辑重复。

实际上，泛型允许我们只编写单个函数，写一套逻辑，而应用于任何类型上。所以这种函数也被称为模板 ——个可以应用于任何类型的模板处理程序。

范型是 Move 中的一个关键概念，理解并对其工作原理保持直觉非常重要，因此请花点时间阅读本节并充分理解每个部分。

## **范型用法**

### 在架构中使用范型

看一个基本示例，了解如何使用 Generics 创建一个可以容纳 Sui Move 中任何类型的容器 `Box` 。

首先，在没有范型的情况下，我们可以定义一个包含  `u64` 类型的 `Box`，如下所示：

```move
module generics::obj_generics {
   public struct Box {
        value: u64
    }
}
```

但是，这种类型只能保存 u64 类型的值，为了能够存储其他类型显然我们不能把所有类型的box都枚举完，所以这个时候就需要使用泛型。 代码将修改如下：

```move
module generics::obj_generics {
    public struct Box<T> {
        value: T
    }
}


```

#### 能力限制

我们可以添加条件去强制传递给泛型的类型必须具有某些能力。 语法如下所示：

```move
module generics::obj_generics {
    // T must be copyable and droppable 
    public struct Box<T: store + drop> has key, store {
        value: T
    }
}
```

💡这里需要注意的是，由于外部容器类型，上例中的内部类型 T 必须满足一定的能力约束。 在这个例子中，`T` 必须有 `store`，因为 `Box` 有 `store` 和 `key`。 但是，`T` 也可以具有容器没有的能力，如本例中的 `drop`。

直觉是，如果允许容器包含一个不遵循它所遵循的相同规则的类型，容器将违反其自身的能力。 如果盒子里的东西不能被储存，那盒子怎么能被储存呢？

在某些情况下，可以使用一种称为`phantom` 的特殊关键字来绕过此规则。


### 在函数中使用Generics

要编写一个返回 Box 实例的函数，该实例可以为 value 字段接受任何类型的参数，我们还必须在函数定义中使用泛型。 该函数可以定义如下：

```rust
public fun create_box<T>(value: T): Box<T> {
        Box<T> { value }
    }
```

如果我们想限制函数只接受特定类型的 value，我们只需在函数签名中指定该类型，如下所示：

```rust
public fun create_box(value: u64): Box<u64> {
        Box<u64>{ value }
    }
```

这将只接受 u64 类型的输入，为了使用 `create_box` 的方法，同时仍然使用同样的泛型 Box 结构。

#### 使用Generics调用函数

要调用带有包含泛型的签名的函数，我们必须在方括号中指定类型，如以下语法所示：

```rust
// value will be of type Storage::Box<bool>
    let bool_box = storage::create_box<bool>(true);
// value will be of the type Storage::Box<u64>
    let u64_box = storage::create_box<u64>(1000000);
```

#### 使用运用Sui CLI的Generics调用函数

要从 Sui CLI 调用其签名中带有泛型的函数，您必须使用标志 `--type-args` 定义参数的类型。

以下示例调用 `create_box` 函数创建一个盒子，其中包含 `0x2::sui::SUI` 类型的硬币：

```bash
sui client call --package $PACKAGE --module $MODULE --function "create_box" --args $OBJECT_ID --type-args "0x2::coin::Coin<0x2::sui::SUI>" 
```

## 高级 Generics 语法

泛型
泛型是一种定义可以与任何类型一起使用的类型或函数的方法。当您想要编写可与不同类型一起使用的函数时，或者当您想要定义可以容纳任何其他类型的类型时，这非常有用。泛型是 Move 中许多高级功能的基础，例如集合、抽象实现等。

在标准库中
在本章中我们已经提到了向量类型，它是可以容纳任何其他类型的泛型类型。标准库中泛型类型的另一个示例是 Option类型，它用于表示可能存在或不存在的值。

通用语法
<要定义泛型类型或函数，类型签名需要包含用尖括号 (和)括起来的泛型参数列表>。通用参数以逗号分隔。
```rust
/// Container for any type `T`.
public struct Container<T> has drop {
    value: T,
}

/// Function that creates a new `Container` with a generic value `T`.
public fun new<T>(value: T): Container<T> {
    Container { value }
}
```

在上面的示例中，Container是具有单个类型参数的泛型类型T，value 容器的字段存储T.该new函数是具有单个类型参数的泛型函数T，并且它返回Container具有给定值的 a 。泛型类型必须使用具体类型进行初始化，并且泛型函数必须使用具体类型进行调用。
```rust
#[test]
fun test_container() {
// these three lines are equivalent
let container: Container<u8> = new(10); // type inference
let container = new<u8>(10); // create a new `Container` with a `u8` value
let container = new(10u8);

    assert!(container.value == 10, 0x0);

    // Value can be ignored only if it has the `drop` ability.
    let Container { value: _ } = container;
}
```

在测试函数中，我们演示了三种等效的方法来创建具有值 的test_generic新值。由于需要推断数字类型，因此我们指定数字文字的类型。Containeru8

多种类型参数
您可以定义具有多个类型参数的类型或函数。然后类型参数用逗号分隔。

```rust
/// A pair of values of any type `T` and `U`.
public struct Pair<T, U> {
    first: T,
    second: U,
}

/// Function that creates a new `Pair` with two generic values `T` and `U`.
public fun new_pair<T, U>(first: T, second: U): Pair<T, U> {
    Pair { first, second }
}
```


在上面的示例中，是具有两个类型参数和Pair的泛型类型，并且该 函数是具有两个类型参数和的泛型函​​数。该函数返回具有给定值的 a。类型参数的顺序很重要，它应该与类型签名中类型参数的顺序匹配。TUnew_pairTUPair

```rust
#[test]
fun test_generic() {
// these three lines are equivalent
let pair_1: Pair<u8, bool> = new_pair(10, true); // type inference
let pair_2 = new_pair<u8, bool>(10, true); // create a new `Pair` with a `u8` and `bool` values
let pair_3 = new_pair(10u8, true);

    assert!(pair_1.first == 10, 0x0);
    assert!(pair_1.second, 0x0);

    // Unpacking is identical.
    let Pair { first: _, second: _ } = pair_1;
    let Pair { first: _, second: _ } = pair_2;
    let Pair { first: _, second: _ } = pair_3;

}
```

如果我们添加另一个实例，在函数中交换类型参数new_pair，并尝试比较两种类型，我们会发现类型签名不同，并且无法进行比较。
```rust
#[test]
fun test_swap_type_params() {
let pair1: Pair<u8, bool> = new_pair(10u8, true);
let pair2: Pair<bool, u8> = new_pair(true, 10u8);

    // this line will not compile
    // assert!(pair1 == pair2, 0x0);

    let Pair { first: pf1, second: ps1 } = pair1; // first1: u8, second1: bool
    let Pair { first: pf2, second: ps2 } = pair2; // first2: bool, second2: u8

    assert!(pf1 == ps2, 0x0); // 10 == 10
    assert!(ps1 == pf2, 0x0); // true == true
}
```


变量pair1和的类型pair2不同，比较将无法编译。

为什么要泛型？
在上面的示例中，我们重点关注实例化泛型类型并调用泛型函数来创建这些类型的实例。然而，泛型的真正威力在于能够为基本泛型类型定义共享行为，然后独立于具体类型使用它。这在使用 Move 中的集合、抽象实现和其他高级功能时特别有用。
```rust
/// A user record with name, age, and some generic metadata
public struct User<T> {
    name: String,
    age: u8,
    /// Varies depending on application.
    metadata: T,
}
```

在上面的示例中，User是具有单个类型参数 的泛型类型T，具有共享字段 name和，以及可以存储任何类型的age泛型字段。metadata无论是什么 metadata，所有实例都User将具有相同的字段和方法。

```rust
/// Updates the name of the user.
public fun update_name<T>(user: &mut User<T>, name: String) {
    user.name = name;
}

/// Updates the age of the user.
public fun update_age<T>(user: &mut User<T>, age: u8) {
    user.age = age;
}
```

phantom 类型参数
在某些情况下，您可能希望使用未在该类型的字段或方法中使用的类型参数来定义泛型类型。这称为幻像类型参数。当您想要定义可以容纳任何其他类型的类型，但想要对类型参数强制执行一些约束时，幻像类型参数非常有用。
```rust
/// A generic type with a phantom type parameter.
public struct Coin<phantom T> {
    value: u64
}
```

这里的类型Coin不包含任何使用类型参数的字段或方法T。它用于区分不同类型的硬币，并对类型参数强制执行一些约束T。

```rust
public struct USD {}
public struct EUR {}

#[test]
fun test_phantom_type() {
let coin1: Coin<USD> = Coin { value: 10 };
let coin2: Coin<EUR> = Coin { value: 20 };

    // Unpacking is identical because the phantom type parameter is not used.
    let Coin { value: _ } = coin1;
    let Coin { value: _ } = coin2;
}
```

在上面的示例中，我们演示了如何Coin使用不同的幻像类型参数USD和来创建两个不同的实例EUR。类型参数T不用于类型的字段或方法中Coin，但用于区分不同类型的币。它将确保USD和EUR硬币不会混淆。

类型参数的约束
类型参数可以被限制为具有某些能力。当您需要内部类型允许某些行为（例如copy或drop ）时，这非常有用。约束类型参数的语法是T: <ability> + <ability>。

```rust
/// A generic type with a type parameter that has the `drop` ability.
public struct Droppable<T: drop> {
    value: T,
}

/// A generic struct with a type parameter that has the `copy` and `drop` abilities.
public struct CopyableDroppable<T: copy + drop> {
    value: T, // T must have the `copy` and `drop` abilities
}
```

Move Compiler 将强制类型参数T具有指定的功能。如果类型参数不具有指定的能力，则代码将无法编译。

```rust
/// Type without any abilities.
public struct NoAbilities {}

#[test]
fun test_constraints() {
// Fails - `NoAbilities` does not have the `drop` ability
// let droppable = Droppable<NoAbilities> { value: 10 };

    // Fails - `NoAbilities` does not have the `copy` and `drop` abilities
    // let copyable_droppable = CopyableDroppable<NoAbilities> { value: 10 };
}
```



泛型
泛型可用于定义不同输入数据类型的函数和结构。这种语言特性有时被称为参数多态性。在 Move 中，我们经常将术语“泛型”与“类型参数”和“类型实参”互换使用。

泛型通常用在库代码中（例如在向量中），以声明适用于任何可能类型（满足指定约束）的代码。这种参数化允许您在多种类型和情况下重用相同的实现。

声明类型参数
函数和结构体都可以在其签名中采用类型参数列表，并用一对尖括号括起来<...>。

通用函数
函数的类型参数放置在函数名称之后和（值）参数列表之前。以下代码定义了一个通用标识函数，它接受任何类型的值并返回该值不变。
```rust
fun id<T>(x: T): T {
// this type annotation is unnecessary but valid
    (x: T)
}
```

定义后，类型参数T可以在参数类型、返回类型和函数体内使用。

通用结构
结构体的类型参数放置在结构体名称之后，可用于命名字段的类型。
```rust
public struct Foo<T> has copy, drop { x: T }

public struct Bar<T1, T2> has copy, drop {
    x: T1,
    y: vector<T2>,
}
```

请注意，不必使用类型参数

类型参数
调用泛型函数
调用泛型函数时，可以在一对尖括号括起来的列表中指定函数类型形参的类型实参。
```rust
fun foo() {
    let x = id<bool>(true);
}
```

如果您不指定类型参数，Move 的类型推断将为您提供它们。

使用通用结构
类似地，在构造或析构泛型类型的值时，可以为结构的类型参数附加一系列类型实参。
```rust
fun foo() {
    // type arguments on construction
    let foo = Foo<bool> { x: true };
    let bar = Bar<u64, u8> { x: 0, y: vector<u8>[] };
    
        // type arguments on destruction
        let Foo<bool> { x } = foo;
        let Bar<u64, u8> { x, y } = bar;
    }
```
在任何情况下，如果您不指定类型参数，Move 的类型推断都会为您提供它们。

类型参数不匹配
如果您指定类型参数并且它们与提供的实际值冲突，则会给出错误：
```rust
fun foo() {
    let x = id<u64>(true); // ERROR! true is not a u64
}
```

类似地：
```rust
fun foo() {
    let foo = Foo<bool> { x: 0 }; // ERROR! 0 is not a bool
    let Foo<address> { x } = foo; // ERROR! bool is incompatible with address
}
```

类型推断
在大多数情况下，Move 编译器将能够推断类型参数，因此您不必显式写下它们。如果我们省略类型参数，上面的示例将如下所示：
```rust
fun foo() {
let x = id(true);
//        ^ <bool> is inferred

    let foo = Foo { x: true };
    //           ^ <bool> is inferred

    let Foo { x } = foo;
    //     ^ <bool> is inferred
}
```

注意：当编译器无法推断类型时，您需要手动注释它们。一种常见的情况是调用仅出现在返回位置的类型参数的函数。
```move
module a::m {

    fun foo() {
        let v = vector[]; // ERROR!
        //            ^ The compiler cannot figure out the element type, since it is never used

        let v = vector<u64>[];
        //            ^~~~~ Must annotate manually in this case.
    }
}
```

请注意，这些情况有点人为，因为vector[]从未使用过，因此，Move 的类型推断无法推断类型。

但是，如果稍后在该函数中使用该值，编译器将能够推断出类型：
```rust
module a::m {
fun foo() {
    let v = vector[];
    //            ^ <u64> is inferred
    vector::push_back(&mut v, 42);
    //               ^ <u64> is inferred
    }
}
```

### 整数
在 Move 中，整数类型u8、u16、u32、u64、u128和u256都是不同的类型。然而，这些类型中的每一种都可以使用相同的数值语法来创建。换句话说，如果未提供类型后缀，编译器将根据值的用法推断整数类型。
```rust
let x8: u8 = 0;
let x16: u16 = 0;
let x32: u32 = 0;
let x64: u64 = 0;
let x128: u128 = 0;
let x256: u256 = 0;
```

如果该值未在需要特定整数类型的上下文中使用，u64则将其视为默认值。
```rust
let x = 0;
//      ^ u64 is used by default
```

但是，如果该值对于推断的类型太大，则会给出错误
```rust
let i: u8 = 256; // ERROR!
//          ^^^ too large for u8
let x = 340282366920938463463374607431768211454;
//      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ too large for u64
```

如果数字太大，您可能需要显式注释它
```rust
let x = 340282366920938463463374607431768211454u128;
//                                             ^^^^ valid!
```

未使用的类型参数
对于结构体定义，未使用的类型参数是指未出现在结构体中定义的任何字段中的类型参数，但会在编译时静态检查。 Move 允许未使用的类型参数，因此以下结构定义有效：
```rust
public struct Foo<T> {
    foo: u64
}
```

这在对某些概念进行建模时非常方便。这是一个例子：
```rust
module a::m {
// Currency Specifiers
public struct A {}
public struct B {}

    // A generic coin type that can be instantiated using a currency
    // specifier type.
    //   e.g. Coin<A>, Coin<B> etc.
    public struct Coin<Currency> has store {
        value: u64
    }

    // Write code generically about all currencies
    public fun mint_generic<Currency>(value: u64): Coin<Currency> {
        Coin { value }
    }

    // Write code concretely about one currency
    public fun mint_a(value: u64): Coin<A> {
        mint_generic(value)
    }
    public fun mint_b(value: u64): Coin<B> {
        mint_generic(value)
    }
}
```

在此示例中，Coin<Currency>是类型参数的通用类型Currency，它指定硬币的货币，并允许通用地针对任何货币或具体地针对特定货币编写代码。即使Currency类型参数没有出现在 中定义的任何字段中，这种通用性也适用Coin。

虚拟类型参数
在上面的例子中，虽然struct Coin要求有store能力，但既没有Coin<A>也 Coin<B>没有store能力。这是因为条件能力和通用类型的规则 以及A和B没有能力 的事实store，尽管事实上它们甚至没有在 的主体中使用struct Coin。这可能会导致一些不愉快的后果。例如，我们无法将其放入Coin<A>钱包中存储。

一种可能的解决方案是向A和添加虚假能力注释B（即 public struct Currency1 has store {}）。但是，这可能会导致错误或安全漏洞，因为它削弱了不必要的能力声明的类型。例如，我们永远不会期望存储中的值具有类型为 的字段A，但这通过虚假能力是可能的store。此外，虚假注释具有传染性，要求未使用的类型参数上的许多通用函数也包含必要的约束。

幻像类型参数解决了这个问题。未使用的类型参数可以标记为幻像类型参数，它们不参与结构体的能力推导。这样，在派生泛型类型的能力时，不会考虑幻像类型参数的实参，从而避免了虚假能力注释的需要。为了使这个宽松的规则合理，Move 的类型系统保证声明为 的参数phantom要么在结构定义中根本不使用，要么仅用作也声明为 的类型参数的实参phantom。


phantom在结构定义中，可以通过在声明前添加关键字将类型参数声明为幻像。
```rust
public struct Coin<phantom Currency> has store {
    value: u64
}
```

如果类型参数被声明为幻像，我们就说它是幻像类型参数。定义结构时，Move 的类型检查器确保每个幻像类型参数不在结构定义内使用，或者仅用作幻像类型参数的实参。
```rust
public struct S1<phantom T1, T2> { f: u64 }
//               ^^^^^^^ valid, T1 does not appear inside the struct definition

public struct S2<phantom T1, T2> { f: S1<T1, T2> }
//               ^^^^^^^ valid, T1 appears in phantom position
以下代码显示了违反规则的示例：

public struct S1<phantom T> { f: T }
//               ^^^^^^^ ERROR!  ^ Not a phantom position

public struct S2<T> { f: T }
public struct S3<phantom T> { f: S2<T> }
//               ^^^^^^^ ERROR!     ^ Not a phantom position
```


更正式地说，如果某个类型用作幻像类型形参的实参，我们就说该类型出现在幻像位置。有了这个定义，正确使用幻像参数的规则可以指定如下：幻像类型参数只能出现在幻像位置。

请注意，指定phantom不是必需的，但如果类型参数可以phantom但未标记为此类，则编译器将发出警告。

实例化
实例化结构体时，在派生结构体功能时将排除幻像参数的实参。例如，考虑以下代码：
```rust
public struct S<T1, phantom T2> has copy { f: T1 }
public struct NoCopy {}
public struct HasCopy has copy {}
```

现在考虑类型S<HasCopy, NoCopy>。由于S是用 定义的copy，并且所有非幻象参数都有copy那么S<HasCopy, NoCopy>也有copy。

具有能力限制的幻像类型参数
能力约束和虚拟类型参数是正交特征，因为虚拟参数可以用能力约束来声明。
```rust
public struct S<phantom T: copy> {}
```

当实例化具有能力约束的幻像类型参数时，类型实参必须满足该约束，即使该参数是幻像的。通常的限制适用，并且T 只能使用具有 的参数进行实例化copy。

约束条件
在上面的示例中，我们演示了如何使用类型参数来定义可由调用者稍后插入的“未知”类型。然而，这意味着类型系统几乎没有关于类型的信息，并且必须以非常保守的方式执行检查。从某种意义上说，类型系统必须假设不受约束的泛型的最坏情况——没有能力的类型。

约束提供了一种方法来指定这些未知类型具有哪些属性，以便类型系统可以允许否则不安全的操作。

声明约束
可以使用以下语法对类型参数施加约束。
```rust
// T is the name of the type parameter
T: <ability> (+ <ability>)*
```

可以<ability>是四种能力中的任何一种，并且一个类型参数可以同时受到多种能力的约束。因此以下所有内容都是有效的类型参数声明：
```rust
T: copy
T: copy + drop
T: copy + drop + store + key
```

验证约束
在实例化站点检查约束
```rust
public struct Foo<T: copy> { x: T }

public struct Bar { x: Foo<u8> }
//                         ^^ valid, u8 has `copy`

public struct Baz<T> { x: Foo<T> }
//                            ^ ERROR! T does not have 'copy'
```

对于函数也类似
```rust
fun unsafe_consume<T>(x: T) {
    // ERROR! x does not have 'drop'
}

fun consume<T: drop>(x: T) {
    // valid, x will be dropped automatically
}

public struct NoAbilities {}

fun foo() {
    let r = NoAbilities {};
    consume<NoAbilities>(NoAbilities);
    //      ^^^^^^^^^^^ ERROR! NoAbilities does not have 'drop'
}
```

还有一些类似的例子，但是copy
```rust
fun unsafe_double<T>(x: T) {
(copy x, x)
// ERROR! T does not have 'copy'
}

fun double<T: copy>(x: T) {
(copy x, x) // valid, T has 'copy'
}

public struct NoAbilities {}

fun foo(): (NoAbilities, NoAbilities) {
let r = NoAbilities {};
double<NoAbilities>(r)
//     ^ ERROR! NoAbilities does not have 'copy'
}
```

有关更多信息，请参阅有关条件能力和泛型类型的能力部分 。

递归的限制
递归结构
泛型结构不能直接或间接包含相同类型的字段，即使具有不同的类型参数也是如此。以下所有结构定义均无效：
```rust
public struct Foo<T> {
    x: Foo<u64> // ERROR! 'Foo' containing 'Foo'
}

public struct Bar<T> {
    x: Bar<T> // ERROR! 'Bar' containing 'Bar'
}

// ERROR! 'A' and 'B' forming a cycle, which is not allowed either.
public struct A<T> {
    x: B<T, u64>
}

public struct B<T1, T2> {
    x: A<T1>
    y: A<T2>
}
```

### 高级主题：类型级递归
Move 允许递归调用通用函数。然而，当与泛型结构结合使用时，在某些情况下可能会创建无限数量的类型，并且允许这意味着给编译器、虚拟机和其他语言组件增加不必要的复杂性。因此，这样的递归是被禁止的。

此限制将来可能会放宽，但就目前而言，以下示例应该让您了解什么是允许的，什么是不允许的。
```rust
module a::m {
public struct A<T> {}

    // Finitely many types -- allowed.
    // foo<T> -> foo<T> -> foo<T> -> ... is valid
    fun foo<T>() {
        foo<T>();
    }

    // Finitely many types -- allowed.
    // foo<T> -> foo<A<u64>> -> foo<A<u64>> -> ... is valid
    fun foo<T>() {
        foo<A<u64>>();
    }
}
```

不允许：
```move
module a::m {
    public struct A<T> {}

    // Infinitely many types -- NOT allowed.
    // error!
    // foo<T> -> foo<A<T>> -> foo<A<A<T>>> -> ...
    fun foo<T>() {
        foo<Foo<T>>();
    }
}
```

同样，不允许：

```move
module a::n {
public struct A<T> {}

    // Infinitely many types -- NOT allowed.
    // error!
    // foo<T1, T2> -> bar<T2, T1> -> foo<T2, A<T1>>
    //   -> bar<A<T1>, T2> -> foo<A<T1>, A<T2>>
    //   -> bar<A<T2>, A<T1>> -> foo<A<T2>, A<A<T1>>>
    //   -> ...
    fun foo<T1, T2>() {
        bar<T2, T1>();
    }

    fun bar<T1, T2> {
        foo<T1, A<T2>>();
    }
}
```

请注意，类型级别递归的检查基于对调用站点的保守分析，并且不考虑控制流或运行时值。
```move
module a::m {
public struct A<T> {}

    // Infinitely many types -- NOT allowed.
    // error!
    fun foo<T>(n: u64) {
        if (n > 0) foo<A<T>>(n - 1);
    }
}
```

上面示例中的函数在技术上将针对任何给定输入终止，因此仅创建有限多个类型，但 Move 的类型系统仍然认为它无效。

