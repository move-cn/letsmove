# move入门之基础语法(一) ：模块，注释，常量，结构体

🧑‍💻作者：gracecampo

> 说明：本章将介绍在move中如何去新建模块，代码注释，声明常量，声明结构体语法的使用。

## 新建模块
> 模块的定义： 模块是move的基本构成组件，利用模块特性可以优化代码结构以及功能解耦，模块中定义的所有成员，例如常量，结构体，函数方法都是模块私有的。

新建模块语法：
```sui move
module package::module_name {
    // module body
} 
```
从以上代码，我们可以看出，当我们想要声明一个模块是，我们需要用 module 关键字后跟 包名：模块名，在{}中添加模块代码。

在 Move 中，模块可以包含以下几类代码：

1. Structs：定义数据结构，用于存储和操作数据。
2. Functions：定义可执行的代码块，可以对数据进行操作和逻辑处理。
3. Constants：定义不可变的值，通常用于配置或常量数据。
4. Imports：导入其他模块中的代码，以便重用和模块化。
5. Struct Methods：与特定结构关联的方法，用于操作该结构的数据。

模块名规范： 
1. 模块名必须包内唯一
2. 模块名应采用snake_case形式的命名格式，即模块名小写，并以下划线分割

通常我们使用 `sui move new 项目名` 命令 即可创建出一个项目模板，其中模块源码写在source文件加下。

## 代码注释的使用

> 在 Move 中，代码注释用于添加说明或文档到代码中，帮助开发者理解代码的功能和逻辑。注释不会被编译器处理，也不会生成 Move 字节码。

注释的主要用途包括：
1. 解释代码：帮助开发者理解代码的目的和实现细节。
2. 添加备注：为自己或其他开发者添加开发过程中的备注。
3. 临时移除代码：在调试或测试时，临时移除某些代码行。
4. 生成文档：使用文档注释生成代码文档。

接下来，我们将以代码方式演示下在不同场景下，如何合理利用注释，方便我们的开发。

### 行注释
> 语法：使用 // 来标识,被双斜杠标记后的行代码不参与编译

通常我们用行注释，来描述变量说明，或注释掉对应代码行，使其不参与编译

行注释的主要作用是帮助开发者解释代码的功能或逻辑，或者在代码中添加开发过程中的备注。

```sui move
module package::module_name {
    // 常量说明
    const ENOT_IMPLEMENTED: u64 = 0; //常量说明也可以放在这里
    //该常量被注释，不参与编译，move编译器将或略此行代码
    //const AN_ADDRESS: address = @0x0;
    
} 

```
### 块注释
> 语法：使用/* 开始，以 */ 结束,来标识被包括的代码语句,代码块不参与编译

通常我们用块注释，注释掉对应代码块，在/* 和 */之间的代码，将不参与编译

块注释非常适合用于注释掉多行代码或在代码中添加更长的说明

```sui move
module package::module_name {
    /*可以放在这里*/
    fun /*可以放在这里*/ add_method() : u64 {
        /*可以放在这里*/
        let a:u64 = 10;
        let b:u64 = 10;
        a + b
    }
}

```
### 文档注释
> 语法：使用 /// 开始，为相关代码生成文档说明

在 Move 中，文档注释用于为代码生成文档。它们类似于块注释，文档注释的主要作用是为模块、函数、结构体等提供详细的说明，
帮助开发者和用户理解代码的功能和用法

```sui move
///模块功能说明
module package::module_name {
    ///方法功能说明
    fun  add_method() : u64 {
        ///变量说明
        let a:u64 = 10;
        let b:u64 = 10;
        a + b
    }
}
```
**文档注释和行注释类似，只不过对应的注释信息约定需要放于需要描述的代码上一行**

## 如何声明常量
> 常量的定义：常量是在模块中，属于模块私有的的成员，一旦声明，值便不可再修改;

常量是在模块级别定义的不可变值，常量通常用于为模块中使用的静态值命名

我们通常使用const关键字来声明一个常量，编译器强制要求，常量必须以大写字母开头

常量在模块的字节码中存储，每次使用时都会复制其值

