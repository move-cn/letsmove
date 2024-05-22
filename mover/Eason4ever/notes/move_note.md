## 基本内容

abilities:
- copy: 值可以被拷贝或者克隆
- drop: 在作用域之外被丢弃
- key: 在全局存储中可以作为标识符
- store: 值可以直接放在全局存储中

如果一个custom types同时有key和store那么可以称为assets，从而可以在多个账户之间发生转移。

```move
/// An object that contains an arbitrary string
struct HelloWorldObject has key, store {
    /// UID is a Sui Framework type (sui::object::UID) that defines the globally unique ID of an object.
  	id: UID,
  	/// A string contained in the object
  	text: string::String
}
```

函数的可见性有三个：
- private: the default visibility of a function; it can only be accessed by functions inside the same module
- public: the function is accessible by functions inside the same module and by functions defined in another module
- public(friend): the function is accessible by functions inside the same module and by functions defined in modules that are included on the module's friends list.

mint函数
```move
public fun mint(ctx: &mut TxContext) {
    let object = HelloWorldObject {
        id: object::new(ctx),
        text: string::utf8("Hello, World!"),
    };
    transfer::public_transfer(object, tx_context::sender(ctx));
}
```



init函数

当一个module publish的时候会调用这个函数，并且它有一个参数`&mut TxContext`