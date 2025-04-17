# get the flag string
sui client object 0x383b4496174472e74cf4718349e86752b2af46b018e198a71a89017c248071ac
# LetsMoveCTF

# test the code
sui move test --skip-fetch-latest-git-deps
# 0x02a39c050f39618f5c8ff02a9c3cf107c61217cbe6146d7393638c02e93fa405

# get the flag
# entry fun get_flag(
#     flag: vector<u8>,
#     github_id: String,
#     flag_str: &mut FlagString,
#     rand: &Random,
#     ctx: &mut TxContext
sui client call \
    --package 0x4f55dd10d70209565e2a613150b3bf468b9903ac5fab4d56981ae6399b9be165 \
    --module check_in \
    --function get_flag \
    --args "0x02a39c050f39618f5c8ff02a9c3cf107c61217cbe6146d7393638c02e93fa405" \
        "timerring" \
        0x383b4496174472e74cf4718349e86752b2af46b018e198a71a89017c248071ac \
        0x08
