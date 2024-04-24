1.ehco 安装 rust和cargo
2.根据教程安装sui
3.编写hellosui，改githubid
4.查看钱包地址，领水
5.建立move模块文件，发布上链
6.找到packageid
7.提交pr
ps：感谢 @门前雪 大佬的解惑
/***
 *      ┌─┐       ┌─┐ + +
 *   ┌──┘ ┴───────┘ ┴──┐++
 *   │                 │
 *   │       ───       │++ + + +
 *   ███████───███████ │+
 *   │                 │+
 *   │       ─┴─       │
 *   │                 │
 *   └───┐         ┌───┘
 *       │         │
 *       │         │   + +
 *       │         │
 *       │         └──────────────┐
 *       │                        │
 *       │                        ├─┐
 *       │                        ┌─┘
 *       │                        │
 *       └─┐  ┐  ┌───────┬──┐  ┌──┘  + + + +
 *         │ ─┤ ─┤       │ ─┤ ─┤
 *         └──┴──┘       └──┴──┘  + + + +
 */
Task2:
1.一整天的花费，部署好了我在sui上的第一个代币
2.了解了gas的区间原理
3.还有结构体的使用细节
Task3:
1.将自己的github头像作为NFT的图片mint
2.这个NFT被我命名为miracle，希望他能给我最终create one miracle.
Task4:
1.借鉴了其他的作品完成了一个简单的小游戏
2.这个游戏的规则是需要玩家输入一个数字，然后程序会随机生成一个数字。如果玩家猜中了程序生成的数字，且这个数字是0，那么输出"WTF? "；如果玩家猜中了程序生成的数字，但这个数字不是0，那么输出"Good! You win!"；如果玩家没有猜中程序生成的数字，那么输出"you lose..."。游戏的目标就是猜中程序生成的数字，以获胜。其中调用了Clock以生成随机数，并在需要传入 Clock 时，直接使用它的地址 0x6，就可以传入 Clock 对象。
3.游戏模块为gunksdgame
Task5:
1.有史以来打的最惨烈的一场！
2.从2024.4.23下午一点开始做到2024.4.24下午两点此时此刻，中间夜里两点多睡觉，早上九点多起来的，太不容易了。
3.在流动性池子的构建中需要非常明确的指出两种币种的名称指定，而且不能像我一样之前将这两个币命名为了一个名字，导致三次大修，objectID和packageID（coin的）不能搞混淆！！！！
4.创建了三个pool，最后一个才成功
5.前两个由于我猜测是因为没有添加流动性，所以导致无法交易（牢记）
6.OK，大概就这么多，还有一个命令过程，也贴一下吧（会不会太长了？）：

铸造的两种币的objectID（一共九个）：
A1:0x459c30d2866435eaa4ff7465cd675064f119674558a20a3d0354978a0fdf430b      0xb4ea041850ca08ee26878bdbb27e4d28537e84d8cde11472f0c444e757bf207d::gunksd_coin::GUNKSD_COIN
A2:0x4d63529dab99184326faf931616be2d2be05ce450f11257031be774610e35456
A3:0xb32a11806a1b5e2d07960428aa6501a66dec905fe4b19c71a63b47519f26c35c
A4:0xbc1a908f96dba3c90697d6a8fe818f6d3605f6a2969be183ac3416e5596a9eee
B1:0x17d69b43820d29ba4ad29a824e710a8dc2017fd02901be2d50390d436188dddf   0xcaa34ad3bdfde6ff74240279844549be22a71d4e96ecd0dbd97a2c85ef4681c2::gunksd_faucet::GUNKSD_FAUCET
B2:0xbad72c7043caf3a7ba482469f026227a98ca8c98fa38ec0a5af7d768ba108d12
B3:0xe1334abcf82bc247ca3e23d28825281e4406ea6ebbee4f78300ebc9594fdf103
B4:0xed1d07627a5d8734cfd404c40608d054fe7572f07472c9f228c7668b9eac40dc
B5:0xf192b90d3ea2f0757b320a5cf897f3d0194cb54d796fbf54cc78cbe37d5c7cb9


//创建池子：sui client call --gas-budget 7500000 --package 0xb44145573278571384c1ab5d27ed34fad3e302c60113c7d2b6c62e1c064ca945 --module gunksd --function create_pool --type-args 0xb4ea041850ca08ee26878bdbb27e4d28537e84d8cde11472f0c444e757bf207d::gunksd_coin::GUNKSD_COIN 0xcaa34ad3bdfde6ff74240279844549be22a71d4e96ecd0dbd97a2c85ef4681c2::gunksd_faucet::GUNKSD_FAUCET --args 0x459c30d2866435eaa4ff7465cd675064f119674558a20a3d0354978a0fdf430b 0x17d69b43820d29ba4ad29a824e710a8dc2017fd02901be2d50390d436188dddf

