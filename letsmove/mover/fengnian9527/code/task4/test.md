
```shell
package: 0x6398fc0ef890eeabb05ce1862e7c480abd8b5d1c76ab3a6d232f57fc2a1c2731
adminCap: 0x942549c09dea9e8a6217b77660d11b451f42c5a1c322d0e61e91b7982487ed02
faucet_coin_type: 0x0979c51c937edd8d13be2f1a95ce2f1c0dc6bb02b7b85b2c9f0cccc72eb4adc4::faucetcoin::FAUCETCOIN
pool: 0xb688202e23d61afb92c1ef5f39eba467f4ee9f54f41cf65b40ec612d67c445f6

faucet_coin_teausery:0x4ee950d2aa8b6f9c5531578be5c082949ef2800a2a86e2f223110f7846411942
coin:0x49d1314945af2f19ad7d6f008c74bc1a975c648c5fb82f90dbfcdb43a6f4288a
play_coin:0x1f41ea72798403bd02da1301653314ed88f168e0beb944a2fafffae8c54ade79
```

## create pool
```
sui client call --package 0x6398fc0ef890eeabb05ce1862e7c480abd8b5d1c76ab3a6d232f57fc2a1c2731  \
                --module guess_number  \
                --function createPool  \
                  \
                --args 0x942549c09dea9e8a6217b77660d11b451f42c5a1c322d0e61e91b7982487ed02 \
                --type-args 0x0979c51c937edd8d13be2f1a95ce2f1c0dc6bb02b7b85b2c9f0cccc72eb4adc4::faucetcoin::FAUCETCOIN
```


## deposit
```shell
sui client call --package 0x6398fc0ef890eeabb05ce1862e7c480abd8b5d1c76ab3a6d232f57fc2a1c2731  \
                --module guess_number  \
                --function depoist \
                  \
                --args 0xb688202e23d61afb92c1ef5f39eba467f4ee9f54f41cf65b40ec612d67c445f6 0x49d1314945af2f19ad7d6f008c74bc1a975c648c5fb82f90dbfcdb43a6f4288a \
                --type-args 0x0979c51c937edd8d13be2f1a95ce2f1c0dc6bb02b7b85b2c9f0cccc72eb4adc4::faucetcoin::FAUCETCOIN
```
```shell
# play
sui client call --package  0x6398fc0ef890eeabb05ce1862e7c480abd8b5d1c76ab3a6d232f57fc2a1c2731\
                --module guess_number \
                --function play \
                 \
                --args 0x1f41ea72798403bd02da1301653314ed88f168e0beb944a2fafffae8c54ade79 \
                       0xb688202e23d61afb92c1ef5f39eba467f4ee9f54f41cf65b40ec612d67c445f6 \
                       4 \
                       0x6 \
                --type-args 0x0979c51c937edd8d13be2f1a95ce2f1c0dc6bb02b7b85b2c9f0cccc72eb4adc4::faucetcoin::FAUCETCOIN
```


```shell
# withdraw
sui client call --package  0x6398fc0ef890eeabb05ce1862e7c480abd8b5d1c76ab3a6d232f57fc2a1c2731\
                --module guess_number \
                --function withdraw \
                 \
                --args 0x942549c09dea9e8a6217b77660d11b451f42c5a1c322d0e61e91b7982487ed02 \
                       0xb688202e23d61afb92c1ef5f39eba467f4ee9f54f41cf65b40ec612d67c445f6 \
                --type-args 0x0979c51c937edd8d13be2f1a95ce2f1c0dc6bb02b7b85b2c9f0cccc72eb4adc4::faucetcoin::FAUCETCOIN
```