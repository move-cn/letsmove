1. 创建
```
sui move new simple_swap
touch simple_swap/sources/coin_a.move simple_swap/sources/coin_b.move simple_swap/sources/swap.move
```
2. 代码
- coin_a.move
```
module simple_swap::coin_a {
    use sui::coin::{Self, TreasuryCap};

    public struct COIN_A has drop {}

    fun init(otw: COIN_A, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            otw,
            9,
            b"coin_a",
            b"CA",
            b"coin_a to study simple swap",
            option::none(),
            ctx,
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    entry fun mint(treasury_cap: &mut TreasuryCap<COIN_A>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}
```
- coin_b.move
```
module simple_swap::coin_b {
    use sui::coin::{Self, TreasuryCap};

    public struct COIN_B has drop {}

    fun init(otw: COIN_B, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            otw,
            9,
            b"coin_b",
            b"CB",
            b"coin_b to study simple swap",
            option::none(),
            ctx,
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    entry fun mint(treasury_cap: &mut TreasuryCap<COIN_B>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}
```
- swap.move
```
module simple_swap::swap {
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance, Supply};
    use sui::table::{Self, Table};

    const ErrNotContainLP: u64 = 0;
    const ErrNotEnoughBalance: u64 = 1;

    public struct LP<phantom COINA, phantom COINB> has drop {}

    public struct Pool<phantom COINA, phantom COINB> has key {
        id: UID,
        balance_a: Balance<COINA>,
        balance_b: Balance<COINB>,
        lp_supply: Supply<LP<COINA, COINB>>,
    }

    public struct Pocket has key {
        id: UID,
        id_to_vec: Table<ID, vector<u64>>,
    }

    fun init(ctx: &mut TxContext) {
        transfer::share_object(Pocket {
            id: object::new(ctx),
            id_to_vec: table::new<ID, vector<u64>>(ctx),
        });
    }

    entry fun create_pool<COINA, COINB>(ctx: &mut TxContext) {
        let pool = Pool<COINA, COINB> {
            id: object::new(ctx),
            balance_a: balance::zero(),
            balance_b: balance::zero(),
            lp_supply: balance::create_supply<LP<COINA, COINB>>(LP<COINA, COINB> {}),
        };
        transfer::share_object(pool);
    }

    entry fun add_liquidity<COINA, COINB>(pool: &mut Pool<COINA, COINB>, coin_a: Coin<COINA>, coin_b: Coin<COINB>, pocket: &mut Pocket, ctx: &mut TxContext) {
        let coin_a_amount = coin_a.value();
        let coin_b_amount = coin_b.value();

        pool.balance_a.join(coin_a.into_balance());
        pool.balance_b.join(coin_b.into_balance());

        let lp_balance = pool.lp_supply.increase_supply(coin_a_amount + coin_b_amount);
        let lp_coin = coin::from_balance(lp_balance, ctx);
        let lp_id = object::id(&lp_coin);

        let mut vec = vector::empty<u64>();
        vec.push_back(coin_a_amount);
        vec.push_back(coin_b_amount);

        pocket.id_to_vec.add(lp_id, vec);
        transfer::public_transfer(lp_coin, tx_context::sender(ctx));
    }

    entry fun remove_liquidity<COINA, COINB>(pool: &mut Pool<COINA, COINB>, lp: Coin<LP<COINA, COINB>>, pocket: &mut Pocket, ctx: &mut TxContext) {
        let lp_id = object::id(&lp);
        assert!(pocket.id_to_vec.contains(lp_id), ErrNotContainLP);

        let vec = pocket.id_to_vec.remove(lp_id);
        let coin_a_amount = vec[0];
        let coin_b_amount = vec[1];
        assert!(coin_a_amount <= pool.balance_a.value() && coin_b_amount <= pool.balance_b.value(), ErrNotEnoughBalance);

        pool.lp_supply.decrease_supply(lp.into_balance());

        let sender = tx_context::sender(ctx);
        transfer::public_transfer(coin::take(&mut pool.balance_a, coin_a_amount, ctx), sender);
        transfer::public_transfer(coin::take(&mut pool.balance_b, coin_b_amount, ctx), sender);
    }

    entry fun a_swap_b<COINA, COINB>(pool: &mut Pool<COINA, COINB>, coin_a: Coin<COINA>, ctx: &mut TxContext) {
        let amount = coin_a.value();
        assert!(amount <= pool.balance_b.value(), ErrNotEnoughBalance);

        pool.balance_a.join(coin_a.into_balance());
        transfer::public_transfer(coin::take(&mut pool.balance_b, amount, ctx), tx_context::sender(ctx));
    }

    entry fun b_swap_a<COINA, COINB>(pool: &mut Pool<COINA, COINB>, coin_b: Coin<COINB>, ctx: &mut TxContext) {
        let amount = coin_b.value();
        assert!(amount <= pool.balance_a.value(), ErrNotEnoughBalance);

        pool.balance_b.join(coin_b.into_balance());
        transfer::public_transfer(coin::take(&mut pool.balance_a, amount, ctx), tx_context::sender(ctx));
    }
}
```
3. build
```
sui move build
```
4. 发布
```
sui client publish 

# 成功后信息如下：
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING simple_swap
Skipping dependency verification
Transaction Digest: CXXQRcJPq4hyW2nTEVDjeuhFH8SmtwFRmjFuuVjkpqhT
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                   │
│ Gas Owner: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                                    │
│  │ Version: 81313260                                                                                         │
│  │ Digest: FjtFC2mgMLJx7NBaUhzwtvkx19jAvnNGXrzkaL8PF14y                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  └                                                                      │                                  │
│ │                                                                         │                                  │
│ │ 1  TransferObjects:                                                     │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Arguments:                                                           │                                  │
│ │  │   Result 0                                                           │                                  │
│ │  │ Address: Input  0                                                    │                                  │
│ │  └                                                                      │                                  │
│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    ibpiWIt7yzjJ4zikK7nSVJKfJFhXJ7Ok4oR3OzRRWKTXJ2Kp9rGBbJZlXhI3UjVRdCq6zhP5JhcyCy7EhPL1BQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: CXXQRcJPq4hyW2nTEVDjeuhFH8SmtwFRmjFuuVjkpqhT                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 363                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x587fbe3bbc2c349750a8f53e9211f6a8ac210191e77d1ef5d71c4b568ec56120                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313261                                                                              │
│  │ Digest: 92pGs77tf5fxN3VmywZfALAnNcJ6enA9cNxsCB4rj7no                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6c862ef9962fc9942738b32fa8fec7046c0013ece24452a050eae2f6b3409edc                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313261                                                                              │
│  │ Digest: 5Atz9ipb18wAWFszNFS2BeKCCCHgSj8gYCyqP3JXViEg                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb4e570db968ca1791d02e451924316f7df1c5a365968e78716a7fc2d640403d3                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 81313261                                                                              │
│  │ Digest: 4DBC25ieXRYXfsrQtFsDwN5c49nUwB9ipr2ySvGv7VZj                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 64Zp8BRcxAgfnHvUgi5jF9DJRrmyxwiQPdje6PK7MmFb                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc5516876817e2464633b0a39de3c08a59f64e28c839288b74df5e23fa6783b5e                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313261                                                                              │
│  │ Digest: 9ycDj4HxDAZPFDaRqzZiVz4R5gjLRMnMqADm72b5kEq                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd009d623e1aa706cc66f84716e994862ecd851eca618b7fc020ac8f50cc326d6                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 81313261                                                                              │
│  │ Digest: 5WtgpKKieZNKmBs9wKHtUTt66bCGfkS6596wpLU79Gf8                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xdd96634447f2657e360955f7a2497d247288fb8c0dec92214563770361e562f0                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 81313261                                                                              │
│  │ Digest: 5FnBPS8GcSJQW27WH9R3L59UtB4XgZcnpZg6sKchbqKV                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313261                                                                              │
│  │ Digest: 3XgtgunRHMgL7jGkQfUSUxxnzgSpSTnb4nYm8LdW4dk2                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313261                                                                              │
│  │ Digest: 3XgtgunRHMgL7jGkQfUSUxxnzgSpSTnb4nYm8LdW4dk2                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 37536400 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    mfu3eGvn1HzJevdZuEj5amPq5eSofRWkWmNxgwfbymV                                                    │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    HkJPpykom3HH1dpoTAGn1kHDwc3tYf782r2D6XJBw9o5                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x587fbe3bbc2c349750a8f53e9211f6a8ac210191e77d1ef5d71c4b568ec56120                                             │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                               │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                            │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A>   │
│  │ Version: 81313261                                                                                                        │
│  │ Digest: 92pGs77tf5fxN3VmywZfALAnNcJ6enA9cNxsCB4rj7no                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x6c862ef9962fc9942738b32fa8fec7046c0013ece24452a050eae2f6b3409edc                                             │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                               │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                            │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B>   │
│  │ Version: 81313261                                                                                                        │
│  │ Digest: 5Atz9ipb18wAWFszNFS2BeKCCCHgSj8gYCyqP3JXViEg                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xb4e570db968ca1791d02e451924316f7df1c5a365968e78716a7fc2d640403d3                                             │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                               │
│  │ Owner: Immutable                                                                                                         │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B>  │
│  │ Version: 81313261                                                                                                        │
│  │ Digest: 4DBC25ieXRYXfsrQtFsDwN5c49nUwB9ipr2ySvGv7VZj                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xc5516876817e2464633b0a39de3c08a59f64e28c839288b74df5e23fa6783b5e                                             │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                               │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                            │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                     │
│  │ Version: 81313261                                                                                                        │
│  │ Digest: 9ycDj4HxDAZPFDaRqzZiVz4R5gjLRMnMqADm72b5kEq                                                                      │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xd009d623e1aa706cc66f84716e994862ecd851eca618b7fc020ac8f50cc326d6                                             │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                               │
│  │ Owner: Immutable                                                                                                         │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A>  │
│  │ Version: 81313261                                                                                                        │
│  │ Digest: 5WtgpKKieZNKmBs9wKHtUTt66bCGfkS6596wpLU79Gf8                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xdd96634447f2657e360955f7a2497d247288fb8c0dec92214563770361e562f0                                             │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                               │
│  │ Owner: Shared                                                                                                            │
│  │ ObjectType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::swap::Pocket                             │
│  │ Version: 81313261                                                                                                        │
│  │ Digest: 5FnBPS8GcSJQW27WH9R3L59UtB4XgZcnpZg6sKchbqKV                                                                     │
│  └──                                                                                                                        │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                                             │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                               │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 81313261                                                                                                        │
│  │ Digest: 3XgtgunRHMgL7jGkQfUSUxxnzgSpSTnb4nYm8LdW4dk2                                                                     │
│  └──                                                                                                                        │
│ Published Objects:                                                                                                          │
│  ┌──                                                                                                                        │
│  │ PackageID: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef                                            │
│  │ Version: 1                                                                                                               │
│  │ Digest: 64Zp8BRcxAgfnHvUgi5jF9DJRrmyxwiQPdje6PK7MmFb                                                                     │
│  │ Modules: coin_a, coin_b, swap                                                                                            │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -37308280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
5. 设置环境变量
```
export PACKAGE_ID=0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef
export COIN_A_TREASURY_CAP=0x587fbe3bbc2c349750a8f53e9211f6a8ac210191e77d1ef5d71c4b568ec56120
export COIN_B_TREASURY_CAP=0x6c862ef9962fc9942738b32fa8fec7046c0013ece24452a050eae2f6b3409edc
export COIN_A_TYPE=0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A
export COIN_B_TYPE=0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B
export POCKET=0xdd96634447f2657e360955f7a2497d247288fb8c0dec92214563770361e562f0
export OWNER=0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67(这是你自己的地址，用来接收铸造的币)
```
6. 交互
- 铸造100个coin_a
```
sui client call --package $PACKAGE_ID --module coin_a --function mint --args $COIN_A_TREASURY_CAP 100 $OWNER --gas-budget 10000000

