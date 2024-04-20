## 安装环境

本地使用nodejs+pnpm进行navi-sdk环境的安装

```bash
pnpm i navi-sdk
```

## sdk交互

阅读文档的这一部分 https://naviprotocol.gitbook.io/navi-protocol-developer-docs/how-to-interact-with-the-contract/navi-sdk/api-interface#interactions-with-navi-protocol

能够发现`depositToNavi`和`withdraw`分别是存钱和取钱的函数调用，直接编写对应的代码即可

需要注意，通过助记词方式导入的账号在提交github代码的时候需要检查一下！不然助记词公开账户就透明啦！