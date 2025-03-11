# 调用官方0x2下面 coin module 里面的 mint_and_transfer 方法

# 参数说明 Coin Mint
# 参数1: PackageId::ModuleName::CoinName
# 参数2: TreasuryAddress
# 参数3: Amount 
# 参数4: YourAddress
sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0xc49669ad5956fba19cc5b0f204e6dd80bcf0cd91992ef98a52033eb44775c3a6::tyasriochaocoin::TYASRIOCHAOCOIN \
--args 0x6aa8146977e4e9bf6a38037a3df286f74680d853586a58b11e3c7be19b25a30e 1000000000 0x7406ffbbbfa7068b85692ba0a14253596ec1d1467a530fdc5a8f36e934af24fc

# 参数说明 Faucet Mint
# 参数1: PackageId::ModuleName::CoinName
# 参数2: TreasuryAddress
# 参数3: Amount 
# 参数4: YourAddress1
sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0xc49669ad5956fba19cc5b0f204e6dd80bcf0cd91992ef98a52033eb44775c3a6::tyasriochaofaucet::TYASRIOCHAOFAUCET \
--args 0x36bc5ec6a8fb829f6c91364bb60866f9a2f8fc885ce1c29bf486d2d77fc7104a 1000000000 0x7406ffbbbfa7068b85692ba0a14253596ec1d1467a530fdc5a8f36e934af24fc

# 参数说明 Faucet Mint
# 参数1: PackageId::ModuleName::CoinName
# 参数2: TreasuryAddress
# 参数3: Amount 
# 参数4: YourAddress2
sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0xc49669ad5956fba19cc5b0f204e6dd80bcf0cd91992ef98a52033eb44775c3a6::tyasriochaofaucet::TYASRIOCHAOFAUCET \
--args 0x36bc5ec6a8fb829f6c91364bb60866f9a2f8fc885ce1c29bf486d2d77fc7104a 1000000000 0xaaacce9f41637a2f686240368cfd985aa1110cc49e19dad64fedc574f17160c8
