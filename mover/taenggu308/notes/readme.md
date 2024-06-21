task7:

task7需要拿到hash，发了个简单的package来获得flag hash

export PACKAGE_ID=0x2a28cee8f33914774401a8dd38f8d8ce38f0bcc96fe601657908112801704510   

sui client object 0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147

调用函数：
sui client call --function get_flag --module check_hash --package $PACKAGE_ID --args taenggu308 "j8(V3=L&8I~v>%^u-'KU"

根据交易hash找到输出flag hash的vector串：
digest1: k11Dwfyb1DqUc81iuqvFn60PTHY9oE1Sx/SRpu/Z4h4=

调用公共包的公共函数：
sui client call --function get_flag --module check_in --package 0x914099b4d1b4f5513acc8aaa4fdc1f67578522b81d818f61bae527d590c6d87d --args [147,93,67,193,252,155,212,58,148,115,205,98,186,171,197,159,173,15,76,118,61,160,77,82,199,244,145,166,239,217,226,30] taenggu308 0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147  0x8

digest: EEzRzfVwxhzs1P7w8iHFXWsr4wMaZSuDQd8QvMxN8hHW
