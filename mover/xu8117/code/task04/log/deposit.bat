set packageId=0x783d1359df100f6b549861863b5d3ae8f0ef950348a11911ac4dd75113913c71
set module=bulls_and_cows
set func=deposit
set game=0xdb9100eab0e3929541212a992aa8c8a240feaadf0aa49a484b8e761a46c71479
set depositCoin=0xb1bd51fb8fc830130211bdd179e6b755550e0f8430474685cefe267e4d25ff2f
set amount=1000000000
sui client call --gas-budget 20000000 --package %packageId% --module %module% --function %func% --args %game% %depositCoin% %amount%
