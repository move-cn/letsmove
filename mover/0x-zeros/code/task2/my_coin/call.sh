sui client call --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args 0x7952b17ed79ad43f3f2e23176ed60a0a3e3ccb78ff8324e231a887a45b048b97::zeros::ZEROS \
   --args   0x994f3319b57f5d52c8ebeb81be234d17ac41536f90a5a00894ff0243c4b8f959 100000000 0x6e6c6885e780bbfd7c81b6b3849b45881305e3ecd08340a32fef3b5f3a619be7

sui client call --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args 0x7952b17ed79ad43f3f2e23176ed60a0a3e3ccb78ff8324e231a887a45b048b97::zeros::ZEROS \
   --args   0x994f3319b57f5d52c8ebeb81be234d17ac41536f90a5a00894ff0243c4b8f959 100000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

# faucet
sui client call --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args 0x7952b17ed79ad43f3f2e23176ed60a0a3e3ccb78ff8324e231a887a45b048b97::zeros_faucet::ZEROS_FAUCET \
   --args   0x69574780199b9abe16c61a05e0a2ce777909ef21ff04cf76acca8efbefbeb46f 100000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --type-args 0x7952b17ed79ad43f3f2e23176ed60a0a3e3ccb78ff8324e231a887a45b048b97::zeros_faucet::ZEROS_FAUCET \
   --args   0x69574780199b9abe16c61a05e0a2ce777909ef21ff04cf76acca8efbefbeb46f 100000000 0x6e6c6885e780bbfd7c81b6b3849b45881305e3ecd08340a32fef3b5f3a619be7
