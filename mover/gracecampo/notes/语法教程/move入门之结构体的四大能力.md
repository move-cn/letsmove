# move入门之结构体的四大能力
🧑‍💻作者：gracecampo
本文将介绍在move中很重要的的结构体知识点，以及结构体的四大能力。
就像人有运动，说话，思考的能力一样，一个结构体我们也可以赋予它一定的能力。
## 结构体定义
结构体是面向结构体编程思想的重要体现，我们将现实事物抽象成代码，必然需要一个载体，而这个载体在move编程中的体现就是结构体，将现实事物的一些特征，
用结构体属性来表示出来。

比如我们要抽象出一个人，而这个人具备三种基本属性：姓名，性别，年龄，我们在代码中可以这样定义
```sui move
//定义人的结构体，存在姓名，年龄，性别三个属性
module person::person{
    use std::string::String;

    public struct Person{
        name: String,
        age:  u8,
        sex: String
    }
}
```
### 结构体限制：
结构体模式是私有的，只能模块内部访问，但是我们可以通过可见性声明，比如添加public或者public(package)，来提高它的可见性。

public ：公共可见，凡是导入该模块的，都可以使用

public(package)： 包内可用，只能在包内访问及使用，相比public要更严格。

## copy能力
move是用于表示数字资产或者资源的，而数字资产或者资源在某种程度上是不允许复制的。
而在一些业务场景下，是需要一些资源或者数字资产具备copy能力。
copy能力表示该类型的实例或者值可以被复制，在move中自定义类型如果不加说明，默认是不具备copy能力的。此能力作用于结构体上。
举例说明：
```sui move
module person::person {
    use std::string::String;

    public struct Person has copy{
        name: String,
        age:  u8,
        sex: String
    }
}
```
在上面的例子中，我们添加has copy，使得person结构体拥有被复制的能力，但在常识中，人是不能被复制的，但是通过copy能力我们可以让person这个结构体
被复制。
接下来，我们来看代码：
```sui move
module person::person {
    use std::string::String;

    public struct Person has copy,drop{
        name: vector<u8>,
        age:  u8,
        sex: vector<u8>,
    }
    
    public fun copy_persion(){
        let personA = Person{name: b"zhangsan",age:18,sex:b"男"};
        //可以复制到personB
        let personB = personA;
        //通过解引用，复制到personC
        let personC = *&personB;
    }
}
```
在上述代码中personA被隐性的复制到personB，personB通过解引用操作符复制到personC。
在上述代码中，如果Person没有copy能力，编译将失败。
在编译上述代码时，Person不仅需要声明copy,也应当具有drop能力，否则编译会失败。
drop能力会在下面的drop能力介绍。
## drop能力
定义：
在move中，为了是所有资源或者资产得到正确处理，是不允许声明结构体后不使用它忽略的，否则会导致编译失败。
而拥有drop能力允许对结构体进行忽略或者丢弃。
```sui move
module book::drop_ability {

    ///
    public struct PersonHasDrop has drop{
        name: vector<u8>,
        age:  u8,
        sex: vector<u8>,
    }
    
    public struct NoDropPerson{
    }

    #[test]
    fun test_drop() {
        //声明一个无drop能力的结构体
        let no_drop = NoDropPerson {};
        //声明拥有drop能力的结构体，但是可以忽略它
        let _ = PersonHasDrop{name:b"zhangsan",age:19,sex:b"nan"};
        //无drop能力的我们必须解包结构体，才能通过编译
        let NoDropPerson {name:_,age:_,sex:_} = no_drop; 
    }
}
```
drop能力通常在自定义的结构体上使用，以防在不需要的时候，可以或略它。
例如，vector 类型具有 drop 能力，这使得在不再需要时可以忽略该向量。
sui提供的标准库中，很多原生类型是已经声明drop能力的，此项设计，极大减轻了我们对于对于结构体属性的管理。
## key能力
在move的设计中，drop和copy是针对结构体的，他们主要影响的是结构体行为，而key和store能力主要影响的是结构体的储存。
key通常是标识一个对象的唯一性，用于标识该对象在区块链系统中的储存位置。
sui验证器要求结构体的第一个字段必须明明为id,并且类型是UID.
```sui move
module book::key_ability {
    use sui::object::{Self, ID, UID};
    public struct Person has key{
        id: UID,
        name: vector<u8>,
        age:  u8,
        sex: vector<u8>,
    }

    public fun copy_persion(ctx: &mut TxContext): Person{
        Person{
            id:object::new(ctx),name: b"zhangsan",age:18,sex:b"男"
        }
    }
}
```
当我们需要对象进行链上转移的时候，必须使结构体拥有key的能力。否则将无法转移。
故而具备key能力的对象是不可复制以及丢弃的，故而它是不能被赋予copy,drop能力的。
## store能力
store能力是一种特殊的能力，允许将结构体作为另一个结构体的字段来使用。
如果不声明store能力，源码将无法编译成功。
```sui move
module book::store_ability {
    use sui::object::{Self, ID, UID};

    public struct Currency has store{
        currency_type: vector<u8>,
    }

    public struct PersonWallet has key,store{
        id: UID,
        money: Currency
    }

    public struct Person has key{
        id: UID,
        name: vector<u8>,
        age:  u8,
        sex: vector<u8>,
        wallet: PersonWallet
    }

    public fun copy_persion(ctx: &mut TxContext): Person{
        let currency = Currency{
            currency_type:b"usd"
        };
        let person_wallet = PersonWallet{
            id: object::new(ctx),money:currency
        };
        Person{
            id:object::new(ctx),name: b"zhangsan",age:18,sex:b"男",wallet:person_wallet
        }
    }
}
```
在例子中，我们声明了一个拥有store的结构体Currency，而钱包结构体(PersonWallet)将Currency类型作为对象的一个字段，
钱包结构体(PersonWallet)同样拥有store，它同样可以被Person作为一部分来使用。

在move中，除了引用之外，所有原生类型都具有store能力，比如address,vector等。

💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove