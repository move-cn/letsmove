sui client call --package 0xc5cc9b96df59a5dc3a2cf48fddf69bfa6962ef5d36a1487b5c9bda6afe6ec2ba \
--module task8 \
--function getString \
--type-args 0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f::lets_move::Challenge \
--args 0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9 "[]" 

sui client call --package 0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f \
--module lets_move \
--function get_flag \
--args "[90, 73, 169]" tyasrioChao 0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9 0x8