set packageId=0x91d95713041aceac676e87185d95b8c38b00084e3c3bdf618bf39e32fe7ae9b2
set module=swap
set func=deposit_xu8117faucetcoin
set coin=0xb912b450247eb8b862c81c3fded1e72de3aacf51356a23e633be5d134804e1bd
set adminCap=0xf33ba6214a1c20a41585be70abb6325982c501aee3a3280dec27d6008f131218
set bank=0x0f1bb7c1d614bd71eefc994edaa03f90c84ab52aad4b28c5f2e8ac156326b57b
set amount=1000000000
sui client call  --package %packageId% --module %module% --function %func% --args %bank% %coin%
