# Hello Move 合約

這是一個簡單的 Sui Move 智能合約，用於演示基本的 Move 語言功能。該合約專注於返回問候消息，而不創建任何區塊鏈物件。

## 功能說明

### 主要函數

1. **`hello_move()`**
   - 返回簡單的 "Hello Move" 消息
   - 不需要任何參數
   - 返回類型：`string::String`

2. **`hello_world()`**
   - 返回經典的 "Hello, World!" 消息
   - 不需要任何參數
   - 返回類型：`string::String`

3. **`hello_with_name(name: vector<u8>)`**
   - 根據提供的名字返回自定義問候消息
   - 參數：`name` - 要問候的名字（以字節向量形式）
   - 返回格式：`"Hello, [name]!"`
   - 返回類型：`string::String`
   - 支持中文名字

## 合約特點

- **輕量級**：不創建任何區塊鏈物件，節省 gas 費用
- **簡單易懂**：適合初學者學習 Move 語言
- **多語言支持**：支持各種語言的名字，包括中文
- **純函數**：所有函數都是純函數，沒有副作用

## 使用示例

```move
// 獲取基本問候
let message1 = hello_move::hello_move();
// 結果: "Hello Move"

// 獲取世界問候
let message2 = hello_move::hello_world();
// 結果: "Hello, World!"

// 自定義名字問候
let message3 = hello_move::hello_with_name(b"Alice");
// 結果: "Hello, Alice!"

// 中文名字問候
let message4 = hello_move::hello_with_name(b"小明");
// 結果: "Hello, 小明!"
```

## 測試

合約包含完整的測試套件，覆蓋所有功能：

- `test_hello_move()` - 測試基本問候功能
- `test_hello_world()` - 測試世界問候功能
- `test_hello_with_name()` - 測試英文名字問候
- `test_hello_with_chinese_name()` - 測試中文名字問候

## 運行測試

```bash
sui move test
```

## 編譯

```bash
sui move build
```

## 項目結構

```
hello_move/
├── Move.toml              # 項目配置文件
├── README.md              # 本說明文件
├── sources/
│   └── hello_move.move    # 主合約文件
└── tests/
    └── hello_move_tests.move  # 測試文件
```

## 技術規格

- **Move 版本**: 2024.beta
- **依賴**: Sui Framework
- **語言**: Move
- **測試框架**: Sui Move Test Framework

## 貢獻

歡迎提交 Issue 和 Pull Request 來改善這個項目。

## 許可證

本項目採用開源許可證。
