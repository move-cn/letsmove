/*
/// Module: task4_game
module task4_game::task4_game;
*/
//ref https://learnblockchain.cn/article/9899


// 完成 链游相关知识的学习
// 完成 随机数的学习，游戏必须包含随机数
// 完成 存和取游戏资金池
// 完成 如何存储Coin在合约的学习，游戏必须能存取[task2] 发行的Faucet Coin,用task2的 Faucet Coin作为游戏输赢的资产
// 完成 第一个游戏合约部署主网
// 的game 必须包含自己的 github id的元素

// 设计思路:
// 1. 使用发行的 QWRDXER TOKEN 作为奖池,奖池初始有10000 QWRDXERTOKEN
// 2. 设置奖品NFT 附魔金苹果 金苹果 苹果  面包
// 3. NFT功能: NFT可以百分比抽取奖池中的QWRDXERTOKEN ,附魔金苹果10% 金苹果3% 苹果1%  面包10 QWRDXERTOKEN ,火把 1 QWRDXERCION
// 4. 游戏方式: 每次发送20Token进行抽奖,投掷 3颗 6面骰子,
//     如果 骰子面数相同 如 111 222 333 ,则获取附魔苹果,
//     如果骰子任意两个相同,获取金苹果,
//     如果骰子点数合计大于12,如 633,获取苹果
//     合计大于6,获得面包

module task4_game::mcraffle{
    use std::string;
    use std::string::String;
    use std::u32;
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin::{Coin, take, balance_mut};
    use sui::display::new_with_fields;
    use sui::event::emit;
    use sui::math::divide_and_round_up;
    use sui::package::claim;
    use sui::random;
    use sui::random::Random;
    use sui::tx_context::sender;
    use task2_coin::faucetqwrdxercoin::FAUCETQWRDXERCOIN;
    //游戏相关常量
    const ENCHANTED_GOLDEN_APPLE:u8=1;
    const GOLDEN_APPLE:u8=2;
    const APPLE:u8=3;
    const BREAD:u8=4;
    const ENRTY_COIN:u64=20_000000;//入场费用  20 COIN

    //错误码 常量
    const InSufficientBalance:u64=50;
    public struct AdminCap has key { //管理员权限对象
        id: UID
    }
    public struct GamePool has key{ //游戏资金池
        id:UID,
        balance:Balance<FAUCETQWRDXERCOIN>
    }

    public struct GameNFT has key, store { //游戏NFT
        id: UID,
        name: String,
        image_url: String,
        catalog: u8 //NFT类型  1 2 3 4
    }
    //随机数结果日志
    public struct GameResultEmit has drop,copy{
        r1:u16,
        user_address:address
    }
    //奖池当前coin数量日志
    //随机数结果日志
    public struct PoolAmountEmit has drop,copy{
        pool_amount:u64,
    }
    public struct MCRAFFLE has drop{}
    fun init(otw: MCRAFFLE, ctx:&mut TxContext){

        //------------------------------这是一对NFT标准创建流程代码-----------------------------
        let keys = vector[
            b"name".to_string(),
            b"link".to_string(),
            b"image_url".to_string(),
            b"description".to_string(),
            b"project_url".to_string(),
            b"creator".to_string(),
        ];

        let values = vector[
            // For `name` one can use the `Hero.name` property
            b"{name}".to_string(),
            // For `link` one can build a URL using an `id` property
            b"raffle".to_string(),
            // For `image_url` use an IPFS template + `image_url` property.
            b"{image_url}".to_string(),
            // Description is static for all `Hero` objects.
            b"Raffle".to_string(),
            // Project URL is usually static
            b"https://sui-raffle.io".to_string(),
            // Creator field can be any
            b"Unknown Sui Fan".to_string(),
        ];

        // Claim the `Publisher` for the package!
        let publisher = claim(otw, ctx);
        // Get a new `Display` object for the `Hero` type.
        let mut display = new_with_fields<GameNFT>(
            &publisher, keys, values, ctx
        );

        // Commit first version of `Display` to apply changes.
        display.update_version();
        transfer::public_transfer(publisher, ctx.sender());
        transfer::public_transfer(display, ctx.sender());
        //------------------------------这是一堆NFT标准创建流程代码-----------------------------
        let mcrafflePool=GamePool{
            id:object::new(ctx),
            balance: balance::zero(),
        };
        transfer::share_object(mcrafflePool); //大家都能访问这个游戏对象
        transfer::transfer(AdminCap{id:object::new(ctx)},tx_context::sender(ctx))//把权限给部署合约的人
    }

