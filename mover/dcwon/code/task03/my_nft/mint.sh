# testnet package id: 0x11476f0e1b77afdfa690a845d63b6ab5fc3babf2bbfc0f011cb21eaf5b3850b8
# mainnet package id: 0x8fe0b96d8351175fc6bafc05f73e0bd2ff00f516ad025fdfc704a0c5b978887f

sui client call  \
--package 0x8fe0b96d8351175fc6bafc05f73e0bd2ff00f516ad025fdfc704a0c5b978887f \
--module my_nft \
--function mint_to_sender \
--args "DcwonNFT" "This is dcwon's first NFT in sui mainnet" "https://avatars.githubusercontent.com/u/44092606?s=400&v=4"