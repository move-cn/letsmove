# push
sui client publish


# mint

 sui client call  \
 --package  0x2 \
 --module coin \
 --function mint_and_transfer \
 --type-args '0xb39046148a3761bd9ec0a707aee1118f1b357e58ccb5f5075f84507686b43cde::tangyuan2323coin::TANGYUAN2323COIN' \
 --args 0x0153bc653df828f3b9585a97dc94697d68e24ab77ddff5a92d5c0fcf1c322d9e 100000000000 0x1909fedb6ccc24ae653aefd63ef20e966595e9cceac7b752116e97f3ac75096f


  sui client call  \
  --package  0xfafd4f14efbb54da70e98c9f5469d3a82daede178dbb640ece5461b9a559c2cf \
  --module tangyuan2323nft \
  --function mint_to \
  --args 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2