/// 模組: hello_move
/// 一個簡單的Hello Move合約，返回消息而不創建物件
module hello_move::hello_move {
    use std::string;

    /// 返回簡單的 "Hello Move" 消息
    public fun hello_move(): string::String {
        string::utf8(b"Hello Move")
    }

    /// 根據提供的名字返回自定義的問候消息
    public fun hello_with_name(name: vector<u8>): string::String {
        let mut message = string::utf8(b"Hello, ");
        string::append(&mut message, string::utf8(name));
        string::append(&mut message, string::utf8(b"!"));
        message
    }

    /// 返回 "Hello, World!" 消息
    public fun hello_world(): string::String {
        string::utf8(b"Hello, World!")
    }
}


