sui client publish --gas-budget 35000000

# package id: 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44

# coinA cap: 0xece0dee1cd12dcb385c7b81db038c3f0f64e7b3be6a923c3d571a95594ccbbc2
# coinA type: 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44::coinA::COINA

# coinB cap: 0x651d8a261c1727a0012026aab731744caee0af6b49bd98afd62780f7cf63fecb
# coinB type: 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44::coinB::COINB


# mint coinA
sui client call --package 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44 \
                --module coinA \
                --function mint \
                --gas-budget 2500000 \
                --args 0xece0dee1cd12dcb385c7b81db038c3f0f64e7b3be6a923c3d571a95594ccbbc2 1000000 0x79a6386be5a90f7e0b1f67f58e8a5041363a5c50924412ad6694889b762fbaba

# mint coinB

sui client call --package 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44 \
                --module coinB \
                --function mint \
                --gas-budget 2500000 \
                --args 0x651d8a261c1727a0012026aab731744caee0af6b49bd98afd62780f7cf63fecb 1000000 0x79a6386be5a90f7e0b1f67f58e8a5041363a5c50924412ad6694889b762fbaba

# create_pool
sui client call --package 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44 \
                --module xiaodi_swap \
                --function create_pool \
                --gas-budget 3500000 \
                --type-args 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44::coinA::COINA 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44::coinB::COINB

# add lp
# pool id 0x09d56961c908ec1641d734099556d03977bbdaac51f876998c19bd60afac34d6
# coinA 0x811861e680c7943392ddcedf1b60042e767c5620e8003d5c280e3c42eb4387a1
# coinB 0x9919e9afe5b270f6204d8fbfcb0d2cc0ac33ede72d82a2b3c4483ae53652b831

sui client call --package 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44\
                --module xiaodi_swap \
                --function add_lp \
                --gas-budget 3500000 \
                --type-args 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44::coinA::COINA 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44::coinB::COINB \
                --args 0x09d56961c908ec1641d734099556d03977bbdaac51f876998c19bd60afac34d6 \
                       0x811861e680c7943392ddcedf1b60042e767c5620e8003d5c280e3c42eb4387a1 \
                       0x9919e9afe5b270f6204d8fbfcb0d2cc0ac33ede72d82a2b3c4483ae53652b831 

# mint a new coinA
# mint coinA
sui client call --package 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44 \
                --module coinA \
                --function mint \
                --gas-budget 2500000 \
                --args 0xece0dee1cd12dcb385c7b81db038c3f0f64e7b3be6a923c3d571a95594ccbbc2 5000 0x79a6386be5a90f7e0b1f67f58e8a5041363a5c50924412ad6694889b762fbaba
# new coinA id: 0x64cd588aff6747678bb6388b18165c1f8efb96ef48b1e5419673056f6046202c


# mint a new coinB
# mint coinB
sui client call --package 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44 \
                --module coinB \
                --function mint \
                --gas-budget 2500000 \
                --args 0x651d8a261c1727a0012026aab731744caee0af6b49bd98afd62780f7cf63fecb 1000000 0x79a6386be5a90f7e0b1f67f58e8a5041363a5c50924412ad6694889b762fbaba
# new coinB id: 0x26d2e4fe5a58fb2d476489affe30b2c58d7de85949d2291e6cdb6027f172d8e3

# swich a to b
sui client call --package 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44 \
                --module xiaodi_swap \
                --function swap_a_to_b \
                --gas-budget 3500000 \
                --type-args 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44::coinA::COINA 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44::coinB::COINB \
                --args 0x09d56961c908ec1641d734099556d03977bbdaac51f876998c19bd60afac34d6 \
                       0x64cd588aff6747678bb6388b18165c1f8efb96ef48b1e5419673056f6046202c \
                       5000
# hash id: 92txHgYNC7v6SV6v84L7WNJKcPwavX4VytKCbiHZiHT8

# swich a to b
sui client call --package 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44 \
                --module xiaodi_swap \
                --function swap_b_to_a \
                --gas-budget 3500000 \
                --type-args 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44::coinA::COINA 0x70803c60c5a226ef8738d26e4abaaa2a5be0d6d0448d1c90f9853ca1cf231a44::coinB::COINB \
                --args 0x09d56961c908ec1641d734099556d03977bbdaac51f876998c19bd60afac34d6 \
                       0x26d2e4fe5a58fb2d476489affe30b2c58d7de85949d2291e6cdb6027f172d8e3 \
                       5000

# hash id: AM79bsDCUv2GHrTnjeK5hJvt8ddjs6D9w9LguJhXyFay


sui client call --package 0x60695ee31f93add1f79909c884a55dff7e5f140bbd2e495819966bd2f7971d42 \
                --module check_in \
                --function get_flag \
                --gas-budget 2500000 \
                --args 80al xiaodi007 0x011f9404e6f167e549b617a53eea058029167a2beac26c624cbc3550e04b5ad2 0x8
