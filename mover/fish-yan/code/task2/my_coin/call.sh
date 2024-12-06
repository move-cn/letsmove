mint

sui client call --gas-budget 100000000 \
--package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args '0x6fa57ad50885f857f7f6e8380a435f40b0aaace628200a03e54714aa243eec76::fishcoin::FISHCOIN' \
--args 0x9d63302aa6ab22fdf123dbaf240117a23471a877e95ed3662a3cd291078635c5 1000000000000 0xc20186205fdb38b890dd6167a784341fd22dd0bf6cc3bfa11dfc75a5338bafcd