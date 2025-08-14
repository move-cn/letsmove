mint

sui client call --gas-budget 100000000 \
--package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args '0x46a5b42763675e5032e2e89bcb8ed0944d1e7b2e39138e784813178ec1a18e51::fish_yan_faucet::FISH_YAN_FAUCET' \
--args 0x14561f41a4ccdc3e5990329ff20361a1c94c9384986544a55f293236409f289a 1000000000 0xc20186205fdb38b890dd6167a784341fd22dd0bf6cc3bfa11dfc75a5338bafcd