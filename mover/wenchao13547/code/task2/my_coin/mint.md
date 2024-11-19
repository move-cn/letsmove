sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0x1a166af63986b1ad7285db1ed15f3b48a76b8d78e54d396448e294951ea14511::uu::UU \
--args 0x2c45b3f297a90093cc43b3c7b4a94fc487689bd4c9734150ff3cbaddd9485101 1000 0x5a395f1c44ad1c2bc0b6629e8ca65f7c176b122d56f082a74313d40076851c29 \

sui client ptb \
--move-call <PACKAGE_ID>::<MODULE_NAME>::mint_and_transfer \
<ADMIN_CAP_OBJECT_ID> <RECIPIENT_ADDRESS> \
--gas-budget <GAS_BUDGET>