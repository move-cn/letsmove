

PackageID=0x32dc2903a9f210df96d819e57f7b1a57793ad35276fc07b11be1028075482728
Game=0xc29667697fbee503ca3e06ca48f41927042a3728ca52faef8b734aa8b4a9efd6
input1=0x02093f99f58dc1417789811bbfd7dc72aada1f5948c737ab5c90bb6be5efc8c8
rand=0x0000000000000000000000000000000000000000000000000000000000000008
input2=0x49587691e3b54835c741a014347a51ba0b0dd2ad6c2d84d183f232c49aa41fd2
adminCap=0xf03d57cba17fea72ce3f23ba7dc3c69e932744ea92ba846d8c464dc6d6c13f89
# Deposit
#sui client call --package $PackageID\
#                --module flip_coin \
#                --function public_deposit \
#                --args $Game $input1


## play
#sui client call --package $PackageID\
#                --module flip_coin \
#                --function play \
#                --args $Game true $input2 $rand


sui client call --package $PackageID \
                --module flip_coin \
                --function public_withdraw \
                --args $adminCap $Game 600000000 \
                --gas-budget 10000000