# 成功后信息如下：
Transaction Digest: 9AYcxM5Wypb96S3c6tWe5EqvCBioVEN2c2ucm92aGyJL
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                   │
│ Gas Owner: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                                    │
│  │ Version: 81313261                                                                                         │
│  │ Digest: 3XgtgunRHMgL7jGkQfUSUxxnzgSpSTnb4nYm8LdW4dk2                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x587fbe3bbc2c349750a8f53e9211f6a8ac210191e77d1ef5d71c4b568ec56120              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100"                                                                    │ │
│ │ 2   Pure Arg: Type: address, Value: "0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    coin_a                                                             │                         │
│ │  │ Package:   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    YuDEZ8wda6Mxo8+r6CB/jeL1X7/pIfqzgAHWWNHgHfBGQ7FrM9mynQzogJH1R9CLSSifpEGe5RtZC5boBareAw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9AYcxM5Wypb96S3c6tWe5EqvCBioVEN2c2ucm92aGyJL                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 363                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa9f409565a3a7dd7a58560eeee6865d76e1658c787232ff8d7e2f2fb1226d782                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313262                                                                              │
│  │ Digest: 2Kvdo72b6od1Cpn9XMSYJPWp9UQ4LGJJoUznYPPpiEra                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x587fbe3bbc2c349750a8f53e9211f6a8ac210191e77d1ef5d71c4b568ec56120                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313262                                                                              │
│  │ Digest: Cw3cfPmbhk1qnioEhKQGwvBaDkRNgoTjZ5zEQw25w8WG                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313262                                                                              │
│  │ Digest: EBJJb1fFgdrhMreJxhJnoaD8Ena68XjGdtkik4jNYRgj                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313262                                                                              │
│  │ Digest: EBJJb1fFgdrhMreJxhJnoaD8Ena68XjGdtkik4jNYRgj                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    CXXQRcJPq4hyW2nTEVDjeuhFH8SmtwFRmjFuuVjkpqhT                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xa9f409565a3a7dd7a58560eeee6865d76e1658c787232ff8d7e2f2fb1226d782                                            │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                           │
│  │ ObjectType: 0x2::coin::Coin<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A>         │
│  │ Version: 81313262                                                                                                       │
│  │ Digest: 2Kvdo72b6od1Cpn9XMSYJPWp9UQ4LGJJoUznYPPpiEra                                                                    │
│  └──                                                                                                                       │
│ Mutated Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x587fbe3bbc2c349750a8f53e9211f6a8ac210191e77d1ef5d71c4b568ec56120                                            │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                           │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A>  │
│  │ Version: 81313262                                                                                                       │
│  │ Digest: Cw3cfPmbhk1qnioEhKQGwvBaDkRNgoTjZ5zEQw25w8WG                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                                            │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                              │
│  │ Version: 81313262                                                                                                       │
│  │ Digest: EBJJb1fFgdrhMreJxhJnoaD8Ena68XjGdtkik4jNYRgj                                                                    │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2130008                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A   │
│  │ Amount: 100                                                                                    │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

