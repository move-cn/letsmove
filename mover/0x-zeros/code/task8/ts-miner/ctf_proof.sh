package_id="0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f"
challenge_object_id="0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9"

proof=0xd4dd5b0000000000
github_id="0x-zeros"

# sui client object $challenge_object_id --json

# 找到有效证明，nonce: 6020564
# 证明 proof: d4dd5b0000000000
# proof:  Uint8Array(8) [
#   212, 221, 91, 0,
#     0,   0,  0, 0
# ]

sui client call --package $package_id \
  --module lets_move \
  --function get_flag \
  --args $proof $github_id $challenge_object_id 0x8