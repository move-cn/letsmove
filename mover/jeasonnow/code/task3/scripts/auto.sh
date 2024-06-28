export PACKAGE_ID=0x2649e70f291ddbb153b16de8599a19dc3830d2e02612a8428d7e92f69f3145a5;
export STATE_ID=0x71e803d4985a81340aef2c7f53939d7ea7d24c5929e8856e8d76eb0046d9db76;
export IMAGE=0x68747470733a2f2f617661746172732e67697468756275736572636f6e74656e742e636f6d2f752f31363935303230373f763d34;

#mint nft
# sui client call  --package $PACKAGE_ID\
#                 --module jeasonnow_nft --function mint  \
#                 --args Jeasonnow_Nft Jeasonnow_Nft_Description $IMAGE $STATE_ID \

export NFT_ID=0xd8550aacb224df6737738cfa9cd8de4f63ac3b3f8c4c8a91bda96ed61b007021;
export RECIEVER=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

#transfer nft
sui client call  --package $PACKAGE_ID\
                --module jeasonnow_nft --function transfer  \
                --args $NFT_ID $COIN_A_OBJECT $RECIEVER

