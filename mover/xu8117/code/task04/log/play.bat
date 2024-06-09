set packageId=0x783d1359df100f6b549861863b5d3ae8f0ef950348a11911ac4dd75113913c71
set module=bulls_and_cows
set func=play
set game=0xdb9100eab0e3929541212a992aa8c8a240feaadf0aa49a484b8e761a46c71479
set depositCoin=0x2167e2f7c3765bbbc1a7ce30c31670bbe6b57af4142c0a7317cfa24a3ad420d5
set guessNumber=1
sui client call --gas-budget 20000000 --package %packageId% --module %module% --function %func% --args %game% %guessNumber% %depositCoin% 0x6