# 记录coin_a
export COIN_A=0xa9f409565a3a7dd7a58560eeee6865d76e1658c787232ff8d7e2f2fb1226d782
```
- 铸造200个coin_b
```
sui client call --package $PACKAGE_ID --module coin_b --function mint --args $COIN_B_TREASURY_CAP 200 $OWNER --gas-budget 10000000

# 成功后信息如下：
Transaction Digest: 8KESndEDMKtBRFNRCgg9akfpiepHonYXtZBcU7JBknFf
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                   │
│ Gas Owner: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                                    │
│  │ Version: 81313262                                                                                         │
│  │ Digest: EBJJb1fFgdrhMreJxhJnoaD8Ena68XjGdtkik4jNYRgj                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x6c862ef9962fc9942738b32fa8fec7046c0013ece24452a050eae2f6b3409edc              │ │
│ │ 1   Pure Arg: Type: u64, Value: "200"                                                                    │ │
│ │ 2   Pure Arg: Type: address, Value: "0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    coin_b                                                             │                         │
│ │  │ Package:   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    zQ0mDTZEEJUH7lc1iqax0flFgtXGpxGKazlfUq/uMNun/k90J0MfNVavceu3s8lpLm5BcjTXjFcq0oFUOxV+AQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8KESndEDMKtBRFNRCgg9akfpiepHonYXtZBcU7JBknFf                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 363                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x114d021d7e1f721c17f5ffa131a2995931165eb8283e5613f517748abee066a5                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313263                                                                              │
│  │ Digest: DD387HJxwCZahbW4QcnJUWExuVVtQzU291gbuvb6nCmZ                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313263                                                                              │
│  │ Digest: BJixrnoUgVbtjwisNiQpne8brq4o5Lun2tjmUyhUj8X5                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6c862ef9962fc9942738b32fa8fec7046c0013ece24452a050eae2f6b3409edc                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313263                                                                              │
│  │ Digest: 4YEb9ZGjSWWFrvwgkJ7KJka3rHjCi5ughyQMyGyPmVdt                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313263                                                                              │
│  │ Digest: BJixrnoUgVbtjwisNiQpne8brq4o5Lun2tjmUyhUj8X5                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    9AYcxM5Wypb96S3c6tWe5EqvCBioVEN2c2ucm92aGyJL                                                   │
│    CXXQRcJPq4hyW2nTEVDjeuhFH8SmtwFRmjFuuVjkpqhT                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x114d021d7e1f721c17f5ffa131a2995931165eb8283e5613f517748abee066a5                                            │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                           │
│  │ ObjectType: 0x2::coin::Coin<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B>         │
│  │ Version: 81313263                                                                                                       │
│  │ Digest: DD387HJxwCZahbW4QcnJUWExuVVtQzU291gbuvb6nCmZ                                                                    │
│  └──                                                                                                                       │
│ Mutated Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                                            │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                              │
│  │ Version: 81313263                                                                                                       │
│  │ Digest: BJixrnoUgVbtjwisNiQpne8brq4o5Lun2tjmUyhUj8X5                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x6c862ef9962fc9942738b32fa8fec7046c0013ece24452a050eae2f6b3409edc                                            │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                           │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B>  │
│  │ Version: 81313263                                                                                                       │
│  │ Digest: 4YEb9ZGjSWWFrvwgkJ7KJka3rHjCi5ughyQMyGyPmVdt                                                                    │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2130008                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B   │
│  │ Amount: 200                                                                                    │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

