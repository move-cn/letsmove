## 关于RPC节点
在部署的时候遇到 502 的问题，做了两个尝试：
1. 更换了梯子节点，好像效果并不是很好；
2. 创建一个新环境，连接到连接到 https://rpc-testnet.suiscan.xyz:443 的测试网络 RPC 节点
```bash
sui client new-env --alias suiscan-testnet --rpc https://rpc-testnet.suiscan.xyz:443 
sui client switch --env suiscan-testnet 
```
附：RPC 节点的网站：https://sui.publicnode.com/

## 关于路径问题
部署时遇到了指定路径没有找到配置文件的问题，是因为在 task1 目前下``` sui move new hellomove```后，没有 cd 到 该目录下，正确步骤是：
```bash
sui move new hellomove
cd hellomove
```