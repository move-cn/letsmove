set packageId=0x91d95713041aceac676e87185d95b8c38b00084e3c3bdf618bf39e32fe7ae9b2
set module=swap
set func=swap_xu8117faucetcoin_to_xu8117coin
set coin=0xb175bf66878a78b7bfe813eac92dfdcfc53c0f7ce62cf9a85d4493521e073b1d
set adminCap=0xf33ba6214a1c20a41585be70abb6325982c501aee3a3280dec27d6008f131218
set bank=0x0f1bb7c1d614bd71eefc994edaa03f90c84ab52aad4b28c5f2e8ac156326b57b
set amount=1000000000
sui client call  --package %packageId% --module %module% --function %func% --args %bank% %coin%
