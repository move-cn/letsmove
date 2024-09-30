# 转账 `My Coin` 

sui client call \
--package 0xabca394c7bf15eef038fc92b334b9c441b6abc8f9bd391c8f6d7a4e470b13275  \
--module xiaodi_coin \
--function mint \
--args 0x9c01f80e2bace4218c09bd97afb2dcafee314e80dd3e834a6430ea55294e6769 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \



# Faucet Coin address1
sui client switch --address affectionate-opal

sui client call \
--package 0xa6446b4c285361f70b381d4793df1096bc0f9cdea076733ebe8c07f0d17541a7  \
--module xiaodi007_faucet_coin \
--function mint \
--args 0xbf9794c979280f281afe2193d62b73aaecaf89d6bd87616eb2f8a1a3802f9cd3 666000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \



# Faucet Coin address2
sui client switch --address agitated-emerald 

sui client call \
--package 0xa6446b4c285361f70b381d4793df1096bc0f9cdea076733ebe8c07f0d17541a7  \
--module xiaodi007_faucet_coin \
--function mint \
--args 0xbf9794c979280f281afe2193d62b73aaecaf89d6bd87616eb2f8a1a3802f9cd3 666000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \
