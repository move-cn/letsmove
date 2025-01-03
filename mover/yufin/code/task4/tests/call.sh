# testnet

#vault<FAUCET> pkgID: 0x60bc1b8e7f9219a10fb3886b666bb4a68556c3992d37697da5b880043de413fb
#FAUCET typeId: 0x115adc3cce5ec094078e6a17c65336a2780a0ec579042f11aeda3f5a8d3b8d3d::faucet::FAUCET

# flipV2 pkgid: 0xab9394bb569f178b6b711bc6b46d951c0307e516d57f138e527246ddb84a9513
# vault pkgid: 0x59553951c763b904caeb9efbcfa77b9af6a099b1d2546ea64dfd67adad8fae0d

sui client call --package 0xab9394bb569f178b6b711bc6b46d951c0307e516d57f138e527246ddb84a9513 \
  --module flip_coin \
  --function play \
  --type-args 0x115adc3cce5ec094078e6a17c65336a2780a0ec579042f11aeda3f5a8d3b8d3d::faucet::FAUCET \
  --args 0x8 \
  0x59553951c763b904caeb9efbcfa77b9af6a099b1d2546ea64dfd67adad8fae0d \
  true \
  0x771f0656ed44300dca07c49fc5e9dcc22f800efce1fd6da514c0903cc3791cc3 \
  50000000


# mainnet

sui client call --package 0x6c38fa662e97fc659e1e9181b074342fe398f5dca6b64e428e927df0bf2883a4 \
  --module flip_coin \
  --function play \
  --type-args 0xe31a18ace543a8d317824b15718a54cf0477e5c93bcedb2f4c5d877dedc16a18::faucet::FAUCET \
  --args 0x8 \
  0xe1684af2aeb4659196f57ae47ad09878d59e4e69faf258e52febd121202f921e \
  true \
  0x68ac633bd609f7dc74cb60e63e4b9d44b2658ee67d4745347fae4c19e7eb727a \
  50000000