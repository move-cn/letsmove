# testnet
# pebblerwon packageid: 0x0ef48bbf55fb1c0b7d228ad5d76ea28d70dace2df21c856dcf8eae78a4cbd6d5

# testnet client addresses 0x09be6b8995b7f56d8491a67f54519c56059d3fc24124470366b7ee5b51c27a91
# testnet bank id: 0x854d568bccf3bf1f6ff5e20f84bb005308db15551937cd083c6469c923f4559c
## mint whn
  sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0x5bedaf1084a9f6a7c98a205ca56550c75bb13376cc34c07fc3c5bddc6b17d813::whn_coin::WHN_COIN' \
  --args 0xbbe765228d36c58cbdfa1cd3ab90ac11ba280866fd5dbe3e1cad15f5571f5316 999000 0x09be6b8995b7f56d8491a67f54519c56059d3fc24124470366b7ee5b51c27a91


##>>> whn coin id: 0x37eb400f032abcf528b001d439f9e5e2a3f82591d5472b61a7e9ebed052f4784


## mint whn_facuet
  sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0x4c5e927d8dd0fe7bc37cfbca401376d6ccc300f6b79cf40f19a1cf329c521dd2::whn_coin::WHN_COIN' \
  --args 0x19e69a05953b0e065ebcd6a9705db902c21ac97f2bc14eb364ea79a889978d0c 999000 0x09be6b8995b7f56d8491a67f54519c56059d3fc24124470366b7ee5b51c27a91



##>>> whn_facuet id: 0xf27249f4b800c2a7f7dd86d6d3dc2ecfd6051e3716932ff2690299ea93b7a944

# deposit_whn
  sui client call \
  --package 0x0ef48bbf55fb1c0b7d228ad5d76ea28d70dace2df21c856dcf8eae78a4cbd6d5 \
  --module pebblerwon_swap \
  --function deposit_whn \
  --args 0x854d568bccf3bf1f6ff5e20f84bb005308db15551937cd083c6469c923f4559c 0x37eb400f032abcf528b001d439f9e5e2a3f82591d5472b61a7e9ebed052f4784


# deposit_whn_facuet
  sui client call \
  --package 0x0ef48bbf55fb1c0b7d228ad5d76ea28d70dace2df21c856dcf8eae78a4cbd6d5 \
  --module pebblerwon_swap \
  --function deposit_whn_facuet \
  --args 0x854d568bccf3bf1f6ff5e20f84bb005308db15551937cd083c6469c923f4559c 0xf27249f4b800c2a7f7dd86d6d3dc2ecfd6051e3716932ff2690299ea93b7a944


# swap_coin_to_facuet
# whn_coin id:0x04c38159baa572ca8c87505094e54645c9463bea4df2ced0163e3435c5283061
  sui client call \
  --package 0x0ef48bbf55fb1c0b7d228ad5d76ea28d70dace2df21c856dcf8eae78a4cbd6d5 \
  --module pebblerwon_swap \
  --function swap_coin_to_facuet \
  --args 0x854d568bccf3bf1f6ff5e20f84bb005308db15551937cd083c6469c923f4559c 0x04c38159baa572ca8c87505094e54645c9463bea4df2ced0163e3435c5283061

##>>> transaction digest: 7X9fabpBMxQM5Y9h8et9HEdSMueUphPmcJ9DLDNUwBDE

# swap_facuet_to_coin
# whn_coin_facuet id: 0xd2c27ba848b0bfade9130349b424d8435b29591f2c0ffd810ef6a05b15d6e9d8
  sui client call \
  --package 0x0ef48bbf55fb1c0b7d228ad5d76ea28d70dace2df21c856dcf8eae78a4cbd6d5 \
  --module pebblerwon_swap \
  --function swap_facuet_to_coin \
  --args 0x854d568bccf3bf1f6ff5e20f84bb005308db15551937cd083c6469c923f4559c 0xd2c27ba848b0bfade9130349b424d8435b29591f2c0ffd810ef6a05b15d6e9d8
##>>> transaction digest: 5yheKC53RXoHGp5j62JBHWxmikHwBYFJoTGAzt2zgXru