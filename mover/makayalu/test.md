sui client call --package 0x2     --module transfer     --function public_transfer     --type-args \

0x9b7ed7b716888322943f0dd9bb8ae1142e748acae0bc735d7b15de5bb4ea9db9::my_coin::MY_COIN    \

 --args  0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \ 0x132a04e06955a29468ce122156e76aa8574128f77bdb269c4ccf6a593fab3b90         

我造了个币，把币转给一个地址的之后下面的报错，是怎么回事哦

Error executing transaction 'bGq8GkLsuyTNSSS79xhmz5EJgBJuR7sLXKvifZ8fSgf': VMVerificationOrDeserializationError in command 0





sui client call \
    --package 0x2 \
    --module transfer \
    --function public_transfer \
    --type-args "0x9b7ed7b716888322943f0dd9bb8ae1142e748acae0bc735d7b15de5bb4ea9db9::my_coin::MY_COIN" \
    --args "0x132a04e06955a29468ce122156e76aa8574128f77bdb269c4ccf6a593fab3b90" "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" \
    --gas-budget 2000000









sui client call \
    --package 0x1c3941a80d4ee5000dbcc24f670ec5b61de4aaf2add96bdb637a0d0ac447d76c \
    --module rmb \
    --function mint \
    --args 0xebc046b19b26bec98a9292f07fe0f9780300bececcbac0aaac35a957d773a278 1000000000 0xe82074898581a0f9161db66e2ae72aaa8703890caf790f75ca7c5f239e88be2a \
    --gas-budget 2000000