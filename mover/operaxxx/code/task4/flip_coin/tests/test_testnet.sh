# add tokens
sui client call --package 0x7e7632ecbc5998ff806c9a85d565e54fb9e5e73211d4cfe1726177ddfdc349b4 \
    --module flip_coin \
    --function addTokens \
    --args 0xb9f560298286e5b678cae5516d7b823891366ae3b753ad11bd3e5004496dc59c 0xbad4ba605b648df2b1ce4c07f821dc3f659c3df393b71f552bfb3546e0fac45a

# flip coin
sui client call --package 0x7e7632ecbc5998ff806c9a85d565e54fb9e5e73211d4cfe1726177ddfdc349b4 \
    --module flip_coin \
    --function play \
    --args 0xb9f560298286e5b678cae5516d7b823891366ae3b753ad11bd3e5004496dc59c \
    0x8 \
    true \
    0x456bfcc36042b1a0f0a68db1a494d3fde5e5ac2bdaa8bbd763e2cd1a354abba5

# withdraw
sui client call --package 0x7e7632ecbc5998ff806c9a85d565e54fb9e5e73211d4cfe1726177ddfdc349b4 \
    --module flip_coin \
    --function withdraw \
    --args 0x9de55fdb7f27a4581a4909d8a9fa65154e5b4db3075b19db93a7067cc891fc91 \
    0xb9f560298286e5b678cae5516d7b823891366ae3b753ad11bd3e5004496dc59c \
    100000000