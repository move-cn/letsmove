module task7::check_in {
    use std::ascii::{String, string};
    use std::bcs;
    use std::debug::print;
    use std::hash::{sha3_256};
    use std::vector;
    use sui::event;
    use sui::object;
    use sui::object::UID;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::share_object;
    use sui::tx_context::TxContext;


    const ErrorEq: u64 = 110;


    public struct FlagString has key{
        id: UID,
        str: String,
        ture_num: u64
    }

    public struct Flag has copy, drop {
        sender: address,
        flag: bool,
        ture_num: u64,
        github_id: String
    }

    fun init(ctx: &mut TxContext) {
        //初始化数据
        let flag_str = FlagString{
            id: object::new(ctx),
            str: string(b"LetsMoveCTF"),
            ture_num: 0
        };
        share_object(flag_str);
    }



    entry fun get_flag(flag: vector<u8>, github_id: String, flag_str: &mut FlagString, rand: &Random, ctx: &mut TxContext) {
        let mut bcs_flag = bcs::to_bytes(&flag_str.str);
        vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());

        //验证
        assert!(flag == sha3_256(bcs_flag), ErrorEq);

        //重新赋值
        flag_str.str = get_random_str(rand, ctx);
        flag_str.ture_num = flag_str.ture_num + 1;

        event::emit(Flag{
            sender: ctx.sender(),
            flag: true,
            ture_num: flag_str.ture_num,
            github_id
        })
    }



    fun get_random_str(rand: &Random, ctx: &mut TxContext) : String{
        //获取随机生成器
        let mut gen = random::new_generator(rand, ctx);
        //随机长度
        let mut len = random::generate_u8_in_range(&mut gen, 4, 30);

        //随机数
        let mut rand_str = b"";
        while (len != 0) {
            let rand_num = random::generate_u8_in_range(&mut gen, 34, 126);
            vector::push_back(&mut rand_str, rand_num);
            len = len - 1;
        };

        //返回随机数据
        string(rand_str)
    }





}
