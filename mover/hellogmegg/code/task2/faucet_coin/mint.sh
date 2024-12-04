
sui client switch --address 0x25da60a72fd67e693958534887564c488fc71aae3b75f3d06e9fd02a37c952f1

sui client call --gas-budget 100000000 \
--package 0x0cd90c8de37218c15b9e7b908057eab00c19a1910147cb4f59046db8fe5410b7 \
--module tmm_faucet --function mint \
--args 0xf541ec3bfa5eb4c4cb5f259ec2dbe98cc65add5f0f82a6bd6775ceb777242673 \
1000000 0x25da60a72fd67e693958534887564c488fc71aae3b75f3d06e9fd02a37c952f1

sui client switch --address 0x5bbb5974d927beab0b5888fdab62e1b8b49e1874548dcde5f34c2ab824bde52a

sui client call --gas-budget 100000000 \
--package 0x0cd90c8de37218c15b9e7b908057eab00c19a1910147cb4f59046db8fe5410b7 \
--module tmm_faucet --function mint \
--args 0xf541ec3bfa5eb4c4cb5f259ec2dbe98cc65add5f0f82a6bd6775ceb777242673 \
1000000 0x5bbb5974d927beab0b5888fdab62e1b8b49e1874548dcde5f34c2ab824bde52a

