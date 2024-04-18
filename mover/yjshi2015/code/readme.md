
sui client call --function mint --module YJSHI2015 --package 0xd3d25977e330df53d950b2aee5297bb0bead66183efe7e6e8787cfd50abcaa63 --args 0x9c4d630b88b3ae441d5fa24fa75cdd9c884b49f35dfb582da288e1c285d0e1ed 666000000000 0xc494732d09de23389dbe99cb2f979965940a633cf50d55caa80ed9e4fc4e521e --gas-budget 10000000

sui client call --function mint --module YJSHI2015FAUCET --package 0xd3d25977e330df53d950b2aee5297bb0bead66183efe7e6e8787cfd50abcaa63 --args 0xe5068a2cc5b430fb4bc9e48d55b046b141b084cc55109f50152ea7b7ccf967dd 888000000000 0xc4301a727914c051c987331f30d002ef907f6f6e4badfec8981e6275ed22486c --gas-budget 10000000


sui client transfer [OPTIONS] --to <TO> --object-id <OBJECT_ID> --gas-budget <GAS_BUDGET>

sui client transfer --to 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --object-id 0x9c4d630b88b3ae441d5fa24fa75cdd9c884b49f35dfb582da288e1c285d0e1ed --gas-budget 100000000

sui client pay [OPTIONS] --gas-budget <GAS_BUDGET>

sui client pay  --gas-budget 100000000 --input-coins 0x9c4d630b88b3ae441d5fa24fa75cdd9c884b49f35dfb582da288e1c285d0e1ed --recipients 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --amounts 6000000000