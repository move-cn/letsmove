task1：
编译合约：sui move build

部署合约：sui client publish --gas-budget 200000000 --skip-dependency-verification

生成github的ssh秘钥ssh-keygen -t rsa -b 4096 -C "346460017@qq.com"

查询当前连接的网络，是测试网还是主网：sui client envs

查询当前连接账户的地址：sui client active-address

检查账户余额：sui client balance


task2：
public_transfer 独享 mint权限
public_share_object 共享 mint权限