    //游戏函数
    public entry fun raffle_play(
        mcrafflePool:&mut GamePool,
        rdm:&Random,
        coin:&mut Coin<FAUCETQWRDXERCOIN>,
        ctx:&mut TxContext
    ) {
        //用户资金是否大于20
        assert!(
            coin.value() >= ENRTY_COIN,
            InSufficientBalance
        );
        // 存入奖池中
        let split_balance = balance::split(balance_mut(coin), ENRTY_COIN);
        balance::join(&mut mcrafflePool.balance, split_balance);
        //生成 3 个 1~6的随机数作为骰子结果
        let mut gen = random::new_generator(rdm, ctx);
        let r1 = random::generate_u16_in_range(&mut gen, 1, 1000);
        emit(GameResultEmit { r1: r1, user_address: tx_context::sender(ctx) });//结果放到日志里面

        if (r1 >900) {
            //如果为111,222,333,444 ...
            //发放附魔金苹果NFT
            let nft = GameNFT {
                id: object::new(ctx),
                name: string::utf8(b"Congratulations on obtaining the Enchanted Golden Apple!"),
                image_url: string::utf8(b"https://i.mcmod.cn/item/icon/128x128/11/118550.png"),
                catalog: 1
            };
            transfer::public_transfer(nft, sender(ctx));
        }else if (r1 > 700) {
            //发放金苹果NFT
            let nft = GameNFT {
                id: object::new(ctx),
                name: string::utf8(b"Congratulations on obtaining the  Golden Apple!"),
                image_url: string::utf8(b"https://i.mcmod.cn/editor/upload/20240915/1726376603_899182_aqta.webp"),
                catalog: 2
            };
            transfer::public_transfer(nft, sender(ctx));
        }else if(r1 > 400) {
            //发放普通 苹果
            let nft = GameNFT {
                id: object::new(ctx),
                name: string::utf8(b"Congratulations on obtaining the  Apple!"),
                image_url: string::utf8(b"https://i.mcmod.cn/editor/upload/20241014/1728881348_899182_HjeV.webp"),
                catalog: 3
            };
            transfer::public_transfer(nft, sender(ctx));
        }else  if (r1 > 200) {
            //发放面包
            let nft = GameNFT {
                id: object::new(ctx),
                name: string::utf8(b"Congratulations on obtaining the  BREAD!"),
                image_url: string::utf8(b"https://i.mcmod.cn/editor/upload/20240915/1726382983_899182_YYyp.webp"),
                catalog: 4
            };
            transfer::public_transfer(nft, sender(ctx));
        }
    }

    //兑换函数
    public entry fun raffle_exchange(gamePool:&mut  GamePool,nft:GameNFT,ctx:&mut TxContext){
        let GameNFT{id,name:_,image_url:_,catalog}=nft;
        //根据类别转账
        if(catalog==1){
            let current_pool_balance=gamePool.balance.value();
            let withdrawamount=divide_and_round_up(current_pool_balance,20);
            let cach=take(&mut gamePool.balance,withdrawamount,ctx);
            transfer::public_transfer(cach,ctx.sender());
        };
        if(catalog==2){
            let current_pool_balance=gamePool.balance.value();
            let withdrawamount=divide_and_round_up(current_pool_balance,33);
            let cach=take(&mut gamePool.balance,withdrawamount,ctx);
            transfer::public_transfer(cach,ctx.sender());
        };
        if(catalog==3){
            let current_pool_balance=gamePool.balance.value();
            let withdrawamount=divide_and_round_up(current_pool_balance,100);
            let cach=take(&mut gamePool.balance,withdrawamount,ctx);
            transfer::public_transfer(cach,ctx.sender());
        };
        if(catalog==4){
            let current_pool_balance=gamePool.balance.value();
            let cach=take(&mut gamePool.balance,10_000000,ctx);
            transfer::public_transfer(cach,ctx.sender());
        };

        id.delete();
    }
    // 管理员的存取函数
    public entry fun depositeCoin(_:&mut AdminCap,gamePool:&mut GamePool,coin:&mut Coin<FAUCETQWRDXERCOIN>,amount:u64,_:&mut TxContext){
        assert!(
            coin.value() >= amount,
            InSufficientBalance
        );
        let split_balance = balance::split(balance_mut(coin), amount);
        balance::join(&mut gamePool.balance, split_balance);
        emit(PoolAmountEmit{pool_amount:gamePool.balance.value()})
    }
    public entry fun withdrawCoin(_:&mut AdminCap,gamePool:&mut GamePool,amount:u64,ctx:&mut TxContext){
        let cach=take(&mut gamePool.balance,amount,ctx);
        transfer::public_transfer(cach,ctx.sender());
        emit(PoolAmountEmit{pool_amount:gamePool.balance.value()})
    }

}