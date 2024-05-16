set packageId=0xf52a901aa045ca80117cd2d02f2d45fa78c1af15a2d72d785931d00cb227dfe4
set module=bulls_and_cows
set func=withdraw
set adminCap=0x0489e4fec63296fc15539e1f0e026c19a8e244b650ca4527c3c969d16899043a
set game=0xabb37f178336bb8a1b89616d5147fbbc5fb2486b22778132fb4bdd0bad91dfb0
set amount=100000000
sui client call --gas-budget 20000000 --package %packageId% --module %module% --function %func% --args %adminCap% %game% %amount%
