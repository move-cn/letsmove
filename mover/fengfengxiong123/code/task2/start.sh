 sui client call \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args 0xd54f752374f2112fec4a0707c51daa98d5d1e8f0ace74977090ccff9d083a40a::faucetcoin::FAUCETCOIN \
  --args \
    0x7f4a9920bdda5357d382ba8f6f46a3733b66a88aabfa0031d71e1f0d98abf778 \
    1000000000 \
    0x2af6c1938280cf418ce388f62deffe9a56746d0887c9e6c031a4127016987e35 \
   --gas-budget 100000000