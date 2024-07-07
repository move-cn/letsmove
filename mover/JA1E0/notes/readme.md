gas = tokens 等于钱，打包上传packge 做运算都要实用
gas_budget 是预算，如果消费大于预算吗，则会失败。默认10000000
1. 打包上传package，得到packageId `sui client publish --gas-budget 20000000` 2. call `sui client call --function mint --module hello_world --package $PACKAGE_ID --gas-budget 10000000` 3.查看objectId，