# Task 1 - hello move

## 发布项目
### 新建项目
```bash
sui move new 01hello
```

### 构建、发布
```bash
sui move build
sui client publish --gas-budget=20000000 
```
得到packageid: