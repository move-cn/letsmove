# create a new nft object
sui client call \
--package 0x53829e8f97dd3ee7c9954c1743d6c386ecc86a8e5cd76ed590e8c8bea83c56a6  \
--module xiaodi007_nft \
--function mint_to_sender \
--args xiaodi007 \


# send a nft object to other
sui client call \
--package 0x53829e8f97dd3ee7c9954c1743d6c386ecc86a8e5cd76ed590e8c8bea83c56a6  \
--module xiaodi007_nft \
--function transfer \
--args 0xafc126feb46917afa9c315be3eeea66b2f8adb98b47e4f42b43e7c784d24b6f3 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \




sui client call \
--function get_flag \
--module lets_move \
--package 0xd5c6f9f40969f7af6f97c17d86ade578899f81b519f13e01dd551b12c3d99abf \
--args 1234123ini 0xac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff 0x8 \



sui client call \
--function get_flag \
--module ctf \
--package 0x86b7defbe1a25c4c885589960d8d27e0117d7acc3948717bb6ad0c1eae0b72a1 \
--args 1234123ini 0xac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff 0x8 \
