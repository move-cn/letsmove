sui client publish --gas-budget 20000000

export PACKAGE_ID=0x07c0385eaae044c75adffed8e3559385ac6776a0facfafcbf878fc0db1d0d0b1     
export MY_ADDR=0x2d92259fd0c9c8934a5a9bd6d975d8d63efbf110ac9d01a001098aa55525bfa9

sui client call --package $PACKAGE_ID --module halsey929nft --function mint_to --args "halsey-929" $MY_ADDR --gas-budget 20000000

Transaction Digest: Aq6zWkoWdoffRfCCP8VNxKrbMhNe4LDq8YoPGdRpRBvc
ObjectID: 0x8ad884c58e6fc68b56abf0b60b03162a0a784dff16e5e09237a55a87e3dd6b12     

export TARGET_ADDR=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --package $PACKAGE_ID --module halsey929nft --function mint_to --args "halsey-929 sent" $TARGET_ADDR --gas-budget 20000000

Transaction Digest: bVDfvtnFQWLVmmDoc6T1iNcbRA6fDHGjgxhc6DD9AH2

ObjectID: 0xdd14ab5038886f1932cc7024418ba1261687741ec7a68166fa11b532e49e86f2                 
