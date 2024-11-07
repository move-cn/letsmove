module hello_world::hello_world {
    // 从标准库导入 `String` 类型
    use std::string::String;
    /// 返回 "Hello, World!" 作为 `String`。
    public fun hello_world(): String {
        b"Hello, World!ctianming".to_string()
    }
}