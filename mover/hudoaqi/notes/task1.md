# 变量
    1. 变量的定义
        let 变量名称：数据类型 = 值
    2. 类型
        整型 u8 u16 u32 u64 u128 u256
        小数和负数类型 u8类型的1-127表示负数，128-255表示正数
        运算符+ - * / % 
        as运算符 只有类型相同的才能做基本运算，as是move的整数类型转换运算符，move不支持类型的隐式转换，语法(1u8 as u16)
        布尔类型 bool true false
                运算符&& ||!
        地址类型 address在move中是一个特殊的类型，用来表示一个钱包地址
                字节长度为32字节:let address1 : address = 0x1234567890123456789012;
## 创建智能合约源文件
module hello_world::hello {
//引入声名 use<Address/Alias>::<ModuleName>;
  use std::string;
     use sui::object::{Self, UID};
     use sui::transfer;
     use sui::tx_context::{Self, TxContext};
    // module contents
/*
    sui move中有四类能力特性
        copy：值可以被复制
        drop：值可以被丢弃
        store：值可以被全局存储
        key：值可以被用作全局存储的key键
    其中拥有key 和 store能力特性的定制类型被视为资产，资产可以在全局存储中存储，也可以在不同账号之间转移
    定制类型：
             //包含了任意字符串的object
             public struct HelloWorldObject has key, store {id: UID,
             //这里的uid是一种sui freamwork类型(sui::object::UID)，用于标识对象唯一性
        /// 被 object 包含的字符串
        text: string::String}
*/
/*
    sui move函数有三种可见性：
        public：公开可见，可以在其他模块中调用
        private：私有可见，只能在当前模块中调用
        friend：友元可见，可以被当前模块的其他函数调用

*/
/*
    返回值如：
         public fun addition (a: u8, b: u8): u8 {
        a + b    
    }
*/
/*创建 mint 函数
我们可以用如下方式定义 Hello World 示例项目中的 mint 函数:

    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
这个函数创建了 HelloWoirldObject 定制类型的一个新实例，然后使用 Sui 系统中的转移函数 transfer 将其发送给交易的调用者。
*/
/*
    完整的源文件如下：
创建智能合约源文件：
module hello_world::hello_world {
    引入声名
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    赋予特性
    public struct HelloWorldObject has key, store {
        id: UID,
        /// A string contained in the object
        text: string::String
    }

    创建mint函数
    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }

}
*/
### 使用sui object
看一个记录学生成绩报告单的例子:
        public struct Transcript {
            history: u8,
            math: u8,
            literature: u8,
        }
上面仅仅定义了一个常规的move结构体，但是我们需要将这个结构体作为一个资产存储在全局存储中，所以我们需要给它添加key和store特性，以及在struct定义时内部添加全局唯一的id：uid
        use sui::object::{UID};

        public struct TranscriptObject has key, store {
            id: UID,
            history: u8,
            math: u8,
            literature: u8,
        }
创建一个sui object的实例：
        use sui::object::{Self}; //引入了Sui 中模块Self的类型object，允许您为资产创建新的对象或 ID。
        use sui::tx_context::{Self, TxContext};//提供对交易元数据的访问
        use sui::transfer;//管理资产转移

        public entry fun create_transcript_object(history: u8, math: u8, literature: u8, ctx: &mut TxContext) {
        let transcriptObject = TranscriptObject {
         id: object::new(ctx),
        history,
        math,
        literature,
        };
    transfer::transfer(transcriptObject, tx_context::sender(ctx))
        }
#### sui objects所有权的类型
    sui move中总共有四种类型的所有权
        被拥有：被一个地址拥有；被另一个object拥有；
                被一个地址拥有：
                        transfer::transfer(transcriptObject, tx_context::sender(ctx)) // where tx_context::sender(ctx) is the recipient
                被另一个object拥有：
                        要使一个 object 被另一个 object 拥有，可以使用 dynamic_object_field
        共享：不可变的共享；可变的共享；
                不可共享的共享objects
                        在 Sui 中确定的 objects 不能再被任何人改变，也因此可以被认为没有唯一的所有者，是共享的。在 Sui 中所有已发布的 packages 和 modules 都属于不可变的 objects.要手动让一个 object 不可变，可以调用下面这个特殊函数:transfer::freeze_object(obj);
                可变的共享objects       
                        Sui 里头的共享 objects 可以被任何人读和改。和被拥有的 objects 不一样，共享的 object 交易需要通过共识层协议得到的全局顺序。要创建一个共享的 object, 可以调用这个方法:transfer::share_object(obj);一旦一个 object 成为了共享的，就会保持可变的状态。任何人都可以通过发起交易去改变这个 object.
##### 参数传递与删除object
    参数传递(使用value，ref和mut ref)
        use sui::object::{Self};

