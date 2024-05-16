set packageId=0x783d1359df100f6b549861863b5d3ae8f0ef950348a11911ac4dd75113913c71
set module=bulls_and_cows
set func=withdraw
set game=0xdb9100eab0e3929541212a992aa8c8a240feaadf0aa49a484b8e761a46c71479
set adminCap=0xc9404c3eb53f6979b30afa38df92d07c69d42bd84bfa44bb14fc0c1f9a290ae6
set amount=100000000
sui client call --gas-budget 20000000 --package %packageId% --module %module% --function %func% --args %adminCap% %game% %amount%
