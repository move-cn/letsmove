# 存入 dao
 sui client call \
  --package 0x2652eb0f0ec2655013e116118a23793672ffd6d0473876c2d7afa45598af4f31 \
  --module my_swap \
  --function in_dao \
  --args \
    0x83b94639779d775921de56ae90e8001d973b48eb4b9d6603600c04000a72938a \
    0xf4a551ae11cc81a9de0ea3faa18c3132f4ecf648ddff29aaa2365698f06b8ae7 \
   --gas-budget 10000000

# --args
#   共享对象id
#   coin  id

# 存入 faucet

 sui client call \
  --package 0x2652eb0f0ec2655013e116118a23793672ffd6d0473876c2d7afa45598af4f31 \
  --module my_swap \
  --function in_faucet \
  --args \
    0x83b94639779d775921de56ae90e8001d973b48eb4b9d6603600c04000a72938a \
    0x9107a001e419bee9e649bf550554719478940eec96a302072c37ffc4664179a9 \
   --gas-budget 10000000

# dao兑换 faucet

 sui client call \
  --package 0x2652eb0f0ec2655013e116118a23793672ffd6d0473876c2d7afa45598af4f31 \
  --module my_swap \
  --function dao_to_faucet \
  --args \
    0x83b94639779d775921de56ae90e8001d973b48eb4b9d6603600c04000a72938a \
    0xca161d3772690d387763ba25d7991828beaa230ad925271cecf14cc23bb17ea0 \
   --gas-budget 10000000

# faucet 兑换 dao

 sui client call \
  --package 0x2652eb0f0ec2655013e116118a23793672ffd6d0473876c2d7afa45598af4f31 \
  --module my_swap \
  --function faucet_to_dao \
  --args \
    0x83b94639779d775921de56ae90e8001d973b48eb4b9d6603600c04000a72938a \
    0x78de10b1436ecba242741ff21a631e150f1d9bbd0bb030bb1087c4433e397fb8 \
   --gas-budget 10000000

  # 取回

 sui client call \
  --package 0x2652eb0f0ec2655013e116118a23793672ffd6d0473876c2d7afa45598af4f31 \
  --module my_swap \
  --function remove_dao \
  --args \
    0x0c4d2f1d3537d7f6285a6dce07098251a3f7e365389c78d9f4956594e42cbc02 \
    0x83b94639779d775921de56ae90e8001d973b48eb4b9d6603600c04000a72938a \
    10000000000 \
   --gas-budget 10000000

  # 取回
 sui client call \
  --package 0x2652eb0f0ec2655013e116118a23793672ffd6d0473876c2d7afa45598af4f31 \
  --module my_swap \
  --function remove_faucet \
  --args \
    0x0c4d2f1d3537d7f6285a6dce07098251a3f7e365389c78d9f4956594e42cbc02 \
    0x83b94639779d775921de56ae90e8001d973b48eb4b9d6603600c04000a72938a \
    10000000000 \
   --gas-budget 20000000

# --args
#   admin cap id
#   共享对象id
#   value