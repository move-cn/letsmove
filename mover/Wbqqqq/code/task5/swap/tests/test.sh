PackageID=0x6a08caf25d583e00384519090f441a9c922ac235d7d5899894b07a92f13b5d77
Bank=0x911dbd3183c0782bef574521e5388f5fa0427feedc8f16a628a20e0270886d87
rmbInput=0x4107b4b850664ca79110be43c0ef3fad375eb5a6d1011235368443bc093e7aca
usdInput=0xf8c66af02f652c0b24eb7b47f8888b0bdb6f15c568ab7a3a823782e065a62455
usdLite=0x1e95e6feb742d7f5c0501088c135943ee5c42e83b6c0ab1fee8b3a3d482d19dd
rmbLite=0xf642043487905ce43cd4db781c57bc887ed05a5f9ed11e3a8807c52db85332e7

#sui client call --package $PackageID \
#                --module swap \
#                --function deposit_RMB \
#                --args $Bank $rmbInput \
#sui client call --package $PackageID \
#                --module swap \
#                --function deposit_USD \
#                --args $Bank $usdInput \
#                --gas-budget 50000000
#sui client call --package $PackageID \
#                --module swap \
#                --function swap_usd2rmb \
#                --args $Bank $usdLite \
#                --gas-budget 5000000
sui client call --package $PackageID \
                --module swap \
                --function swap_rmb2usd \
                --args $Bank $rmbLite \
                --gas-budget 5000000

