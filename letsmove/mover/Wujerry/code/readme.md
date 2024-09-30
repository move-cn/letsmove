# testnet 
package: 0x3fb6261f5c44534312b418d5044adb70d4d4fa62dc7aec1a2ba7408328eaa5d2
coinPackage: 0x46a5ce14c83765f46daec795a44a7d5fb79e52c6023df46a8ae5f0b7795d32cd
pool: 0x0b433b20b27ab6f2e53d1a2cfb38af01185dfdd006b14294427c4cf9a911b2e4
tokenCap: 0x8af8b51aabbb8c20f3b6288f345cf3821c7d83283e93ebdec70d43eb147f31b1
faucetCap: 0x9fca891de4384995087ecca21b2c3190f6cf0120aca256a53f61d83943317051
tokenType: 0x46a5ce14c83765f46daec795a44a7d5fb79e52c6023df46a8ae5f0b7795d32cd::jerry_token::JERRY_TOKEN
faucetTokenType: 0x46a5ce14c83765f46daec795a44a7d5fb79e52c6023df46a8ae5f0b7795d32cd::jerry_faucet_token::JERRY_FAUCET_TOKEN

### get token
```bash
sui client call --package 0x46a5ce14c83765f46daec795a44a7d5fb79e52c6023df46a8ae5f0b7795d32cd --module jerry_token \
--function mint --args 0x8af8b51aabbb8c20f3b6288f345cf3821c7d83283e93ebdec70d43eb147f31b1 10000000 \ 0x781979aa4c2ebc2d88be8c3f50dc2da7a69d9e9191f4ce3fd9bd7cf192203d6a \
--gas-budget 5000000
```

### get faucet token
```bash
sui client call --package 0x46a5ce14c83765f46daec795a44a7d5fb79e52c6023df46a8ae5f0b7795d32cd --module jerry_faucet_token  \
--function mint --args 0x9fca891de4384995087ecca21b2c3190f6cf0120aca256a53f61d83943317051 10000000 \ 0x781979aa4c2ebc2d88be8c3f50dc2da7a69d9e9191f4ce3fd9bd7cf192203d6a \
--gas-budget 5000000
```

### create pool
```bash
sui client call --package 0x3fb6261f5c44534312b418d5044adb70d4d4fa62dc7aec1a2ba7408328eaa5d2 --module swap --function create_pool --args 0x20b6a8d46b734d3c17579dc3999a89ee6d43fc8cfd31a386cab285be859b6efa 0x081c8c5f784d19428476c8629dd2a5d3b2c02fcd82dd296fce60b2d214b9b5c5 --type-args 0x46a5ce14c83765f46daec795a44a7d5fb79e52c6023df46a8ae5f0b7795d32cd::jerry_token::JERRY_TOKEN 0x46a5ce14c83765f46daec795a44a7d5fb79e52c6023df46a8ae5f0b7795d32cd::jerry_faucet_token::JERRY_FAUCET_TOKEN --gas-budget 5000000
```

### swap a -> b
```bash
sui client call --package 0x3fb6261f5c44534312b418d5044adb70d4d4fa62dc7aec1a2ba7408328eaa5d2 --module swap --function swap_a_2_b --args 0x0b433b20b27ab6f2e53d1a2cfb38af01185dfdd006b14294427c4cf9a911b2e4 0x031f2da13576f34c74981b1b0d635c41ee5fa2e6ea17782db9517e9cac5cc456 --type-args 0x46a5ce14c83765f46daec795a44a7d5fb79e52c6023df46a8ae5f0b7795d32cd::jerry_token::JERRY_TOKEN 0x46a5ce14c83765f46daec795a44a7d5fb79e52c6023df46a8ae5f0b7795d32cd::jerry_faucet_token::JERRY_FAUCET_TOKEN --gas-budget 5000000
```

### swap b -> a
```bash
sui client call --package 0x3fb6261f5c44534312b418d5044adb70d4d4fa62dc7aec1a2ba7408328eaa5d2 --module swap --function swap_b_2_a --args 0x0b433b20b27ab6f2e53d1a2cfb38af01185dfdd006b14294427c4cf9a911b2e4 0x5e74e4e26f399edd44ae1b0581b681df6ae37b5bdf046fd4c9fd492d2e658348 --type-args 0x46a5ce14c83765f46daec795a44a7d5fb79e52c6023df46a8ae5f0b7795d32cd::jerry_token::JERRY_TOKEN 0x46a5ce14c83765f46daec795a44a7d5fb79e52c6023df46a8ae5f0b7795d32cd::jerry_faucet_token::JERRY_FAUCET_TOKEN --gas-budget 5000000
```

