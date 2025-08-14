# task2-注意

windows 使用call命令时，可以将`\`删去，只在前几条语句的最后留下 空格 即可

### **注意1**：

创造代币采用了one-time-witness 见证者模式，因此需要满足它的要求，否则会报错，要求如下：

名称必须与包的名字完全相同，并且全部大写；没有字段，只有drop（销毁）能力；通过`fun init (witness: Struct, ctx: &mut TxContext) {}` 传入

### 注意2：

对于call函数中地址的区分：

sui client call --gas-budget 100000000 

--package 0x2 

--module coin 

--function mint_and_transfer 

--type-args '<TreasuryCap>' 

--args Object id mint_coin_number  coin的接受地址