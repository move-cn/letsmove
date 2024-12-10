## move 学习
### 第一课
1. 了解 move 的特性和 sui 环境安装，创建 sui 钱包
2. 初始化sui 本地的 move 项目
3. 学习 hellomove的编译并发布到 sui 的测试网
   - 初始化项目 sui move new 项目名
   - sources 目录下是代码
   - Move.toml中的name = "hollo_move" 需要与代码中的module hollo_move  保持一致
   - 发布使用 sui move  publish  如果下载失败可能是 git 仓库问题可以换成 gitee 的 [dependencies]
     Sui = { git = "https://gitee.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/testnet" }
   - 发布成功后 可以在 sui 测试网上看到相关的区块信息
4. 疑问？ 编译之后生成了 Move.lock 文件，这个文件是啥？