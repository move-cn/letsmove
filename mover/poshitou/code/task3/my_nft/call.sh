# publish
sui client publish --skip-fetch-latest-git-deps

# mint and transfer to myself
sui client call `
--package  0xca848e93c091f6439839ea3ca4ec2498b8dc82112be2c732368eddbce597c7d4 `
--module my_nft `
--function mint_to `
--args "Github Image NFT" 0xd842b07687548bef8605dab499624f8aacd2c6108b7909db433a6394b435f57c

# mint and transfer to 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
sui client call `
--package  0xca848e93c091f6439839ea3ca4ec2498b8dc82112be2c732368eddbce597c7d4 `
--module my_nft `
--function mint_to `
--args "Github Image NFT" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

