// 定义模块，使用 task2 命名空间和模块名 unlizhao_coin
module task2::unlizhao_coin {
    // 导入 Sui 区块链的币种相关模块
    use sui::coin;
    // 导入币种的财政管理能力类型
    use sui::coin::{TreasuryCap};
    // 导入对象转移和冻结相关函数
    use sui::transfer::{public_transfer, public_freeze_object};
    // 导入交易上下文
    use sui::tx_context::{Self, TxContext};
    // 导入标准选项模块
    use std::option;

    // 定义一个特殊的见证类型（Witness Type），用于创建和管理自定义币种
    // has drop 表示这个类型可以被自动丢弃
    public struct UNLIZHAO_COIN has drop {}

    // 初始化函数，在部署合约时自动调用
    // 参数：
    // - witness: 币种的见证类型
    // - ctx: 交易上下文
    fun init(witness: UNLIZHAO_COIN, ctx: &mut TxContext) {
        // 创建受监管的加密货币
        // 参数依次为：见证类型、小数位数、代币符号、代币名称、描述、额外选项、交易上下文
        let (treasuryCap, denyCap, metadata) = coin::create_regulated_currency(
            witness,
            8,                      // 8位小数，类似以太坊的精度
            b"UNLIZHAO",            // 代币符号
            b"UNLIZHAO Coin",       // 代币全称
            b"move coin",           // 代币描述
            option::none(),         // 额外的可选配置
            ctx
        );

        // 将财政管理权转移给合约部署者
        public_transfer(treasuryCap, tx_context::sender(ctx));
        // 将拒绝权转移给合约部署者
        public_transfer(denyCap, tx_context::sender(ctx));
        // 冻结代币元数据，使其不可变
        public_freeze_object(metadata);
    }

    // 铸造新代币的公共入口函数
    // 参数：
    // - cap: 财政管理能力
    // - amount: 铸造数量
    // - recipient: 接收地址
    // - ctx: 交易上下文
    public entry fun mint(cap: &mut TreasuryCap<UNLIZHAO_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        // 使用财政管理能力铸造新代币
        let coin = coin::mint(cap, amount, ctx);
        // 将新铸造的代币转移给指定接收者
        public_transfer(coin, recipient);
    }

  // 转移代币的公共入口函数
    // 参数：
    // - coin: 要转移的代币
    // - recipient: 接收地址
    public entry fun transfer(coin: coin::Coin<UNLIZHAO_COIN>, recipient: address, ctx: &mut TxContext) {
        // 使用公共转移将代币发送到指定地址
        public_transfer(coin, recipient);
    }

}