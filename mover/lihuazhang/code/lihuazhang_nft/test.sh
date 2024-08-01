export PACKAGE_ID=0x8b1402e5a28a69d280959b05db83eaf110d5dc5b08e65050aa6e025b7403b5c2
export ISSUE_CAP=0xa75203db211e2f2b0828ad0caa6c7b65689892068c8e1898292c867c766d87ce
export NAME="恒温"
export IMAGE_URL="https://avatars.githubusercontent.com/u/872749"
export GITHUB_ID=lihuazhang
export ADDRESS=0x2c3b24eee650f51ae02d36ffacbc16e4c4bde83dd11b747762239c4b7456178d

# create
sui client call --package $PACKAGE_ID --module lihuazhang_nft --function mint --args $ISSUE_CAP $NAME $GITHUB_ID $IMAGE_URL $ADDRESS

export DNFT=0xc056df3ab4cd829643de46966a166a97dc78a89f181f4b78b4f5936e4497e4be
# destroy
sui client call --package $PACKAGE_ID --module lihuazhang_nft --function burn --args $ISSUE_CAP $DNFT