    // 你被许可获取分数但不能修改它
    public fun view_score(transcriptObject: &TranscriptObject): u8{
        transcriptObject.literature
    }

    // 你被允许查看和编辑分数，但不能删除它
    public entry fun update_score(transcriptObject: &mut TranscriptObject, score: u8){
    transcriptObject.literature = score
    }

    // 你被允许对分数做任何的操作，包括查看、编辑、删除整个 transcript 
    public entry fun delete_transcript(transcriptObject:    TranscriptObject){
    let TranscriptObject {id, history: _, math: _, literature: _ } = transcriptObject;
    object::delete(id);
    }
###### object wrapping
    在 Sui Move 中有许多种方法可以将一个 object 嵌套在另一个 object 内。我们接下来介绍的第一种方法是 object wrapping.
        public struct WrappableTranscript has store {
            history: u8,
            math: u8,
            literature: u8,
            }

        public struct Folder has key {
        id: UID,
        transcript: WrappableTranscript,
        }
        在上面的例子中，Folder 封装了 WrappableTranscript, 并且 Folder 是可以根据其 id 查询地址等信息的，因为其具有 key 的能力。
object wrapping特性
     如果一个 struct 类型能被嵌入到一个 Sui object struct 中，这个 Sui object struct 通常具有 key 能力，被嵌入的 struct 必须具有 store 能力。当一个 object 被封装后，封装起来的 object 就不再能单独根据 object ID 来获取。它会变成 封装 object 的一部分。更重要的是，被封装的 object 不能被作为参数进行传递，而只能通过 封装 object 进行获取。
object wrapping例子
    修改wrappabletranscript和folder
        首先，需要给定制的类型warppabletranscript和fplder做一些调整
        1.给wrappabletranscript添加key能力，可以成为资产和被转移
        public struct WrappableTranscript has key, store {
            id: UID,
            history: u8,
            math: u8,
            literature: u8,
            }
        2.给folder struct增加一个额外的属性 intended_address 用来声名内部被封装起来的成绩记录单的目标观察者的地址
        public struct Folder has key {
            id: UID,
            transcript: WrappableTranscript,
            intended_address: address
        }

请求transcript的方法
        public entry fun request_transcript(transcript: WrappableTranscript, intended_address: address, ctx: &mut TxContext){
            let folderObject = Folder {
            id: object::new(ctx),
            transcript,
            intended_address
        };
        //We transfer the wrapped transcript object directly to the intended address
        transfer::transfer(folderObject, intended_address)
        }
        这个方法简易的把一个warppabletranscript object 封装到一个folder object中，并把这个folder object转移到目标地址。
解封transcript方法
    public entry fun unpack_wrapped_transcript(folder: Folder, ctx: &mut TxContext){
        // Check that the person unpacking the transcript is the intended viewer
        assert!(folder.intended_address == tx_context::sender(ctx), 0);
        let Folder {
            id,
            transcript,
            intended_address:_,
        } = folder;
        transfer::transfer(transcript, tx_context::sender(ctx));
        // Deletes the wrapper Folder object
        object::delete(id)
        }
        如果这个方法的调用者就是成绩记录单的目标观察者，就会从 Folder wrapper object 中解封装出 WrappableTranscript object, 然后将其发送给方法的调用者。
assert
    我们使用assert语法来判定在交易中解包出的成绩记录单的地址与 Folder wrapper object 中的 intended_address 属性是一致的。
    这个 assert! 宏会以下面的格式输入两个参数:assert!(<bool expression>, <code>)//这里的布尔表达式必须判断为真，否则就会弹出错误码 <code> 并中止。
定义错误码
    上面是用了默认的0来作为错误码，但其实我们也可以用下面的方式来定义其他错误码:
    const ENotIntendedAddress: u64 = 1;
    这个错误码会在应用层上被消耗掉并进行合适的处理。