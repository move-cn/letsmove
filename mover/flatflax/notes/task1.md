# task1 学习笔记
### sui-cli
* 新建钱包
```shell
sui client addressed
```

* 增加env
```shell
sui client new-env --alias <alias> --rpc <RPC_URL>
```

* 切换env和钱包
```shell
sui client switch --env <alias>
sui client switch --address <address>
```

* error: RPC failed; curl 92 HTTP/2 stream 0 was not closed cleanly: PROTOCOL_ERROR (err 1)
参考链接: https://stackoverflow.com/questions/59282476/error-rpc-failed-curl-92-http-2-stream-0-was-not-closed-cleanly-protocol-erro
```
git config --global http.version HTTP/1.1
git push 
git config --global --unset http.version
```

* publish

```
sui client publish --gas-budget <GAS_BUDGET> --skip-dependency-verification
```