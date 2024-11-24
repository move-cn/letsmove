
module game::game;
use sui::coin::{Self, Coin};
use sui::balance;
use sui::event::{emit};
use sui::random::{Self, Random};
use coin_faucet::jp::JP;
use book::utils::log;
public struct GameStorage has key{

    id : UID,
    playerBalance : balance::Balance<JP>,
    admin_id:ID,
}


public struct PlayerEvent has copy,drop{
    player_address : address,
    pay_amount : u64,
    gain_amount: u64,
    fee : u64,
    guess : u8,
    result : u8,
}

public struct DepositEvent has copy,drop{
    sender : address,
    from : u64,
    to  : u64
}

public fun get_balance(game:&GameStorage) : u64{
    game.playerBalance.value()
}

public struct AdminCap has key{
    id : UID,
}


fun init(ctx: &mut TxContext){
    let game_uid = object::new(ctx);
    
    let admin_cap = AdminCap{
        id : object::new(ctx),
    };
    let game = GameStorage{
        id : game_uid,
        playerBalance : balance::zero(),
        admin_id : * admin_cap.id.as_inner(),
    };

    transfer::transfer(admin_cap,ctx.sender());
    transfer::share_object(game);
}

#[allow(lint(self_transfer))]
public fun deposit(game:&mut GameStorage,coin_in:Coin<JP>, amount:u64,ctx: &mut TxContext ){
   let mut coin = coin_in;
   let c = coin.split(amount,ctx);
   let sender = ctx.sender();
   if(coin.value() == 0){
        coin::destroy_zero(coin);
   }
   else
   {
      //多余的钱返回给sender
      transfer::public_transfer(coin,sender);
   };

   let from =  game.playerBalance.value();

   game.playerBalance.join(sui::coin::into_balance(c));
   let event = DepositEvent{
        sender,
        from ,
        to : game.playerBalance.value()
   };
   emit(event);
 
}

/// 实在6点太难中了，只测试3点
const MAX_DIC_NUM:u8 = 3;
const PAY_TIMES : u64 = 3; //下注赔付倍数

public(package) fun dice(random:& Random,ctx: &mut TxContext) : u8{
    let mut g = random::new_generator(random, ctx);
    //let val = ( storage.last_nonce) * MULTIPLIER +  INCREMENT;
    g.generate_u8_in_range(1,MAX_DIC_NUM)
}


const FEE_RATE : u64 = 10; //手续费率 百分比
const EAmountTooLarge : u64  = 1 ;
const EAmountLessThan20 : u64 = 2;
const ECoinAmountIllegal : u64 = 3;
const ENoRight : u64 = 4;

/// 这里不能是public，否则可以在外部编写合约循环调用，
#[allow(lint(self_transfer))]
entry fun play(game:&mut GameStorage,
                random:&Random,
                mut c :   Coin<JP>,
                amount : u64,
                guess:u8,
                ctx: &mut TxContext){
    
    assert!(amount >= 20,EAmountLessThan20);
    assert!(c.value() >= amount,ECoinAmountIllegal);
    let target_amount  = amount * PAY_TIMES;
    let fee = (target_amount * FEE_RATE) / 100; //手续费,获胜之后抽取
    let real_amount = target_amount - fee ; //获胜的实际金额，扣除实际
    let add_amount = real_amount - amount;
    let mut gain_amount = 0;
    let mut pay_fee = 0;
    log(b"storage balance :",&game.playerBalance.value());
    log(b"add amount", &add_amount);
    assert!(game.playerBalance.value() >= add_amount,EAmountTooLarge);
    
    let dice_num = dice( random,ctx);
    if(guess == dice_num){
       
       //猜中了，给他的币增加余额
       let pay_coin = balance::split(&mut game.playerBalance, add_amount ).into_coin(ctx);
       gain_amount = real_amount;
       pay_fee = fee;
       coin::join(&mut c,pay_coin);
       //log(b"猜对了，增加：", &add_amount);
    }
    else{
        //猜错了，切一块下来
        //log(b"猜错了，减少： ", &amount);
        let new_coin = sui::coin::split(&mut c,amount,ctx);
        game.playerBalance.join(new_coin.into_balance());
    };

    if(c.value() > 0){
        transfer::public_transfer(c,ctx.sender());
    }
    else{
        c.destroy_zero();
    };

    emit(PlayerEvent{
        player_address : ctx.sender(),
        pay_amount : amount,
        gain_amount : gain_amount,
        fee : pay_fee,
        guess : guess,
        result : dice_num,
    });

}

entry fun withdraw(cap:&AdminCap,storage :  &mut GameStorage,ctx :&mut TxContext){
    //避免package升级传入新的AdminCap对象
    assert!(cap.id.to_address() == storage.admin_id.to_address(),ENoRight);
    let value = storage.playerBalance.value();
    let coin =  storage.playerBalance.split(value).into_coin(ctx);
    transfer::public_transfer(coin,ctx.sender());
} 

//节省资源
#[test_only]
fun  destory_storage(storage : GameStorage,ctx : &mut TxContext){
    let GameStorage{
        id,
        playerBalance,
        admin_id:_,
    } = storage;
    object::delete(id);
    let coin =  playerBalance.into_coin(ctx);
    transfer::public_transfer(coin,ctx.sender());
}

//节省资源
#[test_only]
entry fun destroy(cap:AdminCap,storage :  GameStorage,ctx :&mut TxContext){
    //避免package升级传入新的AdminCap对象
    assert!(cap.id.to_address() == storage.admin_id.to_address());
    let AdminCap{id} = cap;
    object::delete(id);
    destory_storage(storage,ctx);
} 

#[test_only]
public fun init_for_testing(ctx:&mut TxContext){
    init(ctx);
}


