#  c: &mut TreasuryCap<T>,
#  amount: u64,
#  recipient: address,
#  ctx: &mut TxContext,

sui client call  \
--package 0x2 \
--module coin  \
--function mint_and_transfer  \
--type-args 0xaee23c549056b6865c8f00d1da90e70e44e14835650374eb25b6b812680075fa::yishengyouni_coin::YISHENGYOUNI_COIN \
--args  0xc001c2859aae4416e5b9c160f1661ed8ded22a1cd4a2ce32d3218750fe0fbd5e 1000000 0x55e6af2f34ebfdd87bf6e78e07aca04a9ff05be46e4421ee6d9133a39b19545e \