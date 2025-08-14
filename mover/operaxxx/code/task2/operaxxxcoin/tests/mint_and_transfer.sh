sui client call --package 0x2 \
    --module coin \
    --function mint_and_transfer \
    --type-args 0x827512624ed69e79d9286a2147e8b4348ec9a82d358e3f794c71ebe8f15cd609::operaxxxcoin::OPERAXXXCOIN \
    --args 0xfb186daa580d59699e5269b948a069f2b120a4fe3a39010d7abda4dacdbe3de7 100000000 0x9155d867536bd59d4a4ca7692ebc5e38a6e9bea8e2ab6d828b598656ad1e564b

# testnet
sui client call --package 0x2 \
    --module coin \
    --function mint_and_transfer \
    --type-args 0xc72b224027d944d198dc2458d8110d1027f17dc4da96140fa96f12a1a4cb9367::operaxxxcoin::OPERAXXXCOIN \
    --args 0x6d30509227cade051f5b20a917bbae468dd542776e6bee05e5738044225abf06 100000000 0x9155d867536bd59d4a4ca7692ebc5e38a6e9bea8e2ab6d828b598656ad1e564b
