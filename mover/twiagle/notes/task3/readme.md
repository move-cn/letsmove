测试网  
package owner:  0xe34f375a8a64a137024c2893e031d5c5a95d6f493c8fab1936de985fbe28ac72  
另一个测试账户：0x575354b119bc4be704c5d5dc91bb6ce496f93726b412a430f19df93246fb2f0d
testnet  
sui client call --function mint_nft --module nft --package 0x2ff6ba6ac93fe77c548eb8d0f77e36e2f0870fff9ee33a3fc0e41b130a1b2355 --args 0x9334bb610c498e72e545b11a3b7a8afc4f1b7632079ae37ee950853d0f3eb934    
sui client call --function transfer --module nft --package 0x2ff6ba6ac93fe77c548eb8d0f77e36e2f0870fff9ee33a3fc0e41b130a1b2355 --args 0x53b0025b27ae58ed6d13637b4e1030a49a779e7c61976dc9c4730ab0c2bd1665 0xe2469bd8dcba6c0218e653771e5aa44f4f54b4399e313f90db8b80fa2cb55dd6    
![2_1.png](2_1.png)
mainnet  
sui client call --function mint_nft --module nft --package 0x35f60449ff05ec249e8d3b49e71d4ccd96ffa6147e3c356bf91f6803bce36db1 --args 0x47a3946b73d39057f6fb0504ca84daca44dd24410baaa49d4edda45dafe04edc    
sui client call --function transfer --module nft --package 0x35f60449ff05ec249e8d3b49e71d4ccd96ffa6147e3c356bf91f6803bce36db1 --args 0xd7697c50ec9857b3b7a6c899758f3450948cd87a65a21e8f116db6eb8899e41c 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2    
