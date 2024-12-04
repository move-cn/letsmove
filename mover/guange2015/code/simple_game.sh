
# 部署合约
sui client switch --address Jason
sui client publish --skip-dependency-verification

export PACKAGE_ID=0x89e881bf4c66c050fd15f3a79134e9579c059a856afffde84fbe7ccb00e6e515
export GAME_ID=0x41cf903294529897c8dbf91c958f4ce51930c667d1676ca6e4772407ec8261b2
export ADMINCAP_ID=0xfe9c2c03fb480d7d9b7d70f8a90d11e3684535e6b7bfb9099a0bd996a38c273f

# 打入初始化资金

## 先分离出1个sui
sui client pay-sui --input-coins 0x47a5fd9e0ea98f052aa659864242a457274c1e18d84176dfd3d46b3084efdf05 --recipients $JASON --amounts 1000000000 --gas-budget 10000000
export COIN=0x0fbd092a4c5153468735113669afb04ec6e7314eb6efb4d105aad38fb16afb88
sui client call --function add_pool --package $PACKAGE_ID --module simple_game --args $ADMINCAP_ID $GAME_ID $COIN

#此时合约的资金池中有1个sui
sui client object $GAME_ID --json|jq ".content .fields .balance"

## 玩游戏
sui client switch --address Alice
## 先分离出0.1个sui
sui client pay-sui --input-coins 0x249b3f80cda43f6d6e19af732213bc699b080030af6600f0e1fc2cde727c7f0d --recipients $ALICE --amounts 100000000 --gas-budget 10000000
export COIN=0x3faebdc9a9557d6a75c0f92ba4ad301f2f887ad56a28102b8fef322bcde8c4a9
sui client call --function play --package $PACKAGE_ID --module simple_game --args $GAME_ID $COIN 0x6

# 可以去浏览器查看中奖事件

## 紧急取出资金
sui client switch --address Jason
sui client call --function emgency_withdraw --package $PACKAGE_ID --module simple_game --args $ADMINCAP_ID $GAME_ID 1100000000
