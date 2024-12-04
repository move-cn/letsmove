module fantasy_move_swap::events {
    use std::ascii::String;
    use std::type_name::{into_string, get};

    use sui::event;
    use sui::object::ID;


    public struct CreatePoolEvent has drop, copy {
        /// signer of sender address
        sender: address,
        /// LpCoin value by user X and Y type
        /// code of X name
        coin_x: String,
        /// code of Y name
        coin_y: String,
        /// user input x
        pool_id: ID
    }

    public struct AddLpEvent has drop, copy {
        /// signer of sender address
        sender: address,
        /// LpCoin value by user X and Y type
        lp: u64,
        /// code of X name
        coin_x: String,
        /// code of Y name
        coin_y: String,
        /// user input x
        input_x: u64,
        /// user input y
        input_y: u64,
        ///  real cost x
        real_x: u64,
        ///  real cost y
        real_y: u64,
        /// reserve x
        reserve_x: u64,
        /// reserve y
        reserve_y: u64,
        /// total lp
        total_lp: u64
    }

    /// event emitted when remove token LpCoin.
    public struct RemoveLpEvent  has drop, copy {
        /// signer of sender address
        sender: address,
        /// code of X name
        coin_x: String,
        /// code of Y name
        coin_y: String,
        /// Lp coin value by user X and Y
        lp: u64,
        /// user input min x amount
        min_x: u64,
        /// user input min y amount
        min_y: u64,
        /// real get x amount
        real_x: u64,
        /// real get y amount
        real_y: u64,
        /// reserve x
        reserve_x: u64,
        /// reserve y
        reserve_y: u64,
        /// total lp
        total_lp: u64
    }

    /// event emitted when token swap.
    public struct SwapEvent  has drop, copy {
        /// who
        sender: address,
        /// in coin name
        in_coin: String,
        /// out coin name
        out_coin: String,
        /// in coin amount
        in_amount: u64,
        /// The amount of   get
        out_amount: u64,
        out_min_amount: u64,
        /// fee for dao service
        dao_fee: u64,
        /// fee for lp provider
        lp_fee: u64,
        /// reserve x
        reserve_x: u64,
        /// reserve y
        reserve_y: u64
    }


    public(package) fun emit_create_pool_event<X, Y>(sender: address, pool_id: ID) {
        event::emit(CreatePoolEvent {
            sender,
            coin_x: into_string(get<X>()),
            coin_y: into_string(get<Y>()),
            pool_id
        })
    }


    /// Emit add lp pool event
    public(package) fun emit_add_lp_event<X, Y>(
        sender: address,
        lp: u64,
        input_x: u64,
        input_y: u64,
        real_x: u64,
        real_y: u64,
        reserve_x: u64,
        reserve_y: u64,
        total_lp: u64
    ) {
        event::emit(AddLpEvent {
            sender,
            coin_x: into_string(get<X>()),
            coin_y: into_string(get<Y>()),
            lp,
            input_x,
            input_y,
            real_x,
            real_y,
            reserve_x,
            reserve_y,
            total_lp
        });
    }

    /// Emit remove lp event
    public(package) fun emit_remove_lp_event<X, Y>(
        sender: address,
        lp: u64,
        min_x: u64,
        min_y: u64,
        real_x: u64,
        real_y: u64,
        reserve_x: u64,
        reserve_y: u64,
        total_lp: u64
    ) {
        event::emit(RemoveLpEvent {
            coin_x: into_string(get<X>()),
            coin_y: into_string(get<Y>()),
            sender,
            lp,
            min_x,
            min_y,
            real_x,
            real_y,
            reserve_x,
            reserve_y,
            total_lp
        });
    }

    /// Emit swap event
    public(package) fun emit_swap_event<In, Out>(
        sender_address: address,
        in_amount: u64,
        // real out amount
        out_amount: u64,
        out_min_amount: u64,
        dao_fee: u64,
        lp_fee: u64,
        reserve_x: u64,
        reserve_y: u64
    ) {
        event::emit(SwapEvent {
            sender: sender_address,
            in_coin: into_string(get<In>()),
            out_coin: into_string(get<Out>()),
            in_amount,
            out_amount,
            out_min_amount,
            dao_fee,
            lp_fee,
            reserve_x,
            reserve_y
        });
    }
}
