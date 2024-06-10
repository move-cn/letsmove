# push
sui client publish --gas-budget 100000000


# mint

 sui client call --gas-budget 100000000 \
 --package  0x2 \
 --module coin \
 --function mint_and_transfer \
 --type-args '0xb39046148a3761bd9ec0a707aee1118f1b357e58ccb5f5075f84507686b43cde::tangyuan2323coin::TANGYUAN2323COIN' \
 --args 0x0153bc653df828f3b9585a97dc94697d68e24ab77ddff5a92d5c0fcf1c322d9e 100000000000 0x1909fedb6ccc24ae653aefd63ef20e966595e9cceac7b752116e97f3ac75096f


  sui client call --gas-budget 100000000 \
  --package  0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0x26758c3a1aa0c3bf388cf7d94c90bb46ab3668c7ad99add1acd5139424b93533::hk::HK' \
  --args 0xaee1414d10f4ca34780ad4d149d6eaf8fce0c8833da27e75dd6b0f8b769af9cb 100000000000 0xff71ff2dfa9f5ba0176fb40fdda9d13d738ec97143b46bdfa1addc09e2263b02