# 记录coin_b
export COIN_B=0x114d021d7e1f721c17f5ffa131a2995931165eb8283e5613f517748abee066a5
```
- 创建pool
```
sui client call --package $PACKAGE_ID --module swap --function create_pool --type-args $COIN_A_TYPE $COIN_B_TYPE --gas-budget 10000000

# 成功后信息如下：
Transaction Digest: DWr6eoQQfkcpBv6EQyrt3sYTwLMwakpi6ARz2mbe7vZW
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                  │
│ Gas Owner: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67               │
│ Gas Budget: 10000000 MIST                                                                   │
│ Gas Price: 750 MIST                                                                         │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                   │
│  │ Version: 81313263                                                                        │
│  │ Digest: BJixrnoUgVbtjwisNiQpne8brq4o5Lun2tjmUyhUj8X5                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│   No input objects for this transaction                                                     │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                            │ │
│ │  ┌                                                                                      │ │
│ │  │ Function:  create_pool                                                               │ │
│ │  │ Module:    swap                                                                      │ │
│ │  │ Package:   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef        │ │
│ │  │ Type Arguments:                                                                      │ │
│ │  │   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A │ │
│ │  │   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B │ │
│ │  └                                                                                      │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                             │
│ Signatures:                                                                                 │
│    FYmR+vzd/2uEksbwLCW55Icy5tjH2k/BxrvKFeb6TSIkbYVivmmcYVEUtsv7Wltr8aw+YCDz6Gxf5yKUbx/MBA== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DWr6eoQQfkcpBv6EQyrt3sYTwLMwakpi6ARz2mbe7vZW                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 363                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 81313264                                                                              │
│  │ Digest: GLZVie6q2pFiawSFPW2Ge29C3A7Z5rwuQdK6gqSEjB5e                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313264                                                                              │
│  │ Digest: 6B3GUPLHzgKFZe9g53Pgx6r77jxvMT5FmPt8BJsfD4NN                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313264                                                                              │
│  │ Digest: 6B3GUPLHzgKFZe9g53Pgx6r77jxvMT5FmPt8BJsfD4NN                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3154000 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    8KESndEDMKtBRFNRCgg9akfpiepHonYXtZBcU7JBknFf                                                   │
│    CXXQRcJPq4hyW2nTEVDjeuhFH8SmtwFRmjFuuVjkpqhT                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb                                                                                                                                                                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                          │
│  │ Owner: Shared                                                                                                                                                                                                                                                       │
│  │ ObjectType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::swap::Pool<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A, 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B>  │
│  │ Version: 81313264                                                                                                                                                                                                                                                   │
│  │ Digest: GLZVie6q2pFiawSFPW2Ge29C3A7Z5rwuQdK6gqSEjB5e                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│ Mutated Objects:                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                                                                                                                                                                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                          │
│  │ Version: 81313264                                                                                                                                                                                                                                                   │
│  │ Digest: 6B3GUPLHzgKFZe9g53Pgx6r77jxvMT5FmPt8BJsfD4NN                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2925880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

# 记录pool
export POOL=0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb
```
- 添加到流动池
```
sui client call --package $PACKAGE_ID --module swap --function add_liquidity --args $POOL $COIN_A $COIN_B $POCKET --type-args $COIN_A_TYPE $COIN_B_TYPE --gas-budget 10000000

