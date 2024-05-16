set packageId=0xf52a901aa045ca80117cd2d02f2d45fa78c1af15a2d72d785931d00cb227dfe4
set module=bulls_and_cows
set func=play
set game=0xabb37f178336bb8a1b89616d5147fbbc5fb2486b22778132fb4bdd0bad91dfb0
set depositCoin=0x787b8c9371fa9e438742c11e98f7b861bc2ba5a7447ef23477b1db0e8d1d8308
set guessNumber=1
sui client call --gas-budget 20000000 --package %packageId% --module %module% --function %func% --args %game% %guessNumber% %depositCoin% 0x6

