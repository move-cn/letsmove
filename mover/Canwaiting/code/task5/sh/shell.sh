# 账号：0x1ed530caea7483b8113fdfbce2fbd782c9780511397b3398ec8c65054f60c0d6
# 所在网络：devnet
# 目录：1/ 创建&mint代币 2/ 池、交换

# 1/______________________________
# fungible_tokens（publish、mint）
export PACKAGE_ID=0xf37274bc2f5d7b4ccabc63340d70ac17491025d1a38ff485870854cec72924cb;
export TREASURY_CAP=0xdfb6d5e08797e3dc516289714a7389411dc4c6dfec7719d9d5e35efaa4b60bfb;
export AMOUNT=10000;
export RECEIVER=0x1ed530caea7483b8113fdfbce2fbd782c9780511397b3398ec8c65054f60c0d6;
               
sui client call --package $PACKAGE_ID --module managed\
                --function mint\
                --args $TREASURY_CAP $AMOUNT $RECEIVER\
                --gas-budget 20000000 
#执行哈希：38B4CCeqLeTjX3sUvJVLkh1bpGYmSjjTFWXpcyvRWoEb
#币：0xf37274bc2f5d7b4ccabc63340d70ac17491025d1a38ff485870854cec72924cb::managed::MANAGED


# my_tokens（publish、mint）
export PACKAGE_ID=0x31b965559a8912527870996cdee8053c0e70be5d042006acba619d14387bb4fc;
export TREASURY_CAP=0xdecf441793fdf004920779777191b62ec3a2044dc0b2423152593e783f7a6890;
export AMOUNT=10000;
export RECEIVER=0x1ed530caea7483b8113fdfbce2fbd782c9780511397b3398ec8c65054f60c0d6;
sui client call --package $PACKAGE_ID --module managed\
                --function mint\
                --args $TREASURY_CAP $AMOUNT $RECEIVER\
                --gas-budget 20000000 
#执行哈希：Ajt8Y69KiLsnwviwGfBcS4jycWtNCx1e5hkoiCpy64un
#币：0x31b965559a8912527870996cdee8053c0e70be5d042006acba619d14387bb4fc::managed::MANAGED
#---------------------------------------



#2/______________________________
export PACKAGE_ID=0x52f0d6f8d5482c033c0503a4e8bdd7eca6765014ad212de2693f09cfff8bc8b5;
export COIN_X=0xf37274bc2f5d7b4ccabc63340d70ac17491025d1a38ff485870854cec72924cb::managed::MANAGED;
export COIN_Y=0x31b965559a8912527870996cdee8053c0e70be5d042006acba619d14387bb4fc::managed::MANAGED;
#2.1/ 创建池
sui client call  --package $PACKAGE_ID\
                --module swap --function create_pool --gas-budget 20000000 \
                --type-args  $COIN_X $COIN_Y
export POOL_ID=0x52bd6f59989cc736468dc18b501be2f3ba5352c6611602e9e757bee31706114c;

#2.2/ 增加流动性
export COIN_X=0xf37274bc2f5d7b4ccabc63340d70ac17491025d1a38ff485870854cec72924cb::managed::MANAGED;
export COIN_Y=0x31b965559a8912527870996cdee8053c0e70be5d042006acba619d14387bb4fc::managed::MANAGED;
sui client call  --package $PACKAGE_ID\
                --module swap --function add_pool --gas-budget 20000000 \
                --type-args $COIN_X $COIN_Y \
                --args $POOL_ID\
                '["0x20340b38111137187ebefcdeb920300888da01bc5a617e4e2ff694e5eb03158c"]' '["0xae4377960c83eb2b71f5999692840f383d1c4416b0a99d7064d2200e11097cee"]' 10 10 
#执行哈希：HqsmptWkaTLJUSxUZYhBNydixMPVMEzkR6Lqb7KokQHf
#*余额：
#COIN_X：100->99.9
#COIN_Y：100->99.9
#LP：0->20
#*池子状态：
#COIN_X：0->10
#COIN_Y：0->10


#2.3/ 交换（XtoY & YtoX）
sui client call  --package $PACKAGE_ID\
                --module swap --function swap_x_y --gas-budget 20000000 \
                --type-args  $COIN_X $COIN_Y \
                --args $POOL_ID '["0xc5b9fa42c1adbfdc695924d451d80ba3c6c6e9af26ae6ffd0e00f48e7b09d88e"]' 5
#执行哈希：3Yg9BkuoDDHSGCHHBHKAioTSiEFFzo1wfrr8ZZZZk8Ua
#*余额：
#COIN_X：99.9->99.85
#COIN_Y：99.9->99.95
#*池子状态：
#COIN_X：10->15
#COIN_Y：10->5

sui client call  --package $PACKAGE_ID\
                --module swap --function swap_y_x --gas-budget 20000000 \
                --type-args  $COIN_X $COIN_Y \
                --args $POOL_ID '["0xc72390e4ac32239555e22302ded8243336243e7c71f74d243fb3f67be3fac871"]' 5
#执行哈希：6uryDKEbN6WaYDogtVRb9NvZahgm2AMxbg8MfR19e12P
#*余额：
#COIN_X：99.85->99.9
#COIN_Y：99.95->99.9
#*池子状态：
#COIN_X：15->10
#COIN_Y：5->10

#2.4/ 移除流动性
sui client call  --package $PACKAGE_ID\
                --module swap --function remove --gas-budget 20000000 \
                --type-args  $COIN_X $COIN_Y \
                --args $POOL_ID   '["0x3880d3fd9c3587161a55b9f9204745b11138352d02fa7215abc61f806b3e6c52"]' 10 10


#执行哈希：6fzcuobz1U3phHJqTy4b7eqB35b6kq8PRoJNNDTtZjtq
#*余额：
#COIN_X：99.9->100
#COIN_Y：99.9->100
#*池子状态：
#COIN_X：10->0
#COIN_Y：10->0