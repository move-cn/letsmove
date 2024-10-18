# sui Framework
    Sui Framework是Sui对Move VM功能的具体实现。 它包含 Sui 的原生 API，Move 标准库的实现，以及 Sui 特定的操作，例如密码原语和 Sui 在Framework级别的数据结构的实现。Sui 中自定义同质化代币的实现将大量使用 Sui Framework中的一些库。我们将在 Sui 上实现自定义同质化代币使用主要的库是 sui::coin 模块。
## Generics范型
        Generics 在计算机术语中被称为范型，引用 Rust Book 对于泛型的定义：泛型是具体类型或其他属性的抽象替代品。范型使得在编写 Sui Move 代码时提供更强的灵活性，并避免逻辑重复。实际上，泛型允许我们只编写单个函数，写一套逻辑，而应用于任何类型上。所以这种函数也被称为模板 ——个可以应用于任何类型的模板处理程序。
    范型用法：
        在架构中使用范式：
            首先，在没有范型的情况下，我们可以定义一个包含 u64 类型的 Box，如下所示：
            u64类型的box，只能保存64类型的值，当保存其他值时，就需要使用范式
                module Storage {
                public struct Box {
                value: u64
                }
            }
    范式代码：
        module Storage {
            public struct Box<T> {
                value: T
                }
            }
    能力限制：
         可以添加条件去强制传递给范型类型所必须具有的某些能力
            module Storage{
            //T must be copyable and dropable
            pubile struct box<T:store + drop> has key , store{
                    value: T}
                }
    在函数中使用Generics：
         要编写一个返回box实例的函数，该实例可以为value 字段接受任何类型的参数，我们还必须在函数定义中使用范型，可以如下定义：
            public fun create_box<T>(value: T) -> Box<T> {
                box<T>{ value }
                }
        当需要限制函数只能接受特定类型的value时，我们只需在函数签名中指定该类型，
            public fun create_box(value:u64):Box<u64>{
                 Box<u64>{value}
                }
    使用Generics调用函数：
        要调用带有包含范型的签名的函数，我们必须在方括号中指定类型，如下所示：
            //value will be of type Storage：：Box<bool>
                 let bool_box = Storage::create_box<bool>(true);
            //value will be of type Storage：：Box<u64>
                 let u64_box = Storage::create_box<u64>(1000000);
    使用sui cli的Generics调用函数
        从sui cli调用其签名中带有范型的函数，您必须使用标记 --type-args 定义参数的类型。
        以下示例调用 create_box函数创建一个盒子，其中包含0x2：：sui：：SUI类型的硬币：
            sui  client call --package $PACKAGE --module $MODULE --function "create_box" --args $object_ID --type-args"0x2::coin::Coin<0x2::sui::SUI>" --gas-budget 10000
### The Witness Design Pattern
        witness是一种设计模式，用于证明有关一个资源或类型A，在短暂的witness资源被消耗后只能启动一次，witness资源在使用后必须立即被消耗或者丢弃，确保它不能被重复使用以创建a的多个实例
    Witness Pattern Example:
        在下面的例子中，witness资源Peace，而我们要控制实例化的a类型是Guardian。
        witness资源类型必须有drop关键字，这样这个资源在传入一个函数后可以被丢弃，我们具有看到Peace资源的实例被传递到create_guardian方法中并被丢弃(注意witness前的下划线)，确保只能创建一个guardian实例。
                /// Module that defines a generic type `Guardian<T>` which can only be
                /// instantiated with a witness.
                module witness::peace {
                use sui::object::{Self, UID};
                use sui::transfer;
                use sui::tx_context::{Self, TxContext};

                /// Phantom parameter T can only be initialized in the `create_guardian`
                /// function. But the types passed here must have `drop`.
                public struct Guardian<phantom T: drop> has key, store {
                    id: UID
                }

                /// This type is the witness resource and is intended to be used only once.
                struct PEACE has drop {}

                /// The first argument of this function is an actual instance of the
                /// type T with `drop` ability. It is dropped as soon as received.
                public fun create_guardian<T: drop>(
                    _witness: T, ctx: &mut TxContext
                ): Guardian<T> {
                    Guardian { id: object::new(ctx) }
                }

                /// Module initializer is the best way to ensure that the
                /// code is called only once. With `Witness` pattern it is
                /// often the best practice.
                fun init(witness: PEACE, ctx: &mut TxContext) {
                    transfer::transfer(
                        create_guardian(witness, ctx),
                        tx_context::sender(ctx)
                        )
                    }
                }