# 成功后信息如下：
Transaction Digest: 73XbRht4iRydb8aBR3YKAQPCpM3M4i9tQS56c4A6ftoc
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                      │
│ Gas Owner: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                       │
│  │ Version: 81313264                                                                            │
│  │ Digest: 6B3GUPLHzgKFZe9g53Pgx6r77jxvMT5FmPt8BJsfD4NN                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb │ │
│ │ 1   Imm/Owned Object ID: 0xa9f409565a3a7dd7a58560eeee6865d76e1658c787232ff8d7e2f2fb1226d782 │ │
│ │ 2   Imm/Owned Object ID: 0x114d021d7e1f721c17f5ffa131a2995931165eb8283e5613f517748abee066a5 │ │
│ │ 3   Shared Object    ID: 0xdd96634447f2657e360955f7a2497d247288fb8c0dec92214563770361e562f0 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────╮     │
│ │ Commands                                                                                │     │
│ ├─────────────────────────────────────────────────────────────────────────────────────────┤     │
│ │ 0  MoveCall:                                                                            │     │
│ │  ┌                                                                                      │     │
│ │  │ Function:  add_liquidity                                                             │     │
│ │  │ Module:    swap                                                                      │     │
│ │  │ Package:   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef        │     │
│ │  │ Type Arguments:                                                                      │     │
│ │  │   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A │     │
│ │  │   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B │     │
│ │  │ Arguments:                                                                           │     │
│ │  │   Input  0                                                                           │     │
│ │  │   Input  1                                                                           │     │
│ │  │   Input  2                                                                           │     │
│ │  │   Input  3                                                                           │     │
│ │  └                                                                                      │     │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────╯     │
│                                                                                                 │
│ Signatures:                                                                                     │
│    fM/nyL/IR5D5H7m6qnMRmZxXWpcktLmIzFZwE9wEle11Ya6X6IE3UpJqyGYvUvTvSw5s729hX5TncPOhwcYUCQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 73XbRht4iRydb8aBR3YKAQPCpM3M4i9tQS56c4A6ftoc                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 363                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xc056f26580a91e218a709fe5f65543d3dc0cc929ce50e9fe8089a91c4117a922                         │
│  │ Owner: Object ID: ( 0x0defc7f7c00f14a037ddfebc8f1daec85865cb2592c5c4d63b18f645d2e4eeb4 )       │
│  │ Version: 81313265                                                                              │
│  │ Digest: 8NbaKcfovGKkoikEcpAvzoWw12zcYUhYSmG8ws98PpG4                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe38a2a034439e631e57319fb6eb8755a8adaaa780bbcf2deb0e9bb9bfcfc8dd8                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313265                                                                              │
│  │ Digest: GgyDsa8VzftrYYMjX2ipeoGwYMJs5T1aCxVHPtATi8Tk                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313265                                                                              │
│  │ Digest: AAgpsMXGqXZRwLRkaQhRxRK5na3ztiNCGv5thVxavQM                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xdd96634447f2657e360955f7a2497d247288fb8c0dec92214563770361e562f0                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 81313265                                                                              │
│  │ Digest: 8RQbDQJhMY2BfSF6ZmPDJrkvgT74cBUghVi3NWfxKyM7                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 81313265                                                                              │
│  │ Digest: 2dbQk5zqyGqLfzmQiCMWdDo2EjCNugZPLvswjirQhpVe                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xdd96634447f2657e360955f7a2497d247288fb8c0dec92214563770361e562f0                         │
│  │ Version: 81313261                                                                              │
│  │ Digest: 5FnBPS8GcSJQW27WH9R3L59UtB4XgZcnpZg6sKchbqKV                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb                         │
│  │ Version: 81313264                                                                              │
│  │ Digest: GLZVie6q2pFiawSFPW2Ge29C3A7Z5rwuQdK6gqSEjB5e                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x114d021d7e1f721c17f5ffa131a2995931165eb8283e5613f517748abee066a5                         │
│  │ Version: 81313265                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa9f409565a3a7dd7a58560eeee6865d76e1658c787232ff8d7e2f2fb1226d782                         │
│  │ Version: 81313265                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313265                                                                              │
│  │ Digest: AAgpsMXGqXZRwLRkaQhRxRK5na3ztiNCGv5thVxavQM                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8816000 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 7358472 MIST                                                                   │
│    Non-refundable Storage Fee: 74328 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    8KESndEDMKtBRFNRCgg9akfpiepHonYXtZBcU7JBknFf                                                   │
│    9AYcxM5Wypb96S3c6tWe5EqvCBioVEN2c2ucm92aGyJL                                                   │
│    CXXQRcJPq4hyW2nTEVDjeuhFH8SmtwFRmjFuuVjkpqhT                                                   │
│    DWr6eoQQfkcpBv6EQyrt3sYTwLMwakpi6ARz2mbe7vZW                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0xc056f26580a91e218a709fe5f65543d3dc0cc929ce50e9fe8089a91c4117a922                                                                                                                                                                                                       │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                                         │
│  │ Owner: Object ID: ( 0x0defc7f7c00f14a037ddfebc8f1daec85865cb2592c5c4d63b18f645d2e4eeb4 )                                                                                                                                                                                           │
│  │ ObjectType: 0x2::dynamic_field::Field<0x2::object::ID, vector<u64>>                                                                                                                                                                                                                │
│  │ Version: 81313265                                                                                                                                                                                                                                                                  │
│  │ Digest: 8NbaKcfovGKkoikEcpAvzoWw12zcYUhYSmG8ws98PpG4                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0xe38a2a034439e631e57319fb6eb8755a8adaaa780bbcf2deb0e9bb9bfcfc8dd8                                                                                                                                                                                                       │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::swap::LP<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A, 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B>>  │
│  │ Version: 81313265                                                                                                                                                                                                                                                                  │
│  │ Digest: GgyDsa8VzftrYYMjX2ipeoGwYMJs5T1aCxVHPtATi8Tk                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│ Mutated Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                                                                                                                                                                                                       │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                         │
│  │ Version: 81313265                                                                                                                                                                                                                                                                  │
│  │ Digest: AAgpsMXGqXZRwLRkaQhRxRK5na3ztiNCGv5thVxavQM                                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                                  │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0xdd96634447f2657e360955f7a2497d247288fb8c0dec92214563770361e562f0                                                                                                                                                                                                       │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                                         │
│  │ Owner: Shared                                                                                                                                                                                                                                                                      │
│  │ ObjectType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::swap::Pocket                                                                                                                                                                                       │
│  │ Version: 81313265                                                                                                                                                                                                                                                                  │
│  │ Digest: 8RQbDQJhMY2BfSF6ZmPDJrkvgT74cBUghVi3NWfxKyM7                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb                                                                                                                                                                                                       │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                                         │
│  │ Owner: Shared                                                                                                                                                                                                                                                                      │
│  │ ObjectType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::swap::Pool<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A, 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B>                 │
│  │ Version: 81313265                                                                                                                                                                                                                                                                  │
│  │ Digest: 2dbQk5zqyGqLfzmQiCMWdDo2EjCNugZPLvswjirQhpVe                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                                                                                                                                                                    │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                                                                                                                                                               │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                   │
│  │ CoinType: 0x2::sui::SUI                                                                                                                                                                                                                                         │
│  │ Amount: -2207528                                                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                               │
│  ┌──                                                                                                                                                                                                                                                               │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                   │
│  │ CoinType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A                                                                                                                                                                    │
│  │ Amount: -100                                                                                                                                                                                                                                                    │
│  └──                                                                                                                                                                                                                                                               │
│  ┌──                                                                                                                                                                                                                                                               │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                   │
│  │ CoinType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B                                                                                                                                                                    │
│  │ Amount: -200                                                                                                                                                                                                                                                    │
│  └──                                                                                                                                                                                                                                                               │
│  ┌──                                                                                                                                                                                                                                                               │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                   │
│  │ CoinType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::swap::LP<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A, 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B>  │
│  │ Amount: 300                                                                                                                                                                                                                                                     │
│  └──                                                                                                                                                                                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

