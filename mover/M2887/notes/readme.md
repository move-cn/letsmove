##### task4 bash
```bash
sui client call --package 0x7e1792a1a41a30206da3198784b9285dfa1e66bf227d834eb5d2ac9495554a64 --module flip_coin --function play --args 0x62118895a58dbb94b3e27acb3b5d64e11bf95ba5a2f6edcc8df718a2cc3e60de true 0x05e1ef276631b526d3fd3429e8e900aa3bf758656557452167bf683e5175492b 0x8 --gas-budget 1000000

sui client call --package 0x7e1792a1a41a30206da3198784b9285dfa1e66bf227d834eb5d2ac9495554a64 --module flip_coin --function remove_sui --args 0x5a800a73fc12ab69963c4c2f8175ac99e89576c95c64b969ef8de56c1bc5674d 0x62118895a58dbb94b3e27acb3b5d64e11bf95ba5a2f6edcc8df718a2cc3e60de 100 --gas-budget 10000000
```