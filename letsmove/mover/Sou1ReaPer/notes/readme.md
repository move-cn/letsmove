## task3

- 给自己地址mint一个nft

```shell
sui client call --package <PACKAGE> --module <MODULE> --function <FUNCTION> --args <ARGS>...

sui client call --package 0x1f06eec0829cf5cffbb66a24312134830b626d65efc3a92055679351cf0c8546 --module my_nft --function mint --args 0xf9d00c84559e27d556641d2ba1c1cde7a93255a2499eaa3719d71c047d511e1b 0x0027e6bd003338672d2e4aa351227dd04ca5e22f3732719677d5cfbfa1f71eeb
```

- mint 一个 nft 发送到地址: `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

```shell
sui client call --package 0x1f06eec0829cf5cffbb66a24312134830b626d65efc3a92055679351cf0c8546 --module my_nft --function mint --args 0xf9d00c84559e27d556641d2ba1c1cde7a93255a2499eaa3719d71c047d511e1b 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```