# 记录LP凭证
export LP=0xe38a2a034439e631e57319fb6eb8755a8adaaa780bbcf2deb0e9bb9bfcfc8dd8
```
- 铸造66个coin_a用于后续交换，并记录其值
```
sui client call --package $PACKAGE_ID --module coin_a --function mint --args $COIN_A_TREASURY_CAP 66 $OWNER --gas-budget 10000000
export COIN_A_66=0x81c81c690666951beb2e7fdcf286ff881807cb36a8d8d5f31d25542dc362fecf
```
- a swap b
```
sui client call --package $PACKAGE_ID --module swap --function a_swap_b --args $POOL $COIN_A_66 --type-args $COIN_A_TYPE $COIN_B_TYPE --gas-budget 10000000

# 成功后信息如下：
Transaction Digest: DKmL6aTL5XNbv32eCVzMqTiqsaEhBJ6uqHhUHFYug44S
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                      │
│ Gas Owner: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                       │
│  │ Version: 81313266                                                                            │
│  │ Digest: J5knSsHqW1RY5BeW8hTJVbqu7o57mgEunAEzJGaghise                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb │ │
│ │ 1   Imm/Owned Object ID: 0x81c81c690666951beb2e7fdcf286ff881807cb36a8d8d5f31d25542dc362fecf │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────╮     │
│ │ Commands                                                                                │     │
│ ├─────────────────────────────────────────────────────────────────────────────────────────┤     │
│ │ 0  MoveCall:                                                                            │     │
│ │  ┌                                                                                      │     │
│ │  │ Function:  a_swap_b                                                                  │     │
│ │  │ Module:    swap                                                                      │     │
│ │  │ Package:   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef        │     │
│ │  │ Type Arguments:                                                                      │     │
│ │  │   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A │     │
│ │  │   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B │     │
│ │  │ Arguments:                                                                           │     │
│ │  │   Input  0                                                                           │     │
│ │  │   Input  1                                                                           │     │
│ │  └                                                                                      │     │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────╯     │
│                                                                                                 │
│ Signatures:                                                                                     │
│    99NW/IB37XvnBIiIsSAZNofvVV9/8rYDY0eB4rFDV5rCfIU1M6KfpHwUfY4rUy/F7B0YIF3tCRi+IWHMoeT7Bg==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DKmL6aTL5XNbv32eCVzMqTiqsaEhBJ6uqHhUHFYug44S                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 363                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x87817b79aa58ac430db3a18b6f10e03971cd9391351a0ba1563d3f9de3201efc                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313267                                                                              │
│  │ Digest: 2fggJ68UwAyzCgGjFb548JYFwXsawwdXLfJHKgU2Pxs3                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313267                                                                              │
│  │ Digest: 5vy2BfWfQRozPV7AeTuwPeG7AR2fbwZEbauGYKQpVw83                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 81313267                                                                              │
│  │ Digest: 2fTv4nDyffbJpgcwnKGcWRvErDjAPDFMm8nv9Dbpj5Zz                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb                         │
│  │ Version: 81313265                                                                              │
│  │ Digest: 2dbQk5zqyGqLfzmQiCMWdDo2EjCNugZPLvswjirQhpVe                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x81c81c690666951beb2e7fdcf286ff881807cb36a8d8d5f31d25542dc362fecf                         │
│  │ Version: 81313267                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313267                                                                              │
│  │ Digest: 5vy2BfWfQRozPV7AeTuwPeG7AR2fbwZEbauGYKQpVw83                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4506800 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 4461732 MIST                                                                   │
│    Non-refundable Storage Fee: 45068 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    73XbRht4iRydb8aBR3YKAQPCpM3M4i9tQS56c4A6ftoc                                                   │
│    CXXQRcJPq4hyW2nTEVDjeuhFH8SmtwFRmjFuuVjkpqhT                                                   │
│    CcrnGaPqiYkb8yV7cAU8KRTs5DoVgwikSUFvagCzogua                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x87817b79aa58ac430db3a18b6f10e03971cd9391351a0ba1563d3f9de3201efc                                                                                                                                                                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B>                                                                                                                                                     │
│  │ Version: 81313267                                                                                                                                                                                                                                                   │
│  │ Digest: 2fggJ68UwAyzCgGjFb548JYFwXsawwdXLfJHKgU2Pxs3                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│ Mutated Objects:                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                                                                                                                                                                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                          │
│  │ Version: 81313267                                                                                                                                                                                                                                                   │
│  │ Digest: 5vy2BfWfQRozPV7AeTuwPeG7AR2fbwZEbauGYKQpVw83                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb                                                                                                                                                                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                          │
│  │ Owner: Shared                                                                                                                                                                                                                                                       │
│  │ ObjectType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::swap::Pool<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A, 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B>  │
│  │ Version: 81313267                                                                                                                                                                                                                                                   │
│  │ Digest: 2fTv4nDyffbJpgcwnKGcWRvErDjAPDFMm8nv9Dbpj5Zz                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -795068                                                                                │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A   │
│  │ Amount: -66                                                                                    │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B   │
│  │ Amount: 66                                                                                     │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

# 记录交换得到的66个coin_b
export COIN_B_66=0x87817b79aa58ac430db3a18b6f10e03971cd9391351a0ba1563d3f9de3201efc
```
- b swap a
```
sui client call --package $PACKAGE_ID --module swap --function b_swap_a --args $POOL $COIN_B_66 --type-args $COIN_A_TYPE $COIN_B_TYPE --gas-budget 10000000

