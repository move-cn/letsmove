# Sui CTF Checkin

## 1. 编写合约 ctf_checkin_try
提供my_flag 结算出来flag_result
## 2. 编译合约
cd move/ctf_checkin_try
sui client build
## 3. 部署合约  
sui client publish
## 4. 编写客户端 client.ts
使用flag_result ，github_id 调用check_in 函数

## 5. 运行客户端
```bash
ts-node client.ts
```