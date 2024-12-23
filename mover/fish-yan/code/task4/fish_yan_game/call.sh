sui client call --gas-budget 100000000 \
--package "0xd184632ebf05fa28b23e46ae5d6306c70a7badbe4a01a45896608e197ac8fe52" \
--module fish_yan_game \
--function deposit \
--args 0xa43c3d1da6bdd20693473a83fa27f0dedf05659fe6257e46db76768875022b82 0xf64d0abdf490e13b80f325d2576a29ac2c067cb6791f8b9ecc89f2a6c7e4792b


sui client call --gas-budget 100000000 \
--package "0xd184632ebf05fa28b23e46ae5d6306c70a7badbe4a01a45896608e197ac8fe52" \
--module fish_yan_game \
--function withdraw \
--args 0xa43c3d1da6bdd20693473a83fa27f0dedf05659fe6257e46db76768875022b82 1000000000 0xc20186205fdb38b890dd6167a784341fd22dd0bf6cc3bfa11dfc75a5338bafcd


sui client call --gas-budget 100000000 \
--package "0xd184632ebf05fa28b23e46ae5d6306c70a7badbe4a01a45896608e197ac8fe52" \
--module fish_yan_game \
--function play \
--args 0xa43c3d1da6bdd20693473a83fa27f0dedf05659fe6257e46db76768875022b82 0xeb231e752651388dad54e8078e81c66cb0818e66ecd8adb5dd110fdd9cf13144 0x8