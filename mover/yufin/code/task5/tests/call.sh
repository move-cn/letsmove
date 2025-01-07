# pool packageID 0x1dc21c38bf40580eb45efe8d220a1bfb498d75082515c331a207d5801c517979
# testnet
sui client call --package 0xf1a06ba9be1a9ae24ea4d24c06e7e2d828f223775c55e2d56275be2965abba43 \
  --module yufin \
  --function create_pool \
  --type-args 0xf66e365f9f900eeb6ba09bc71a7bafb854cd864455050eb9829a5308bc92bc4a::mycoin::MYCOIN \
  0x115adc3cce5ec094078e6a17c65336a2780a0ec579042f11aeda3f5a8d3b8d3d::faucet::FAUCET \
  --args 0xa749a1c078aa9b4259a8aa0bf5ab97dd430d762546c7af8850db07b0d9a9ca38 \
  3 \
  200 \
  1000

#  pool 0x0bf78e0088f551af754e321f1ebfe2d852593cb94b3adc48a9ef5f4abec9aed3

sui client call --package 0xf1a06ba9be1a9ae24ea4d24c06e7e2d828f223775c55e2d56275be2965abba43 \
  --module yufin \
  --function add_liquidity \
  --type-args 0xf66e365f9f900eeb6ba09bc71a7bafb854cd864455050eb9829a5308bc92bc4a::mycoin::MYCOIN \
  0x115adc3cce5ec094078e6a17c65336a2780a0ec579042f11aeda3f5a8d3b8d3d::faucet::FAUCET \
  --args 0x0bf78e0088f551af754e321f1ebfe2d852593cb94b3adc48a9ef5f4abec9aed3 \
  0x837e8237a9d980cfc244ba05c93521a3c71e25ea1e057870152294298d70a07b \
  0x771f0656ed44300dca07c49fc5e9dcc22f800efce1fd6da514c0903cc3791cc3


sui client call --package 0xf1a06ba9be1a9ae24ea4d24c06e7e2d828f223775c55e2d56275be2965abba43 \
  --module yufin \
  --function swap_to_coina \
  --type-args 0xf66e365f9f900eeb6ba09bc71a7bafb854cd864455050eb9829a5308bc92bc4a::mycoin::MYCOIN \
  0x115adc3cce5ec094078e6a17c65336a2780a0ec579042f11aeda3f5a8d3b8d3d::faucet::FAUCET \
  --args 0x0bf78e0088f551af754e321f1ebfe2d852593cb94b3adc48a9ef5f4abec9aed3 \
  0x19fb421bf958a074e271c0eba1aca573b1429b85fcab452e5fc9b698b978578a \
  40000000

sui client call --package 0xf1a06ba9be1a9ae24ea4d24c06e7e2d828f223775c55e2d56275be2965abba43 \
  --module yufin \
  --function swap_to_coinb \
  --type-args 0xf66e365f9f900eeb6ba09bc71a7bafb854cd864455050eb9829a5308bc92bc4a::mycoin::MYCOIN \
  0x115adc3cce5ec094078e6a17c65336a2780a0ec579042f11aeda3f5a8d3b8d3d::faucet::FAUCET \
  --args 0x0bf78e0088f551af754e321f1ebfe2d852593cb94b3adc48a9ef5f4abec9aed3 \
  0x14eaf5fe70ac779c1b5bde9ca7fd9ae6e6876d31bb8c083601a9345cfdf212e5 \
  40000000


#  mainnet

#pkg 0xfbbe7bf2da2589103369910b042479da6d2afcdf9091819d1780afefe37b2da6
# adminCap 0x82e2200346f91261f491a5a505ed33649a40c3d039d83058231bb352dcfd25d5
sui client call --package 0xfbbe7bf2da2589103369910b042479da6d2afcdf9091819d1780afefe37b2da6 \
  --module yufin \
  --function create_pool \
  --type-args 0xe31a18ace543a8d317824b15718a54cf0477e5c93bcedb2f4c5d877dedc16a18::mycoin::MYCOIN \
  0xe31a18ace543a8d317824b15718a54cf0477e5c93bcedb2f4c5d877dedc16a18::faucet::FAUCET \
  --args 0x82e2200346f91261f491a5a505ed33649a40c3d039d83058231bb352dcfd25d5 \
  3 \
  200 \
  1000

#  pool 0x88a7bb26206e6e6248caf7e3fbea79ce5770f8d4e775bc464f673d533c9fedf5

sui client call --package 0xfbbe7bf2da2589103369910b042479da6d2afcdf9091819d1780afefe37b2da6 \
  --module yufin \
  --function add_liquidity \
  --type-args 0xe31a18ace543a8d317824b15718a54cf0477e5c93bcedb2f4c5d877dedc16a18::mycoin::MYCOIN \
  0xe31a18ace543a8d317824b15718a54cf0477e5c93bcedb2f4c5d877dedc16a18::faucet::FAUCET \
  --args 0x88a7bb26206e6e6248caf7e3fbea79ce5770f8d4e775bc464f673d533c9fedf5 \
  0x34a70df78866eae4855d86f5c70bd170c72dea91d788757fd6b39e693eda1669 \
  0x7acd068e09553904b4c356003353e3986f4386ee4735d7f57d89ef830f0491e6


sui client call --package 0xfbbe7bf2da2589103369910b042479da6d2afcdf9091819d1780afefe37b2da6 \
  --module yufin \
  --function swap_to_coina \
  --type-args 0xe31a18ace543a8d317824b15718a54cf0477e5c93bcedb2f4c5d877dedc16a18::mycoin::MYCOIN \
  0xe31a18ace543a8d317824b15718a54cf0477e5c93bcedb2f4c5d877dedc16a18::faucet::FAUCET \
  --args 0x88a7bb26206e6e6248caf7e3fbea79ce5770f8d4e775bc464f673d533c9fedf5 \
  0x20371a14f17a79792e1b5b515e2757612ed152b959f64accfb3022174eeef084 \
  40000000

sui client call --package 0xfbbe7bf2da2589103369910b042479da6d2afcdf9091819d1780afefe37b2da6 \
  --module yufin \
  --function swap_to_coinb \
  --type-args 0xe31a18ace543a8d317824b15718a54cf0477e5c93bcedb2f4c5d877dedc16a18::mycoin::MYCOIN \
  0xe31a18ace543a8d317824b15718a54cf0477e5c93bcedb2f4c5d877dedc16a18::faucet::FAUCET \
  --args 0x88a7bb26206e6e6248caf7e3fbea79ce5770f8d4e775bc464f673d533c9fedf5 \
  0xba13c7949cf4f50b30c8cecb52f40bbccef2b911b92e04e1028a9efa00a37070 \
  100 \
  --gas-budget 3000000