phantom关键字
    我们希望 Guardian 类型具有 key 和 store 的能力，这样它就是一个资产，可以转移并在全局存储中持续存在。
    还想把 witness 资源 PEACE 传入 Guardian，但 PEACE 只有 drop 的能力。回顾我们之前关于能力约束和内部类型的讨论，该规则暗示 PEACE 也应该有 key 和 storage，因为外部类型 Guardian 有。但是在这种情况下，我们不想给我们的 witness 类型添加不必要的能力，因为这样做可能会导致不符合预期的行为和漏洞。
    可以使用关键字 phantom 来解决这种情况。当一个类型参数没有在结构定义中使用，或者它只是作为另一个 phantom 类型参数的参数使用时，我们可以使用 phantom 关键字来要求Move类型系统放松对内部类型的能力约束规则。我们看到 Guardian 在它的任何字段中都没有使用 T 类型，所以我们可以安全地声明 T 是一个 phantom 类型。
one time witnesses
    一次性见证 One Time Witness（OTW）是Witness模式的一个子模式，我们利用模块 init 函数来确保只创建一个 witness 资源的实例（所以 A 类型被保证是唯一的）。
    在Sui Move中，如果一个类型的定义具有以下属性，那么它就被认为是一个OTW。

该类型是以模块的名字命名的，但大写字母。
该类型只具有drop的能力
为了得到这个类型的实例，你需要把它作为第一个参数添加到模块的 init 函数中，如上例。然后Sui运行时将在模块发布时自动生成OTW结构。
#### coin资源和create_currency方法
    coin资源：
        "sui::coin"中的"coin"资源被定义为
            public streat Coin<phantom>has key ,store{
                id:UID,
                balance:Balance<T>
            }
        coin资源类型是一个结构，有一个通用类型T和两个字段，id和balance，id是sui::object::UID类型，我们之前已经看到过了。
        balacnce是sui::balance::Balance类型，并且定义为：
            public struct Balance<phantom T> has store{
                value:u64
                }
            T类型在Coin中只作为Balance的另一个phantom类型的参数，而在Balance中，它没有用于任何字段，因此T是一个phantom类型参数。
            Coin<T>服务于可转移的资产表示，即一定数量的同质化代币类型T，可以在地址之间转移或被智能合约函数调用消耗。
    create_currency方法：
     public fun create_currency<T: drop>(
        witness: T,                 //OTW资源
        decimals: u8,          //代币精度
        symbol: vector<u8>,    //代币符号
        name: vector<u8>,      //代币名称
        description: vector<u8>,    //代币描述
        icon_url: Option<Url>,    //代币图标URL
        ctx: &mut TxContext     //交易上下文
    ): (TreasuryCap<T>, CoinMetadata<T>) {
        // Make sure there's only one instance of the type T
        assert!(sui::types::is_one_time_witness(&witness), EBadWitness);

        // Emit Currency metadata as an event.
        event::emit(CurrencyCreated<T> {
            decimals
        });

        (
            TreasuryCap {
                id: object::new(ctx),
                total_supply: balance::create_supply(witness)
            },
            CoinMetadata {
                id: object::new(ctx),
                decimals,
                name: string::utf8(name),
                symbol: ascii::string(symbol),
                description: string::utf8(description),
                icon_url
            }
        )
    }
    TreasuryCap
        这是一种资产，通过一次性见证模式保证是一个单体对象：
            public struct TreasuryCap<phantom T: drop> has key, store {
                id: UID,
                total_supply: balance::Supply<T>
            }
            包装了一个类型为balance：：Supply的singtleton字段total_supply:
                 struct Supply<phantom T> has store{
                    value:u64
                    }
        Supple<T>跟踪当前正在流通的T类型的同质化代币的发行总量。你可以看到为什么这个字段必须是一个单体，因为为一个代币类型拥有多个supply实例是没有意义的。



















