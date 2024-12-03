# devnet 
export  PKG=0x5004eab7e42fd66ad3b7475632ae3070e9a4015f8f8976009e7e8637592e9d76
export JP_CAP=0xdd789eee513521bcf04ad857aaa549e97017261bb7054fbf865a208a31c17d4b


# SET THE ADDRESS  to receive
export W_ADDR=0x7cbe5e6596e23266dd5763dd89b4ab1195516908ecde8febfe96685c7cbe6432
# the current client active-address
export C_ADDR=0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38

# faucet    , mint_and_transfer
sui client switch --address $C_ADDR
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args $PKG::jp::JP  --args $JP_CAP   8800000   $C_ADDR
sui client balance   $C_ADDR


#0xeff9d4ac9f5c3d97be2f0be1aaab797d76ce148263471ad7bf4604f5811afdf::jp::JP
# testnet
│  ┌──                                                                                                               │
│  │ ObjectID: 0x1dc620b3918d04ca2799a5fb25d1f3e8ff4ba626a78d3a3d722c32b6c68922c7                                    │
│  │ Sender: 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38                                      │
│  │ Owner: Account Address ( 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38 )                   │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xeff9d4ac9f5c3d97be2f0be1aaab797d76ce148263471ad7bf4604f5811afdf::jp::JP>   │
│  │ Version: 236167315                                                                                              │
│  │ Digest: 5vqw8LRLJzL492rPozqwMh5W6fZFLtqTc8fD54sLvg1T                                                            │
│  └── 


    public fun get_supply<T>(cap : &TreasuryCap<T>):u64{
        let s =sui::coin::supply_immut(cap);
        sui::balance::supply_value(s)
    }

# testnet 
export  PKG=0xeff9d4ac9f5c3d97be2f0be1aaab797d76ce148263471ad7bf4604f5811afdf
export JP_CAP=0x1dc620b3918d04ca2799a5fb25d1f3e8ff4ba626a78d3a3d722c32b6c68922c7
sui client ptb --move-call 0x2::coin::supply_immut  "<$PKG::jp::JP>" @$JP_CAP \
--assign sid \
--move-call 0x2::balance::supply_value "<$PKG::jp::JP>"  sid

#devnet 
│  ┌──                                                                                                                │
│  │ ObjectID: 0x99906636f780bb8798f39c3c78b5c73248793aa9d789c8307f62de1e7866c2dd                                     │
│  │ Sender: 0xf7ec2215e565b7a18d7b00e70fccda74b30c3ecceffb5857b1b3d2249e28e94f                                       │
│  │ Owner: Account Address ( 0xf7ec2215e565b7a18d7b00e70fccda74b30c3ecceffb5857b1b3d2249e28e94f )                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x3afd47bd360bcb8d4046cffbe80ff0b87bd05bad6237f60d738a0a2f51e993c5::jp::JP> 

export  PKG=0xf7ec2215e565b7a18d7b00e70fccda74b30c3ecceffb5857b1b3d2249e28e94f
export JP_CAP=0x99906636f780bb8798f39c3c78b5c73248793aa9d789c8307f62de1e7866c2dd