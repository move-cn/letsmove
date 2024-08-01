1. 安装钱包 Sui Wallet
   * 本地生成钱包: `sui client new-address ed25519`
2. 安装 Sui: `brew install sui`
3. Sui 网络环境
   * 主网(mainnet): https://fullnode.mainnet.sui.io:443
   * 测试网(testnet): https://fullnode.testnet.sui.io:443
   * 开发网(devnet): https://fullnode.devnet.sui.io:443
   * 本地网(localnet): http://0.0.0.0:9000  
     * 生成本地网络配置文件: `sui genesis`
     * 启动本地网: `sui start`
     * 查看客户端环境: `sui client envs`
     * 测试本地网络：
```bash
  curl --location --request POST 'http://127.0.0.1:9000' \
--header 'Content-Type: application/json' \
--data-raw '{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "sui_getTotalTransactionBlocks",
  "params": []
}'
```
5. 领取测试币 
   * 激活网络： `sui client switch --env local`，其中 env 是网络名称，可通过 `sui client envs` 查看
   * 领取测试币：`sui client faucet --address 0x7456bc01b777214947ac935bad71f75a7b7b09352ad99877d15de56530df1408 --url http://127.0.0.1:9000`
   * 创建新的网络: `sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443`
6. 领取测试币2
   * 直接加入 discord 领取，找到 `testnet-faucet` channel，发送： `!faucet 0x7456bc01b777214947ac935bad71f75a7b7b09352ad99877d15de56530df1408`  
   * dev 同理，channel 名为：`devnet-faucet`
   * 另外，在 sui wallet 的设置页面，切换网络到 testnet\devent 之后，也有领取测试币的按钮
7. 区块浏览器
   * 主网: https://suiscan.xyz/mainnet/home ，devnet测试网: https://suiscan.xyz/devnet/home
8. 合约开发'
   * Move VSC 插件: `move-analyzer`，并安装 LSP: `cargo install --git https://github.com/move-language/move move-analyzer`
   * 创建合约项目: `sui move new hello_move`
   * 构建: `sui move build`
   * 测试: `sui move test`
   * 部署合约: `sui client publish`