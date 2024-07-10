# push
sui client publish


# mint

 sui client call  \
 --package  0x2 \
 --module coin \
 --function mint_and_transfer \
 --type-args '0x26758c3a1aa0c3bf388cf7d94c90bb46ab3668c7ad99add1acd5139424b93533::rmb::RMB' \
 --args 0xc4d306168ee191ce5102a1c723abd8e71840c569cc06df63f4945fa8e6c06903 100000000000 0xff71ff2dfa9f5ba0176fb40fdda9d13d738ec97143b46bdfa1addc09e2263b02


  sui client call  \
  --package  0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args '0xb99cfc7d536dff9934d889294eb86814dd918c016f0726b235da0a33e27f4e5a::tangyuan2323faucetcoin::TANGYUAN2323FAUCETCOIN' \
  --args 0xb2cd56dfaf964551878b1a09a28928ddc3fd4d10932c65bd6b8ca376292ed1b6 100000000000 0x869ddd76420f6fea42a63ff5a0f7a381951b336ceb131367268120d213df2fff