# Hello Move 合約

這是一個簡單的 Sui Move 智能合約，用於演示基本的 Move 語言功能。該合約在初始化時創建一個包含問候消息的 Hello 物件，並將其轉移給部署者。

## 功能說明

### 資料結構

**`Hello`** 結構體
- `id: UID` - 物件的唯一標識符
- `say: String` - 儲存問候消息的字串

### 主要函數

**`init(ctx: &mut TxContext)`**
- 合約初始化函數，在部署時自動執行
- 創建一個新的 Hello 物件，包含 "jack-751" 問候消息
- 將創建的物件轉移給合約部署者
- 參數：`ctx` - 交易上下文

## 合約特點

- **物件導向**：創建可擁有和轉移的區塊鏈物件
- **個人化**：包含特定的用戶識別符 "jack-751"
- **自動初始化**：部署時自動執行初始化邏輯
- **所有權轉移**：演示 Sui 的物件所有權模型

## 使用場景

這個合約適合用於：
- 學習 Sui Move 的基礎語法
- 理解物件創建和轉移機制
- 作為更複雜合約的起始模板

## 部署後的行為

當合約部署後：
1. `init` 函數自動執行
2. 創建一個包含 "jack-751" 消息的 Hello 物件
3. 物件被轉移給部署者的地址
4. 部署者可以查看、轉移或使用該物件
```

## 測試

合約包含基礎的測試套件：

- `test_scenario_setup()` - 測試基本場景設置功能
- `test_address_validation()` - 測試地址驗證功能

**注意**: 由於 `init` 函數是內部函數且只在合約部署時執行，無法在單元測試中直接調用。實際的物件創建和轉移功能需要通過完整的部署流程來驗證。

## 運行測試

```bash
sui move test
```

預期輸出：
```
Running Move unit tests
[ PASS    ] hello_move::hello_move_tests::test_address_validation
[ PASS    ] hello_move::hello_move_tests::test_scenario_setup
Test result: OK. Total tests: 2; passed: 2; failed: 0
```

## 運行測試

```bash
sui move test
```

## 編譯

```bash
sui move build
```

## 部署

```bash
sui client publish --gas-budget 20000000
```

## 項目結構

```
hello_move/
├── Move.toml                  # 項目配置文件
├── README.md                  # 本說明文件
├── sources/
│   └── hello_move.move       # 主合約文件
└── tests/
    └── hello_move_tests.move # 測試文件
```

## 技術規格

- **Move 版本**: 1.51.1
- **依賴**: Sui Framework
- **語言**: Move
- **測試框架**: Sui Move Test Framework
- **作者**: jack-751

## 學習要點

通過這個合約，您可以學習到：
- Move 模組的基本結構
- Sui 物件的創建和所有權
- `init` 函數的使用
- ASCII 字串的處理
- 物件轉移機制

## 貢獻

歡迎提交 Issue 和 Pull Request 來改善這個項目。

## 許可證

本項目採用開源許可證。
