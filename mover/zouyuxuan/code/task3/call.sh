export PACKAGE=0xd4d8535fbd6bb212ce60d2f4674e5b3fb078a92328441b835d7c4707eaacb03a
export NFT_NAME="\"zyx\""
export DESCRIPTION="\"simple nft, power by zyx\""
export ADDRESS=0xd4c2b315c859535fd1596f145ef5a4c6659469d3d4334def47b3aadba3f02b52
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module mynft --function mint --args $NFT_NAME $DESCRIPTION $ADDRESS

sui client call --package $PACKAGE --module mynft --function mint --args zyx  simple_nft  0xd4c2b315c859535fd1596f145ef5a4c6659469d3d4334def47b3aadba3f02b52 --gas-budget 7500000

sui client call --package $PACKAGE --module mynft --function mint --args zyx  simple_nft  0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 7500000
