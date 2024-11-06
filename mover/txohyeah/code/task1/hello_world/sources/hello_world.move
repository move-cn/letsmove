/// 命名地址 `hello_world` 下的 `hello_world` 模块。
/// 命名地址在 `Move.toml` 中设置。
module hello_world::hello_world {
    // 从标准库导入 `String` 类型
    use std::string::String;
    /// 返回 "Hello, World!" 作为 `String`。
    public fun hello_world(): String {
        b"Hello, txohyeah!".to_string()
    }
}