# 成功后信息如下：
Transaction Digest: Bj17GAWCkc9muyr4JtoPEWhKEhyZd23MVMSN5nLU4R1e
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                      │
│ Gas Owner: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                       │
│  │ Version: 81313267                                                                            │
│  │ Digest: 5vy2BfWfQRozPV7AeTuwPeG7AR2fbwZEbauGYKQpVw83                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb │ │
│ │ 1   Imm/Owned Object ID: 0x87817b79aa58ac430db3a18b6f10e03971cd9391351a0ba1563d3f9de3201efc │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────╮     │
│ │ Commands                                                                                │     │
│ ├─────────────────────────────────────────────────────────────────────────────────────────┤     │
│ │ 0  MoveCall:                                                                            │     │
│ │  ┌                                                                                      │     │
│ │  │ Function:  b_swap_a                                                                  │     │
│ │  │ Module:    swap                                                                      │     │
│ │  │ Package:   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef        │     │
│ │  │ Type Arguments:                                                                      │     │
│ │  │   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A │     │
│ │  │   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B │     │
│ │  │ Arguments:                                                                           │     │
│ │  │   Input  0                                                                           │     │
│ │  │   Input  1                                                                           │     │
│ │  └                                                                                      │     │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────╯     │
│                                                                                                 │
│ Signatures:                                                                                     │
│    dgiZ3WkbPuLDEtAaSS9oc3h98z4j3lSs93F6adBptjJhzuOkk4t+536LlVuS1Uz3p67SAyji8h85N84r9Qk3CQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Bj17GAWCkc9muyr4JtoPEWhKEhyZd23MVMSN5nLU4R1e                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 363                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xcc96a577a2c35005317887f5a78cf6743844eba300d65b529e01cefde7d1e7c6                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313268                                                                              │
│  │ Digest: 6k8VGvTx6H85d1es6Z4LQn2mMGWtPVpbGXDniajxJ3Gn                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313268                                                                              │
│  │ Digest: 8tkSck8BTDRWSH3rzp3EcfDTcyEcN9Rjo8CqED5H74Pp                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 81313268                                                                              │
│  │ Digest: 346CyHqpErTJS6n82XG5qeBx7oHX9Exv1sR84cDEo9We                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb                         │
│  │ Version: 81313267                                                                              │
│  │ Digest: 2fTv4nDyffbJpgcwnKGcWRvErDjAPDFMm8nv9Dbpj5Zz                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x87817b79aa58ac430db3a18b6f10e03971cd9391351a0ba1563d3f9de3201efc                         │
│  │ Version: 81313268                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313268                                                                              │
│  │ Digest: 8tkSck8BTDRWSH3rzp3EcfDTcyEcN9Rjo8CqED5H74Pp                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4506800 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 4461732 MIST                                                                   │
│    Non-refundable Storage Fee: 45068 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    CXXQRcJPq4hyW2nTEVDjeuhFH8SmtwFRmjFuuVjkpqhT                                                   │
│    DKmL6aTL5XNbv32eCVzMqTiqsaEhBJ6uqHhUHFYug44S                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0xcc96a577a2c35005317887f5a78cf6743844eba300d65b529e01cefde7d1e7c6                                                                                                                                                                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A>                                                                                                                                                     │
│  │ Version: 81313268                                                                                                                                                                                                                                                   │
│  │ Digest: 6k8VGvTx6H85d1es6Z4LQn2mMGWtPVpbGXDniajxJ3Gn                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│ Mutated Objects:                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                                                                                                                                                                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                          │
│  │ Version: 81313268                                                                                                                                                                                                                                                   │
│  │ Digest: 8tkSck8BTDRWSH3rzp3EcfDTcyEcN9Rjo8CqED5H74Pp                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb                                                                                                                                                                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                          │
│  │ Owner: Shared                                                                                                                                                                                                                                                       │
│  │ ObjectType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::swap::Pool<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A, 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B>  │
│  │ Version: 81313268                                                                                                                                                                                                                                                   │
│  │ Digest: 346CyHqpErTJS6n82XG5qeBx7oHX9Exv1sR84cDEo9We                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -795068                                                                                │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A   │
│  │ Amount: 66                                                                                     │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B   │
│  │ Amount: -66                                                                                    │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

# 不难发现，又交换到了66个coin_a
```
- 移除流动性
```
sui client call --package $PACKAGE_ID --module swap --function remove_liquidity --args $POOL $LP $POCKET --type-args $COIN_A_TYPE $COIN_B_TYPE --gas-budget 10000000

