测试网  
package owner:  
0xe34f375a8a64a137024c2893e031d5c5a95d6f493c8fab1936de985fbe28ac72  
另一个测试账户：0xe34f375a8a64a137024c2893e031d5c5a95d6f493c8fab1936de985fbe28ac72  
### 央行模式  
使用部署package的账户执行，可以给任何地址mint  
sui client call --function mint_and_transfer --module mycoin --package 0xb78dc86bf0c2da02c7fefad61423f0231f5296e41432b2ecc85a155b5ee120f7 --args 0xd6c87ecc01fb04499144c04498f9ff89f222933c7c1750b8b6bda88bddba717a 1 0xe34f375a8a64a137024c2893e031d5c5a95d6f493c8fab1936de985fbe28ac72 --gas-budget 100000000  
sui client switch --address 切换到另一个测试账户执行，无法执行  
sui client call --function mint_and_transfer --module mycoin --package 0xb78dc86bf0c2da02c7fefad61423f0231f5296e41432b2ecc85a155b5ee120f7 --args 0xd6c87ecc01fb04499144c04498f9ff89f222933c7c1750b8b6bda88bddba717a 1 0x575354b119bc4be704c5d5dc91bb6ce496f93726b412a430f19df93246fb2f0d --gas-budget 100000000
![2_1.png](2_1.png)
### 水龙头模式
sui client switch --address 切换到另一个测试账户执行, 可以执行了  
sui client call --function mint_and_transfer --module faucetcoin --package 0xb78dc86bf0c2da02c7fefad61423f0231f5296e41432b2ecc85a155b5ee120f7 --args 0xa558445812d3208673653e09ab166a3639fb24ff8ac0968e30f47d0dce676d18 1 0xe34f375a8a64a137024c2893e031d5c5a95d6f493c8fab1936de985fbe28ac72 --gas-budget 100000000  
### mainnet
sui client call --function mint_and_transfer --module mycoin --package 0xb6cc08bf63cca28b57ecbc2877c623cba827ef4cf16f9e9446dbc99345687e2a --args 0x88069e0cf3d093f528b597b3431d8fe37308759cbe9877648949dc13a6c0bec5 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 100000000
