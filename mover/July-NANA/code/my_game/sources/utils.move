module my_game::utils {

    use sui::bcs;
    use sui::clock;
    use sui::clock::Clock;
    use sui::event;
    use sui::tx_context;

    ///event
    public struct RandomSeed has copy, drop {
        tx_digest: vector<u8>,
        tx_digest_u64: u64,
        current_timestamp: u64,
    }

    /// 生成范围内的随机数 [min, max)
    public fun generate_random_in_range(ctx: &mut TxContext, clock: &Clock, min: u64, max: u64): u64 {
        let random_value = generate_random_number(ctx, clock);
        min + (random_value % (max - min))
    }

    /// 使用交易上下文信息生成种子，并生成范围内的随机数
    public fun generate_random_number(ctx: &TxContext, clock: &Clock): u64 {
        let tx_digest = tx_context::digest(ctx);
        let tx_digest_u64 = bcs::peel_u64(&mut bcs::new(*tx_digest));
        // let tx_digest_u64 =u8_to_u64(*tx_digest);
        let current_timestamp = clock::timestamp_ms(clock);
        let random_number = current_timestamp % tx_digest_u64 ;
        event::emit(RandomSeed {
            tx_digest: *tx_digest,
            tx_digest_u64: tx_digest_u64,
            current_timestamp: current_timestamp,
        });
        random_number
    }

    /// 将地址字节转换为 u64
    // fun u8_to_u64(bytes: vector<u8>): u64 {
    //     let mut result: u64 = 0;
    //     let mut i: u64 = 0;
    //     while (i < 8 && i < vector::length(&bytes)) {
    //         result = result | ((vector::borrow(&bytes, i) as u64) << ((i * 8) as u8));
    //         i = i + 1;
    //     };
    //     result
    // }
}