# 成功后信息如下：
Transaction Digest: GrjstY58QUMFKHAyPg2zepLFnoKHwrHVshWu4n7BpJQ8
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                      │
│ Gas Owner: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                       │
│  │ Version: 81313268                                                                            │
│  │ Digest: 8tkSck8BTDRWSH3rzp3EcfDTcyEcN9Rjo8CqED5H74Pp                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb │ │
│ │ 1   Imm/Owned Object ID: 0xe38a2a034439e631e57319fb6eb8755a8adaaa780bbcf2deb0e9bb9bfcfc8dd8 │ │
│ │ 2   Shared Object    ID: 0xdd96634447f2657e360955f7a2497d247288fb8c0dec92214563770361e562f0 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────╮     │
│ │ Commands                                                                                │     │
│ ├─────────────────────────────────────────────────────────────────────────────────────────┤     │
│ │ 0  MoveCall:                                                                            │     │
│ │  ┌                                                                                      │     │
│ │  │ Function:  remove_liquidity                                                          │     │
│ │  │ Module:    swap                                                                      │     │
│ │  │ Package:   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef        │     │
│ │  │ Type Arguments:                                                                      │     │
│ │  │   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A │     │
│ │  │   0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B │     │
│ │  │ Arguments:                                                                           │     │
│ │  │   Input  0                                                                           │     │
│ │  │   Input  1                                                                           │     │
│ │  │   Input  2                                                                           │     │
│ │  └                                                                                      │     │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────╯     │
│                                                                                                 │
│ Signatures:                                                                                     │
│    amQqLknvudtX6XAi62JCYAlXatxdFNaqgSqrlAkc4/GJE7f4fUEjmOaWWAlplA9djC8c3hhOON/N4n2b1Q03Aw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GrjstY58QUMFKHAyPg2zepLFnoKHwrHVshWu4n7BpJQ8                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 363                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7072fdece5348de2f26b83902ee83c7e70561a8fc2d6b94e3fb42c7b89d39bfc                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313269                                                                              │
│  │ Digest: 3E68itKJj3XBSyjb2oj7ZP4fkjHVSPb29s9ToGo1pAtU                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc28256a019c2e47f2cc73bc7ccf5938d3294dab2af1d7a10c1576826edea6253                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313269                                                                              │
│  │ Digest: 3ajwizt7RbP42KhtL4msnNAJzeT1pBEvQh369zJV2nDo                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313269                                                                              │
│  │ Digest: GGiorjizQr2aSoYddyhT7N4WX2vcF2a6C5DUr6YWTdRE                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xdd96634447f2657e360955f7a2497d247288fb8c0dec92214563770361e562f0                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 81313269                                                                              │
│  │ Digest: GGbTzeBf3rs5Lus3vepUBrFckiwFTDrfkC5wHxFxZF91                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 81313269                                                                              │
│  │ Digest: 8zbsSupzxaftBY3PDCshzvHFxXWavcr49W8Tkk6cGREJ                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xdd96634447f2657e360955f7a2497d247288fb8c0dec92214563770361e562f0                         │
│  │ Version: 81313265                                                                              │
│  │ Digest: 8RQbDQJhMY2BfSF6ZmPDJrkvgT74cBUghVi3NWfxKyM7                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb                         │
│  │ Version: 81313268                                                                              │
│  │ Digest: 346CyHqpErTJS6n82XG5qeBx7oHX9Exv1sR84cDEo9We                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xc056f26580a91e218a709fe5f65543d3dc0cc929ce50e9fe8089a91c4117a922                         │
│  │ Version: 81313269                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe38a2a034439e631e57319fb6eb8755a8adaaa780bbcf2deb0e9bb9bfcfc8dd8                         │
│  │ Version: 81313269                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313269                                                                              │
│  │ Digest: GGiorjizQr2aSoYddyhT7N4WX2vcF2a6C5DUr6YWTdRE                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7432800 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 8727840 MIST                                                                   │
│    Non-refundable Storage Fee: 88160 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    73XbRht4iRydb8aBR3YKAQPCpM3M4i9tQS56c4A6ftoc                                                   │
│    Bj17GAWCkc9muyr4JtoPEWhKEhyZd23MVMSN5nLU4R1e                                                   │
│    CXXQRcJPq4hyW2nTEVDjeuhFH8SmtwFRmjFuuVjkpqhT                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x7072fdece5348de2f26b83902ee83c7e70561a8fc2d6b94e3fb42c7b89d39bfc                                                                                                                                                                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A>                                                                                                                                                     │
│  │ Version: 81313269                                                                                                                                                                                                                                                   │
│  │ Digest: 3E68itKJj3XBSyjb2oj7ZP4fkjHVSPb29s9ToGo1pAtU                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0xc28256a019c2e47f2cc73bc7ccf5938d3294dab2af1d7a10c1576826edea6253                                                                                                                                                                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B>                                                                                                                                                     │
│  │ Version: 81313269                                                                                                                                                                                                                                                   │
│  │ Digest: 3ajwizt7RbP42KhtL4msnNAJzeT1pBEvQh369zJV2nDo                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│ Mutated Objects:                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                                                                                                                                                                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                          │
│  │ Version: 81313269                                                                                                                                                                                                                                                   │
│  │ Digest: GGiorjizQr2aSoYddyhT7N4WX2vcF2a6C5DUr6YWTdRE                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0xdd96634447f2657e360955f7a2497d247288fb8c0dec92214563770361e562f0                                                                                                                                                                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                          │
│  │ Owner: Shared                                                                                                                                                                                                                                                       │
│  │ ObjectType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::swap::Pocket                                                                                                                                                                        │
│  │ Version: 81313269                                                                                                                                                                                                                                                   │
│  │ Digest: GGbTzeBf3rs5Lus3vepUBrFckiwFTDrfkC5wHxFxZF91                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0xf83639e335568f300f1b20de7a28100d22ed4f51db8dde1c28243ca0a8ae00fb                                                                                                                                                                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                                                                                                                                                          │
│  │ Owner: Shared                                                                                                                                                                                                                                                       │
│  │ ObjectType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::swap::Pool<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A, 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B>  │
│  │ Version: 81313269                                                                                                                                                                                                                                                   │
│  │ Digest: 8zbsSupzxaftBY3PDCshzvHFxXWavcr49W8Tkk6cGREJ                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                                                                                                                                                                    │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                                                                                                                                                               │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                   │
│  │ CoinType: 0x2::sui::SUI                                                                                                                                                                                                                                         │
│  │ Amount: 545040                                                                                                                                                                                                                                                  │
│  └──                                                                                                                                                                                                                                                               │
│  ┌──                                                                                                                                                                                                                                                               │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                   │
│  │ CoinType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A                                                                                                                                                                    │
│  │ Amount: 100                                                                                                                                                                                                                                                     │
│  └──                                                                                                                                                                                                                                                               │
│  ┌──                                                                                                                                                                                                                                                               │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                   │
│  │ CoinType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B                                                                                                                                                                    │
│  │ Amount: 200                                                                                                                                                                                                                                                     │
│  └──                                                                                                                                                                                                                                                               │
│  ┌──                                                                                                                                                                                                                                                               │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                                                                                                                                                   │
│  │ CoinType: 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::swap::LP<0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_a::COIN_A, 0xbf3da4e4174fda08f963abf9380e64aedec4d310dbd4a8e03ed4f653c05452ef::coin_b::COIN_B>  │
│  │ Amount: -300                                                                                                                                                                                                                                                    │
│  └──                                                                                                                                                                                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

# 不难发现，凭借着LP凭证已经赎回了100个coin_a和200个coin_b
```