# mainnet 
package: 0x7e71bb622e1683fdec8369624db34d6ee5c8e7d681a14c4e5e7923d77aeae2f5
coinPackage: 0x29dc673186351105c22905403d596fd93177cfe0ac250cfbf1090eaefd1113f2
pool: 0x687ac693b4d95cae8b67f79072b630da16a1ecb39f57ebe1f43fa46bf6f89eec
tokenCap: 0x15f3aeee2a88b241f7077795dd81d49060f1788c0d92d194b02cc45974002d8e
faucetCap: 0x243f50420ed6bf0c16c205d6dbe1f7706857ec8838b9785611d2618393377ed5
tokenType: 0x29dc673186351105c22905403d596fd93177cfe0ac250cfbf1090eaefd1113f2::jerry_token::JERRY_TOKEN
faucetTokenType: 0x29dc673186351105c22905403d596fd93177cfe0ac250cfbf1090eaefd1113f2::jerry_faucet_token::JERRY_FAUCET_TOKEN

### get token
```bash
sui client call --package 0x29dc673186351105c22905403d596fd93177cfe0ac250cfbf1090eaefd1113f2 --module jerry_token \
--function mint --args 0x15f3aeee2a88b241f7077795dd81d49060f1788c0d92d194b02cc45974002d8e 10000000 \ 0x781979aa4c2ebc2d88be8c3f50dc2da7a69d9e9191f4ce3fd9bd7cf192203d6a \
--gas-budget 5000000
```

### get faucet token
```bash
sui client call --package 0x29dc673186351105c22905403d596fd93177cfe0ac250cfbf1090eaefd1113f2 --module jerry_faucet_token  \
--function mint --args 0x243f50420ed6bf0c16c205d6dbe1f7706857ec8838b9785611d2618393377ed5 10000000 \ 0x781979aa4c2ebc2d88be8c3f50dc2da7a69d9e9191f4ce3fd9bd7cf192203d6a \
--gas-budget 5000000
```

### create pool
```bash
sui client call --package 0x7e71bb622e1683fdec8369624db34d6ee5c8e7d681a14c4e5e7923d77aeae2f5 --module swap --function create_pool --args 0x790d5b44a99b285e5766f52a37b757216079b82d11742f6ed0dfb0a994ba0445 0x397e82fdfdff117d0b377293b87ef2727f644d14971be83134c587b091efeb74 --type-args 0x29dc673186351105c22905403d596fd93177cfe0ac250cfbf1090eaefd1113f2::jerry_token::JERRY_TOKEN 0x29dc673186351105c22905403d596fd93177cfe0ac250cfbf1090eaefd1113f2::jerry_faucet_token::JERRY_FAUCET_TOKEN --gas-budget 5000000
```
hash: `7ufXFK2Zgcc6vKtS2JqmQybYwGGzGrwgJJBbEetzaRDn`

### swap a -> b
```bash
sui client call --package 0x7e71bb622e1683fdec8369624db34d6ee5c8e7d681a14c4e5e7923d77aeae2f5 --module swap --function swap_a_2_b --args 0x687ac693b4d95cae8b67f79072b630da16a1ecb39f57ebe1f43fa46bf6f89eec 0xf0856c2b6fc16e72151ca05b118c4cc7a37a7a783008cd45ef2e17ebf69331a3 --type-args 0x29dc673186351105c22905403d596fd93177cfe0ac250cfbf1090eaefd1113f2::jerry_token::JERRY_TOKEN 0x29dc673186351105c22905403d596fd93177cfe0ac250cfbf1090eaefd1113f2::jerry_faucet_token::JERRY_FAUCET_TOKEN --gas-budget 5000000
```
hash: `GKdduUuwLPr518DwCajZcojokzbKbuB3MbsgwxpGL98X`

### swap b -> a
```bash
sui client call --package 0x7e71bb622e1683fdec8369624db34d6ee5c8e7d681a14c4e5e7923d77aeae2f5 --module swap --function swap_b_2_a --args 0x687ac693b4d95cae8b67f79072b630da16a1ecb39f57ebe1f43fa46bf6f89eec 0xf10c52b419a3eed818123b7c4bdb95f304e47fc3f4e288f61d6bebcb8d91597a --type-args 0x29dc673186351105c22905403d596fd93177cfe0ac250cfbf1090eaefd1113f2::jerry_token::JERRY_TOKEN 0x29dc673186351105c22905403d596fd93177cfe0ac250cfbf1090eaefd1113f2::jerry_faucet_token::JERRY_FAUCET_TOKEN --gas-budget 5000000
```
hash: `4DSKtTy2aFqprb1ZJd5FLj8X3XRsvtuquyVKmSeenetG`

