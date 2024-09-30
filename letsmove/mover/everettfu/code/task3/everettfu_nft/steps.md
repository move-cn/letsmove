# build
sui move build

# push
sui client publish 

package id:
0xe42cfc3fce991f4428174116ea1c048821492da54fd65eb8509ba64865b97e78

# mint nft
sui client call  \
--package  0xe42cfc3fce991f4428174116ea1c048821492da54fd65eb8509ba64865b97e78 \
--module everettfu_nft \
--function mint_to_sender \
--args 'everettfu_nft' 'first nft of everettfu' 'https://avatars.githubusercontent.com/u/10185735'

# transfer nft
sui client call  \
--package  0xe42cfc3fce991f4428174116ea1c048821492da54fd65eb8509ba64865b97e78 \
--module everettfu_nft \
--function transfer \
--args 0xc77381db52de0016a8039fbb944eba4d3d071675d21b5f19c8d2107cc472742f 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2