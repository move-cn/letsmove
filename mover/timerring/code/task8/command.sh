sui client object 0x5ac1604b094913a25fd476e54ff0dcc43db827640175f8d01fe4a7267be52d95 --bcs

# generate proof
# [144, 33, 88, 178, 117, 115, 249, 252]
# 0x902158b27573f9fc

# # get_flag
# entry fun get_flag(
#     proof: vector<u8>,    //  `u8` 类型的向量，表示某种加密证明（可能是挑战的解决方案）。
#     github_id: String,        // 提交证明的用户的 GitHub ID 字符串
#     challenge: &mut Challenge,   // 指向一个 `Challenge` 对象
#     rand: &Random,                     // 随机数
#     ctx: &mut TxContext  
sui client call \
    --package 0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f \
    --module lets_move \
    --function get_flag \
    --args 0x902158b27573f9fc \
        timerring \
        0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9 \
        0x08