> 编译器强制要求，常量必须以大写字母开头，我们通常约定为全大写，以下划线分割形式
>> 语法： const CONST_NAME: type = value;
```sui move
module package::module_name {
    // 此为一个常量
    const ENOT_IMPLEMENTED: u64 = 0;

} 
```
> 应用：常量是私有的，默认情况下不能在其他模块中访问。
> 为了在其他模块中使用常量，可以使用“配置模式”来解决这个问题。通过定义一个“配置”模块并导出常量，其他模块就可以导入并读取这些常量。

```sui move
module package::module_name {
    // 此为一个常量
    const ENOT_IMPLEMENTED: u64 = 0;
    public fun enot_implemented(): u64 { ENOT_IMPLEMENTED }
} 
```
通过这种方式，其他模块可以通过导入 package::module_name 模块并调用相应的函数（enot_implemented）来访问这些常量。


## 如何声明结构体
>结构体：在 Move 中，结构体是用户定义的数据结构，可以包含多个字段。要声明一个结构体，使用 struct 关键字，后跟结构体名称和字段定义。
字段定义使用 field_name: field_type 语法，并用逗号分隔。

```sui move
module package::module_name {
    // 结构体
    public struct Person has copy, drop{
        name: vector<u8>,
        age: u8
    }
} 
```

限制：
1. 结构体的类型可以在其他模块中引用，但字段和创建或销毁结构体的能力仍然是定义该结构体的模块内部的
2. 结构体不能是递归的，一个结构体不能包含自身作为字段
3. 结构体名称必须以大写字母开头（A-Z），名称可以包含下划线、字母和数字，但不能以数字开头
4. 默认情况下，结构体是线性和短暂的，意味着它们不能被复制或丢弃。可以通过为结构体添加能力（如 copy 和 drop）来放宽这些限制


在上述示例中，我们定义了一个Person的结构体，它拥有copy, drop能力，声明了age字段。
如果要开放外部可见，结构体必须加必须加public关键字，并提供一个公共构造函数，访问结构体字段提供对应的公共函数来访问

```sui move
module package::module_name {
    // 提供一个公共构造函数
    public fun new_person(name: vector<u8>,age: u8): Person {
        Person { name,age }
    }
    // 提供一个公共函数来访问结构体的字段
    public fun get_age(person: &Person):u8{
        person.age
    }
}
```
要创建结构体的实例，可以使用结构体名称，后跟字段的值。
对于命名字段，字段的顺序无关紧要，但必须提供字段名称。
对于位置字段，字段的顺序必须与结构体定义中的顺序匹配，并且必须使用 () 而不是 {} 来封装参数。
```sui move
module package::module_name {
    ///创建和使用实例
    public  fun use_person():u8{
        let person = Person {name: b"zhangsan",age:16};
        //访问字段
        person.age
    }
}
```

解构结构体,并返回age字段值
在 Move 中，解构结构体是指将结构体分解为其字段。
> 解构命名字段的结构体
```sui move
module package::module_name {
    ///解构结构体
    public fun unpack_person(): u8 {
        let person = Person { name: b"zhangsan", age: 16 };
        let Person { name, age } = person;
        age
    }
}
```
在这个例子中，Person { name,age } = person， 将 Person 结构体解构为name,age两个个变量，并在接下来的代码中，使用结构出的变量名，进行使用
> 使用通配符解构:如果不需要所有字段，可以使用通配符 _ 忽略某些字段：
```sui move
module package::module_name {
    ///解构结构体
    public  fun unpack_person():u8{
        let person = Person {name: b"zhangsan",age:16};
        let Person { name,age: _ } = person;
        name
    }
}
```
在这个例子中，let Person { name,age: _ } = person; 将 Person 结构体解构为name,age两个个变量，并忽略了age属性

>解构嵌套结构体
```sui move
module package::module_name {
    // 结构体
    public struct Person has copy, drop{
        name: vector<u8>,
        age: u8
    }
    // 结构体
    public struct House has copy, drop{
        person: Person
    }

    fun unpack_person() {
        let house = House{person : Person {name: b"zhangsan",age:16}};
        let House{person} = house;
        let Person { name, age } = person;
    }
```

💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove


