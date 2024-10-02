package:0x9d3fe26e16b24cbc7298e3502a559110d15bd3a4ba284fe24960f45ffc95ab50

faucet_coin_type:faucet_coin_type: 0x0979c51c937edd8d13be2f1a95ce2f1c0dc6bb02b7b85b2c9f0cccc72eb4adc4::faucetcoin::FAUCETCOIN
coin_type:0x0979c51c937edd8d13be2f1a95ce2f1c0dc6bb02b7b85b2c9f0cccc72eb4adc4::mycoin::MYCOIN


pool: 0xb98e23dbdc7673fea4701275683907e4b80b5aa1b124549435f6b4c116657387

faucet_coin:0xcec60da46dfc65ad2be9d496de5cf49ea528e512173281ad32cd5a5e88c7e6c5
coin: 0xb86c20ed19982f582ad3eb913cc902c8ac2293b3b44d0d6ac768cb8450db83ca
```
# createPool
sui client call --package 0x9d3fe26e16b24cbc7298e3502a559110d15bd3a4ba284fe24960f45ffc95ab50  \
                --module CoinSwap  \
                --function createPoool  \
                  \
                --type-args 0x0979c51c937edd8d13be2f1a95ce2f1c0dc6bb02b7b85b2c9f0cccc72eb4adc4::faucetcoin::FAUCETCOIN 0x0979c51c937edd8d13be2f1a95ce2f1c0dc6bb02b7b85b2c9f0cccc72eb4adc4::mycoin::MYCOIN
```

```
# deposit

sui client call --package 0x9d3fe26e16b24cbc7298e3502a559110d15bd3a4ba284fe24960f45ffc95ab50  \
                --module CoinSwap  \
                --function depositA  \
                  \
                --args 0xb98e23dbdc7673fea4701275683907e4b80b5aa1b124549435f6b4c116657387 0xcec60da46dfc65ad2be9d496de5cf49ea528e512173281ad32cd5a5e88c7e6c5 \
                --type-args 0x0979c51c937edd8d13be2f1a95ce2f1c0dc6bb02b7b85b2c9f0cccc72eb4adc4::faucetcoin::FAUCETCOIN 0x0979c51c937edd8d13be2f1a95ce2f1c0dc6bb02b7b85b2c9f0cccc72eb4adc4::mycoin::MYCOIN

```

```
# swap

sui client call --package 0x9d3fe26e16b24cbc7298e3502a559110d15bd3a4ba284fe24960f45ffc95ab50  \
                --module CoinSwap  \
                --function swapB_to_A  \
                  \
                --args 0xb98e23dbdc7673fea4701275683907e4b80b5aa1b124549435f6b4c116657387 0xb86c20ed19982f582ad3eb913cc902c8ac2293b3b44d0d6ac768cb8450db83ca \
                --type-args 0x0979c51c937edd8d13be2f1a95ce2f1c0dc6bb02b7b85b2c9f0cccc72eb4adc4::faucetcoin::FAUCETCOIN 0x0979c51c937edd8d13be2f1a95ce2f1c0dc6bb02b7b85b2c9f0cccc72eb4adc4::mycoin::MYCOIN

```


