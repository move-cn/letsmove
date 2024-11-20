# Sui 项目 Makefile
# 项目路径设置
MOVE_PATH := .
BUILD_PATH := $(MOVE_PATH)/build
SUI_CLI := sui

# 默认网络为 devnet，可通过 `make <target> NETWORK=<network>` 来覆盖
NETWORK := $(or $(NETWORK), mainnet)
GAS_BUDGET := $(or $(GAS_BUDGET), 2000000)

# 默认目标
all: build

# 切换网络
switch:
	@echo "Switching to network: $(NETWORK)..."
	@if [ -z "$(NETWORK)" ]; then \
		echo "Error: No network specified. Please set NETWORK."; \
		exit 1; \
	fi
	$(SUI_CLI) client switch --env $(NETWORK)
	@echo "Switched to network: $(NETWORK)"
	export NETWORK=$(NETWORK)
# 编译 Move 代码
build:
	@echo "Building the Sui Move package..."
	@if [ -n "$(NETWORK)" ] && [ "$(NETWORK)" != "devnet" ]; then \
		echo "Switching to network: $(NETWORK)"; \
		$(SUI_CLI) client switch --env $(NETWORK); \
	elif [ "$(NETWORK)" = "devnet" ]; then \
		echo "Using the current network $(NETWORK)"; \
	fi
	$(SUI_CLI) move build --path $(MOVE_PATH)

# 运行测试
test:
	@echo "Running tests on Sui Move package..."
	@if [ -n "$(NETWORK)" ] && [ "$(NETWORK)" != "devnet" ]; then \
		echo "Switching to network: $(NETWORK)"; \
		$(SUI_CLI) client switch --env $(NETWORK); \
	elif [ "$(NETWORK)" = "devnet" ]; then \
		echo "Using the current network $(NETWORK)"; \
	fi
	$(SUI_CLI) move test --path $(MOVE_PATH)

# 发布合约到 Devnet
publish:
	@echo "Publishing the package to $(SUI_NETWORK)..."
	@if [ -n "$(NETWORK)" ] && [ "$(NETWORK)" != "devnet" ]; then \
		echo "Switching to network: $(NETWORK)"; \
		$(SUI_CLI) client switch --env $(NETWORK); \
	elif [ "$(NETWORK)" = "devnet" ]; then \
		echo "Using the current network $(NETWORK)"; \
	fi
	$(SUI_CLI) client publish --gas-budget $(GAS_BUDGET)

# 清理生成的文件
clean:
	@echo "Cleaning up the build directory..."
	rm -rf $(BUILD_PATH)

# 此命令仅适用于使用 brew 下载 sui 的用户
update:
	@echo "Updating brew and sui"
	brew update
	brew upgrade sui

# 查看合约状态
# 这里我只添加了三个命令，可以根据自己的需要增减
status:
	@echo "Checking the status of the Sui project..."
	$(SUI_CLI) client active-env
	$(SUI_CLI) client active-address
	$(SUI_CLI) client balance

# 帮助信息
help:
	@echo "使用 Makefile 中的以下命令进行常见操作："
	@echo "  make build     - 编译 Move 包"
	@echo "  make test      - 测试 Move 包"
	@echo "  make publish   - 发布合约到网络"
	@echo "  make clean     - 清理生成的文件"
	@echo "  make status    - 查看合约状态"

.PHONY: all build test publish clean status help