poolID（share）：0x7c9faf19b58b01f085c337f7402173451976d7967c6b2bcc68802a3bc5253739
lpID（1,000,000）：0x7299a2b5a3fead3029cea90691339af30b4608bfcb8e510beae78fe1f4470bd5          

//第一次添加流动性：sui client call --gas-budget 7500000 --package 0xb44145573278571384c1ab5d27ed34fad3e302c60113c7d2b6c62e1c064ca945 --module gunksd --function add_liquidity --type-args 0xb4ea041850ca08ee26878bdbb27e4d28537e84d8cde11472f0c444e757bf207d::gunksd_coin::GUNKSD_COIN 0xcaa34ad3bdfde6ff74240279844549be22a71d4e96ecd0dbd97a2c85ef4681c2::gunksd_faucet::GUNKSD_FAUCET --args 0x7c9faf19b58b01f085c337f7402173451976d7967c6b2bcc68802a3bc5253739 0x4d63529dab99184326faf931616be2d2be05ce450f11257031be774610e35456 0xbad72c7043caf3a7ba482469f026227a98ca8c98fa38ec0a5af7d768ba108d12

lp_2 ID(1,000,000):0xc6c315ceeb2fc73f84150f425efd6062b2b097f94c3226768eeb1d9c28760f4b

//第二次添加等量流动性：sui client call --gas-budget 7500000 --package 0xb44145573278571384c1ab5d27ed34fad3e302c60113c7d2b6c62e1c064ca945 --module gunksd --function add_liquidity --type-args 0xb4ea041850ca08ee26878bdbb27e4d28537e84d8cde11472f0c444e757bf207d::gunksd_coin::GUNKSD_COIN 0xcaa34ad3bdfde6ff74240279844549be22a71d4e96ecd0dbd97a2c85ef4681c2::gunksd_faucet::GUNKSD_FAUCET --args 0x7c9faf19b58b01f085c337f7402173451976d7967c6b2bcc68802a3bc5253739 0xb32a11806a1b5e2d07960428aa6501a66dec905fe4b19c71a63b47519f26c35c 0xe1334abcf82bc247ca3e23d28825281e4406ea6ebbee4f78300ebc9594fdf103


lp_3 ID(1,000,000):0x1fb1a4bb0a6817c7a0dc2a2aff853f526e54f7b871a74920c6f5bcedc3b8ccf3


sui client call --gas-budget 7500000 --package 0xb44145573278571384c1ab5d27ed34fad3e302c60113c7d2b6c62e1c064ca945 --module gunksd --function remove_liquidity --type-args 0xb4ea041850ca08ee26878bdbb27e4d28537e84d8cde11472f0c444e757bf207d::gunksd_coin::GUNKSD_COIN 0xcaa34ad3bdfde6ff74240279844549be22a71d4e96ecd0dbd97a2c85ef4681c2::gunksd_faucet::GUNKSD_FAUCET --args 0x7c9faf19b58b01f085c337f7402173451976d7967c6b2bcc68802a3bc5253739 0x1fb1a4bb0a6817c7a0dc2a2aff853f526e54f7b871a74920c6f5bcedc3b8ccf3

//remove流动性之后得到的两个代币ID：
COIN_A_ID_5(FAUCET):  0x168f8f8bea194323fd87a72ee57fe1c366cffdd309e8c81abac3d87a0c07ff98
COIN_B_ID_5(COIN): 0x6cd310a18d16b12e10c141b080a8e9ed91efa47c2b23b92f2dcfd9500d2b8c4d

//swap : sui client call --gas-budget 7500000 --package 0xb44145573278571384c1ab5d27ed34fad3e302c60113c7d2b6c62e1c064ca945 --module gunksd --function swap_a_to_b --type-args 0xb4ea041850ca08ee26878bdbb27e4d28537e84d8cde11472f0c444e757bf207d::gunksd_coin::GUNKSD_COIN 0xcaa34ad3bdfde6ff74240279844549be22a71d4e96ecd0dbd97a2c85ef4681c2::gunksd_faucet::GUNKSD_FAUCET --args 0x7c9faf19b58b01f085c337f7402173451976d7967c6b2bcc68802a3bc5253739 0xbc1a908f96dba3c90697d6a8fe818f6d3605f6a2969be183ac3416e5596a9eee
Task6:
1.下载了nodejs，调用npm
2.使用sdk来进行deposit操作，成功将1sui存进去








 
