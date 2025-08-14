# 资源
- [PPT](https://docs.google.com/presentation/d/1hBt0vHHURy_Lu5QiTKBMVHCj5S4QVif-SgXU4DhUu6I)

# ability

- key - 被修饰的值可以作为键值对全局状态进行访问。
- copy - 被修饰的值可以被复制。
- drop - 被修饰的值在作用域结束时可以被丢弃。
- store - 被修饰的值可以被存储到全局状态


## 语法
`has` 关键字 指明能力
`has ability1,ability2`
```rust
    public struct Dog has key,store{
    }
```

## 一个ability 都没有 
- 单纯的结构体
- 只能生存当前事务

## 只有key
自定义转移规则的对象

## key + store
- 可以自由转移的对象
- key存储在其他结构体里面

## 只有 store 
- 可以存储在其他对象里面



