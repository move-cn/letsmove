## 单元测试
- #[test] 让注释方法变成仅用于测试;
- #[test_only] 将模块或模块成员（use、function、struct或const）注释为仅用于测试的代码。
- #[expected_failure] 希望被注释的测试方法执行的结果为失败

调用测试方法的命令为 `sui move test` 。 注意，#[test] 注释只能对不带参数的方法有效：


```rust
    #[test] // 执行Sui move test 后会打印 5
    fun this_is_a_test() {
        let x:u8 = 5;
        debug::print(&x);
    }

    #[test] //执行会报错，因为方法需要参数
    fun this_is_not_correct (arg: u8){
        debug::print(&arg);
    } 
```

 - [Scenario](https://learnblockchain.cn/article/8066)