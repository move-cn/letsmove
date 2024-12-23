mint

sui client call --gas-budget 100000000 \
--package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args '0x8b356127915437d3a1f2b80e3209775e79aeb08d4a0c5bcfba36187913912726::fish_yan_coin::FISH_YAN_COIN' \
--args 0x1af6bc51973213fc2263506f85ed6771f9a1c09801769e090211508dcdd175e9 1000000000 0xc20186205fdb38b890dd6167a784341fd22dd0bf6cc3bfa11dfc75a5338bafcd