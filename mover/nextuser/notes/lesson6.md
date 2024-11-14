## npm mirror

dapp下载创建,需要设置国内mirror,访问速度更快

```bash
npm set registry https://mirrors.huaweicloud.com/repository/npm
npm create @mysten/dapp
```

   # 进入创建的目录,安装以来的包

```bash
cd acounter
npm install
```

### 发布包
sui client publish 
### 确定当前环境

```bash
sui client active-address
sui client active-env
```

### 创建counter对象
```bash
export PKG=0x9f60ac2a1f47aa738939953e9f30b9e21ff94f6b30f2cf0648658d1f84c7b0a0
sui client call --package $PKG --module counter  --function create
```

### 调用increment(counter)

```bash
export COUNTER=0xc89f34c40908cb4412d730d2e16994b380ccf56944c6eca4080010e5ae48cae3
sui client call --package $PKG --module counter --function increment --args $COUNTER
sui client object $COUNTER
```