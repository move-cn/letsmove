# 存入 dao
 sui client call \
  --package 0x79be9eb0279e5b773f1e43ca0248fea51000a6263b565911f6797fbba1234dc8 \
  --module my_swap \
  --function in_dao \
  --args \
    0x76272cd1775fc96952d6d3f0e9f3e55d73e3135ad06249d1124b9d41075609dc \
    0x4b02a1e9a3579fcd68a17626f8813ddf677e2e5e0959fd997cb366f812a78c17 \
   --gas-budget 10000000

# --args
#   共享对象id
#   coin  id

# 存入 faucet

 sui client call \
  --package 0x79be9eb0279e5b773f1e43ca0248fea51000a6263b565911f6797fbba1234dc8 \
  --module my_swap \
  --function in_faucet \
  --args \
    0x76272cd1775fc96952d6d3f0e9f3e55d73e3135ad06249d1124b9d41075609dc \
    0x66aded0c1b19689e2d950faa43f481a8ac79d57cea9773b6ef5aa0ad3a51e101 \
   --gas-budget 10000000

# dao兑换 faucet

 sui client call \
  --package 0x79be9eb0279e5b773f1e43ca0248fea51000a6263b565911f6797fbba1234dc8 \
  --module my_swap \
  --function dao_to_faucet \
  --args \
    0x76272cd1775fc96952d6d3f0e9f3e55d73e3135ad06249d1124b9d41075609dc \
    0x313757d4c979d01622b432ba5023c6e213dc10697c7e936bdb98f146dcb24a6e \
   --gas-budget 10000000

# faucet 兑换 dao

 sui client call \
  --package 0x79be9eb0279e5b773f1e43ca0248fea51000a6263b565911f6797fbba1234dc8 \
  --module my_swap \
  --function faucet_to_dao \
  --args \
    0x76272cd1775fc96952d6d3f0e9f3e55d73e3135ad06249d1124b9d41075609dc \
    0xdb6d3a4588cda222eeea5c4cfcf29dfcd82a4018ac265c28f0cd170e5e081066 \
   --gas-budget 10000000

  # 取回

 sui client call \
  --package 0x79be9eb0279e5b773f1e43ca0248fea51000a6263b565911f6797fbba1234dc8 \
  --module my_swap \
  --function remove_dao \
  --args \
    0x27854b46072a1e02d348128aac07acfe3503f9cf3bf10e1b353dadf2f1884e31 \
    0x76272cd1775fc96952d6d3f0e9f3e55d73e3135ad06249d1124b9d41075609dc \
    10000000000 \
   --gas-budget 10000000

  # 取回
 sui client call \
  --package 0x79be9eb0279e5b773f1e43ca0248fea51000a6263b565911f6797fbba1234dc8 \
  --module my_swap \
  --function remove_faucet \
  --args \
    0x27854b46072a1e02d348128aac07acfe3503f9cf3bf10e1b353dadf2f1884e31 \
    0x76272cd1775fc96952d6d3f0e9f3e55d73e3135ad06249d1124b9d41075609dc \
    10000000000 \
   --gas-budget 20000000

# --args
#   admin cap id
#   共享对象id
#   value