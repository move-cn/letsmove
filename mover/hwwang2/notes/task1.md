# Task 1 - hello move

## 发布项目
### 新建项目
```bash
sui move new task1
```

### 构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 --skip-fetch-latest-git-deps
```
得到packageid:0xf5d630a5dc3613de049328ee52b02fc2791e140a857c607edb8fd456bb72587d