set XU8117FAUCETCOINTreasuryCapObjectID= 0x9047adddb25d459e14bb44a3999caec165c9c5e1b17c8dc96c07be02280650bb
set XU8117FAUCETCOIN = 0xb67c5b74a579dc7e4c2be25498c7b1a6f857ca945e624008dac5c8e2d265cacf
set packageId=0xf52a901aa045ca80117cd2d02f2d45fa78c1af15a2d72d785931d00cb227dfe4
set module=bulls_and_cows
set func=deposit
set game=0xabb37f178336bb8a1b89616d5147fbbc5fb2486b22778132fb4bdd0bad91dfb0
set depositCoin=0x38f43e5bdca53ebdb6d37450dd9749324b7e1ec707a631c17e214a490847d514
set amount=99999999
sui client call --gas-budget 20000000 --package %packageId% --module %module% --function %func% --args %game% %depositCoin% %amount%
