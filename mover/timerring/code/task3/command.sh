# build 
sui move build

# publish contract
sui client publish

# mint
# public entry fun mint_to_sender(
#     name: vector<u8>,
#     description: vector<u8>,
#     url: vector<u8>,
#     ctx: &mut TxContext
# ) {

sui client call \
    --package 0x4c0318da604599c8b8c3ecfce0cc184f2b67f0f4665b5d4dc0d93f2751d6e2bc \
    --module sui_nft \
    --function mint_to_sender \
    --args 'sui_nft' 'the nft on the sui chain' 'https://miro.medium.com/v2/resize:fit:720/format:webp/0*ciQmhpTqq5oHnkAR'

# transfer
# public entry fun transfer(
#     nft: SuiNFT, recipient: address, _: &mut TxContext
# ) {
#     transfer::public_transfer(nft, recipient)
# }
sui client call \
    --package 0x4c0318da604599c8b8c3ecfce0cc184f2b67f0f4665b5d4dc0d93f2751d6e2bc \
    --module sui_nft \
    --function transfer \
    --args 0x143c3e0638dd55f17ea464baf5abf6ed1077ef1c7a8b9ce34b53cfbda4c18652 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2