1. 创建
```
sui move new hands_rock_paper_scissors
touch hands_rock_paper_scissors/sources/hands_rock_paper_scissors.move
```
2. 代码
```
module hands_rock_paper_scissors::hands_rock_paper_scissors {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use sui::coin::{Self, Coin};
    use sui::sui::SUI;
    use sui::balance::{Self, Balance};
    use std::string::{Self, String};
    use sui::table::{Self, Table};
    use std::vector;
    use sui::clock::{Self, Clock};
    use sui::math;

    const ENOTBALANCE: u64 = 0;
    const ENOTCORRECTHANDS: u64 = 1;
    const ENOTCORRECTCHOOSE: u64 = 2;

    const ROCK: vector<u8> = b"rock";
    const PAPER: vector<u8> = b"paper";
    const SCISSOR: vector<u8> = b"scissor";
    const LEFT: vector<u8> = b"left";
    const RIGHT: vector<u8> = b"right";

    struct GameCap has key {
        id: UID,
        creator: address,
    }

    struct Game has key {
        id: UID,
        balance: Balance<SUI>,
        hands: Table<String, vector<String>>,
    }

    fun init(ctx: &mut TxContext) {
        transfer::freeze_object(GameCap {
            id: object::new(ctx),
            creator: tx_context::sender(ctx),
        });
    }

    fun check(hand: vector<u8>): bool {
        hand == ROCK || hand == PAPER || hand == SCISSOR
    }

    fun hand_to_number(hand: vector<u8>): u64 {
        if (hand == ROCK)
            0
        else if (hand == PAPER)
            1
        else
            2
    }

    fun number_to_hand(number: u64): vector<u8> {
        if (number == 0)
            ROCK
        else if (number == 1)
            PAPER
        else
            SCISSOR
    }

    entry fun create_game(left_hand: vector<u8>, right_hand: vector<u8>, coin: Coin<SUI>, clock: &Clock, ctx: &mut TxContext) {
        assert!(coin::value(&coin) > 0, ENOTBALANCE);
        assert!(check(left_hand) && check(right_hand), ENOTCORRECTHANDS);

        let robot_left_hand = number_to_hand(clock::timestamp_ms(clock) % 3);
        let robot_right_hand = number_to_hand((hand_to_number(left_hand) + hand_to_number(right_hand) + hand_to_number(robot_left_hand)) % 3);

        let hands = table::new<String, vector<String>>(ctx);
        let user_hands = vector[string::utf8(left_hand), string::utf8(right_hand)];
        let robot_hands = vector[string::utf8(robot_left_hand), string::utf8(robot_right_hand)];
        table::add(&mut hands, string::utf8(b"user"), user_hands);
        table::add(&mut hands, string::utf8(b"robot"), robot_hands);

        let game = Game {
            id: object::new(ctx),
            balance: coin::into_balance(coin),
            hands,
        };
        transfer::transfer(game, tx_context::sender(ctx));
    }

    fun choose_to_number(hand: vector<u8>): u64 {
        if (hand == LEFT)
            0
        else
            1
    }

    fun user_win(user_hand: String, robot_hand: String): bool {
        let rock = string::utf8(ROCK);
        let paper = string::utf8(PAPER);
        let scissor = string::utf8(SCISSOR);
        user_hand == rock && robot_hand == scissor || user_hand == scissor && robot_hand == paper || user_hand == paper && robot_hand == rock
    }

    entry fun choose_hand(game_cap: &GameCap, game: Game, hand: vector<u8>, clock: &Clock, ctx: &mut TxContext) {
        assert!(hand == LEFT || hand == RIGHT, ENOTCORRECTCHOOSE);

        let Game {
            id,
            balance,
            hands,
        } = game;
        object::delete(id);

        let user_idx = choose_to_number(hand);
        let robot_idx = clock::timestamp_ms(clock) % 2;

        let user_hand = vector::borrow(table::borrow(&hands, string::utf8(b"user")), user_idx);
        let robot_hand = vector::borrow(table::borrow(&hands, string::utf8(b"robot")), robot_idx);

        let recipient = if (user_win(*user_hand, *robot_hand)) tx_context::sender(ctx) else game_cap.creator;
        let amount = math::min(balance::value(&balance), 1000000000);
        transfer::public_transfer(coin::take(&mut balance, amount, ctx), recipient);

        table::drop(hands);
        if (balance::value(&balance) > 0) {
            amount = balance::value(&balance);
            transfer::public_transfer(coin::take(&mut balance, amount, ctx), tx_context::sender(ctx));
        };
        balance::destroy_zero(balance);
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
BUILDING hands_rock_paper_scissors
Successfully verified dependencies on-chain against source.
Transaction Digest: 6E1AFeHAjcNeDTKaYfVEJ7viJv3pSq4wiKENkRxHiy17
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
│  │ Version: 81313244                                                                                         │
│  │ Digest: CsMopT8jToUMk9TAYBtPp9M6TbXLtGWCqDRKvj4MrW7p                                                      │
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
│    OO92g8kkAiiqCMqqcOe/O+XmqCOxg1JlGOYSLvq973CIGoN3H8yw0FecMlSPy2JqT9EcOYvjGb5MQ1RYlxkvAw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6E1AFeHAjcNeDTKaYfVEJ7viJv3pSq4wiKENkRxHiy17                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 355                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4ec4f049a6ef8128325621b2a1a3dce2923e9fa0649ef3ef02fbb69b2a1e2f79                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313245                                                                              │
│  │ Digest: Ce3Zzie2Wgm8U7g5jfssKGoq2rCGVZkrCEhHHEwQJVNr                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x679f4f04bce8d849a1f6488655cd67c9b91c1d5c757bebee8e8ff59ca14311bb                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Eo6Tis4CJhZEz9kQWpKyiPeTgDidymzJCxAAHvw3CtLp                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd265d859652446def1539abb200ce526a9ae4d1593387e96a2672f8c8909220b                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 81313245                                                                              │
│  │ Digest: maX6bCLozgM2yPmcU1MvnMv1LSrgsJmG6a3VPT4r3ac                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313245                                                                              │
│  │ Digest: dwMqSKFZTBkwiTrXjbqcY5wh1j4TF8ZnEfojmtz5WNA                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313245                                                                              │
│  │ Digest: dwMqSKFZTBkwiTrXjbqcY5wh1j4TF8ZnEfojmtz5WNA                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 21515600 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    mfu3eGvn1HzJevdZuEj5amPq5eSofRWkWmNxgwfbymV                                                    │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    8PbkD3uBb6rdHoT8PvQ5j9wfpxXW1ByUqDr3ubpdhCkf                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                       │
│  ┌──                                                                                                                   │
│  │ ObjectID: 0x4ec4f049a6ef8128325621b2a1a3dce2923e9fa0649ef3ef02fbb69b2a1e2f79                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                          │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                       │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                │
│  │ Version: 81313245                                                                                                   │
│  │ Digest: Ce3Zzie2Wgm8U7g5jfssKGoq2rCGVZkrCEhHHEwQJVNr                                                                │
│  └──                                                                                                                   │
│  ┌──                                                                                                                   │
│  │ ObjectID: 0xd265d859652446def1539abb200ce526a9ae4d1593387e96a2672f8c8909220b                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                          │
│  │ Owner: Immutable                                                                                                    │
│  │ ObjectType: 0x679f4f04bce8d849a1f6488655cd67c9b91c1d5c757bebee8e8ff59ca14311bb::hands_rock_paper_scissors::GameCap  │
│  │ Version: 81313245                                                                                                   │
│  │ Digest: maX6bCLozgM2yPmcU1MvnMv1LSrgsJmG6a3VPT4r3ac                                                                 │
│  └──                                                                                                                   │
│ Mutated Objects:                                                                                                       │
│  ┌──                                                                                                                   │
│  │ ObjectID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                                        │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                          │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                          │
│  │ Version: 81313245                                                                                                   │
│  │ Digest: dwMqSKFZTBkwiTrXjbqcY5wh1j4TF8ZnEfojmtz5WNA                                                                 │
│  └──                                                                                                                   │
│ Published Objects:                                                                                                     │
│  ┌──                                                                                                                   │
│  │ PackageID: 0x679f4f04bce8d849a1f6488655cd67c9b91c1d5c757bebee8e8ff59ca14311bb                                       │
│  │ Version: 1                                                                                                          │
│  │ Digest: Eo6Tis4CJhZEz9kQWpKyiPeTgDidymzJCxAAHvw3CtLp                                                                │
│  │ Modules: hands_rock_paper_scissors                                                                                  │
│  └──                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -21287480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
5. 设置环境变量
```
export PACKAGE_ID=0x679f4f04bce8d849a1f6488655cd67c9b91c1d5c757bebee8e8ff59ca14311bb
export GAMECAP=0xd265d859652446def1539abb200ce526a9ae4d1593387e96a2672f8c8909220b
```
6. 切换其他用户并准备好参与游戏的Coin
```
sui client switch --address peaceful-hiddenite

sui client gas
# 记录上述命令得到的gasCoinId
export COIN=0xa5e9cc06d7bfb34b49fd2f6631e0580129fa8124a36030ae5107ebf785fca37c

# 分出999
sui client split-coin --coin-id $COIN --amounts 999 --gas-budget 10000000

sui client gas
# 记录上述命令得到的gasCoinId（用新分出的999）
export COIN=0xa4e204dd0fcf85910aa6411bfab04a56203ae67de25d743e55f28bb494062a8f
```
7. 交互
```
sui client call --package $PACKAGE_ID --module hands_rock_paper_scissors --function create_game --args rock paper $COIN 0x6 --gas-budget 10000000

# 成功后信息如下：
Transaction Digest: HsVY7L2W7hR1s8Ksp2BKgQVsSz2pUYLcaKu7wLfWkHk4
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                      │
│ Gas Owner: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xa5e9cc06d7bfb34b49fd2f6631e0580129fa8124a36030ae5107ebf785fca37c                       │
│  │ Version: 81313247                                                                            │
│  │ Digest: 4THkdvGN3tiVqMhQWa8tw6tzLuaJYZ1dSToVm62pmFbC                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "rock"                                               │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "paper"                                              │ │
│ │ 2   Imm/Owned Object ID: 0xa4e204dd0fcf85910aa6411bfab04a56203ae67de25d743e55f28bb494062a8f │ │
│ │ 3   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  create_game                                                        │            │
│ │  │ Module:    hands_rock_paper_scissors                                          │            │
│ │  │ Package:   0x679f4f04bce8d849a1f6488655cd67c9b91c1d5c757bebee8e8ff59ca14311bb │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  │   Input  3                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    pNC0NeiLK2h04Bt4ZCth2kStQA8UnCXlZLDV7ydTVcFo3vpJ24hlKknegiSde1k1tPBV8pqRbqcPnJTkX566jg==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HsVY7L2W7hR1s8Ksp2BKgQVsSz2pUYLcaKu7wLfWkHk4                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 355                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0a4bcb3d4cfd2273a795e6f165d8cd3358c7d4a395b5dd311ca8212e6ca5bec8                         │
│  │ Owner: Object ID: ( 0xb141f0f2f5455c6ea57a48f0d9c1d63b616a25f666f1cf099e6250afe638fbe9 )       │
│  │ Version: 81313248                                                                              │
│  │ Digest: CyCdoUHwR1caaCQAfMecohnnE56hCNxkaPuEou1L36HH                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x0afceb14d09994a44c2921706de331233a8c8ab793319bec44ce30e5a8d41c51                         │
│  │ Owner: Object ID: ( 0xb141f0f2f5455c6ea57a48f0d9c1d63b616a25f666f1cf099e6250afe638fbe9 )       │
│  │ Version: 81313248                                                                              │
│  │ Digest: 3PTpgz7qW6h1cBSjtHpmr6xicP71q9WUBzrDFFoHJLq8                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb603fe81956368419dab526e5f502bbeb0ccb95380d5c0a4690132900f325864                         │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ Version: 81313248                                                                              │
│  │ Digest: GacHxa7gfxP9bixRWpeLBhYrskq66UxiyJ8RAokSthnm                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa5e9cc06d7bfb34b49fd2f6631e0580129fa8124a36030ae5107ebf785fca37c                         │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ Version: 81313248                                                                              │
│  │ Digest: BeaaM9h3mmSGe1y9cjqJ3WREJ4T67JywMHLvFvuJd6Bb                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 30370223                                                                              │
│  │ Digest: 2MBYF7Ps5mCmGLrjS1FdRKMEXKJnvFrfRYHuNZ7p3CnD                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa4e204dd0fcf85910aa6411bfab04a56203ae67de25d743e55f28bb494062a8f                         │
│  │ Version: 81313248                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xa5e9cc06d7bfb34b49fd2f6631e0580129fa8124a36030ae5107ebf785fca37c                         │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ Version: 81313248                                                                              │
│  │ Digest: BeaaM9h3mmSGe1y9cjqJ3WREJ4T67JywMHLvFvuJd6Bb                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7182000 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 1956240 MIST                                                                   │
│    Non-refundable Storage Fee: 19760 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6E1AFeHAjcNeDTKaYfVEJ7viJv3pSq4wiKENkRxHiy17                                                   │
│    CJL23LkjNnhiqLdCurZmsXgKS42TuK3SBktGLWAavLig                                                   │
│    EFQSRJA3m236odP8EUZpG6DafkRhUdfUHeJ2ZRSo1o2P                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                    │
│  ┌──                                                                                                                │
│  │ ObjectID: 0x0a4bcb3d4cfd2273a795e6f165d8cd3358c7d4a395b5dd311ca8212e6ca5bec8                                     │
│  │ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                                       │
│  │ Owner: Object ID: ( 0xb141f0f2f5455c6ea57a48f0d9c1d63b616a25f666f1cf099e6250afe638fbe9 )                         │
│  │ ObjectType: 0x2::dynamic_field::Field<0x1::string::String, vector<0x1::string::String>>                          │
│  │ Version: 81313248                                                                                                │
│  │ Digest: CyCdoUHwR1caaCQAfMecohnnE56hCNxkaPuEou1L36HH                                                             │
│  └──                                                                                                                │
│  ┌──                                                                                                                │
│  │ ObjectID: 0x0afceb14d09994a44c2921706de331233a8c8ab793319bec44ce30e5a8d41c51                                     │
│  │ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                                       │
│  │ Owner: Object ID: ( 0xb141f0f2f5455c6ea57a48f0d9c1d63b616a25f666f1cf099e6250afe638fbe9 )                         │
│  │ ObjectType: 0x2::dynamic_field::Field<0x1::string::String, vector<0x1::string::String>>                          │
│  │ Version: 81313248                                                                                                │
│  │ Digest: 3PTpgz7qW6h1cBSjtHpmr6xicP71q9WUBzrDFFoHJLq8                                                             │
│  └──                                                                                                                │
│  ┌──                                                                                                                │
│  │ ObjectID: 0xb603fe81956368419dab526e5f502bbeb0ccb95380d5c0a4690132900f325864                                     │
│  │ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                                       │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )                    │
│  │ ObjectType: 0x679f4f04bce8d849a1f6488655cd67c9b91c1d5c757bebee8e8ff59ca14311bb::hands_rock_paper_scissors::Game  │
│  │ Version: 81313248                                                                                                │
│  │ Digest: GacHxa7gfxP9bixRWpeLBhYrskq66UxiyJ8RAokSthnm                                                             │
│  └──                                                                                                                │
│ Mutated Objects:                                                                                                    │
│  ┌──                                                                                                                │
│  │ ObjectID: 0xa5e9cc06d7bfb34b49fd2f6631e0580129fa8124a36030ae5107ebf785fca37c                                     │
│  │ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                                       │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                       │
│  │ Version: 81313248                                                                                                │
│  │ Digest: BeaaM9h3mmSGe1y9cjqJ3WREJ4T67JywMHLvFvuJd6Bb                                                             │
│  └──                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -5976759                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

export GAME=0xb603fe81956368419dab526e5f502bbeb0ccb95380d5c0a4690132900f325864

# 其中有两个 0x2::dynamic_field::Field<0x1::string::String, vector<0x1::string::String>> 类型的对象
# 一个是你两只手的石头剪刀布情况，一个是机器人两只手的石头剪刀布情况
# 可以通过 sui client object <Object ID> 进行查看
# 经过分析后决定出左手还是右手

sui client call --package $PACKAGE_ID --module hands_rock_paper_scissors --function choose_hand --args $GAMECAP $GAME left 0x6 --gas-budget 10000000

# 成功后得到信息如下：
Transaction Digest: 7GUpbYQZDKcrTDFfrTZxpZXxhEToxsqe4JUW2N9rBPFp
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                      │
│ Gas Owner: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xa5e9cc06d7bfb34b49fd2f6631e0580129fa8124a36030ae5107ebf785fca37c                       │
│  │ Version: 81313248                                                                            │
│  │ Digest: BeaaM9h3mmSGe1y9cjqJ3WREJ4T67JywMHLvFvuJd6Bb                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xd265d859652446def1539abb200ce526a9ae4d1593387e96a2672f8c8909220b │ │
│ │ 1   Imm/Owned Object ID: 0xb603fe81956368419dab526e5f502bbeb0ccb95380d5c0a4690132900f325864 │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "left"                                               │ │
│ │ 3   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  choose_hand                                                        │            │
│ │  │ Module:    hands_rock_paper_scissors                                          │            │
│ │  │ Package:   0x679f4f04bce8d849a1f6488655cd67c9b91c1d5c757bebee8e8ff59ca14311bb │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  │   Input  3                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    RDVYwQlGulft41+/riu3M47tlHHsLkb6IUPu0To4F71JGkBo8tGF1Re2KqohBuUoyWoyp05yrBQRq7BrEhEAPQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 7GUpbYQZDKcrTDFfrTZxpZXxhEToxsqe4JUW2N9rBPFp                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 355                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8adddd3235b8ba234ea9b4fcc77dcf90c6c7ef25a172767557288d7b8295dd29                         │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ Version: 81313249                                                                              │
│  │ Digest: BgZPouSHhRwmSzsJNPjmuRUwyntbaLzH9Utp2z9MDXfM                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa5e9cc06d7bfb34b49fd2f6631e0580129fa8124a36030ae5107ebf785fca37c                         │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ Version: 81313249                                                                              │
│  │ Digest: FWZyuZSFKxVbRGS8wQXNLanzVuDH54VGWFi4B5ym28XH                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 30370549                                                                              │
│  │ Digest: 9TpNczk5rB9LeUANxHxMWjQie3tESARPBwVUYCQrZPBp                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb603fe81956368419dab526e5f502bbeb0ccb95380d5c0a4690132900f325864                         │
│  │ Version: 81313249                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xa5e9cc06d7bfb34b49fd2f6631e0580129fa8124a36030ae5107ebf785fca37c                         │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ Version: 81313249                                                                              │
│  │ Digest: FWZyuZSFKxVbRGS8wQXNLanzVuDH54VGWFi4B5ym28XH                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 1976000 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2738736 MIST                                                                   │
│    Non-refundable Storage Fee: 27664 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6E1AFeHAjcNeDTKaYfVEJ7viJv3pSq4wiKENkRxHiy17                                                   │
│    99bqGuLBQTrF6Lo74efB9Rg19EASKC9Piy8PuvkchZQc                                                   │
│    HsVY7L2W7hR1s8Ksp2BKgQVsSz2pUYLcaKu7wLfWkHk4                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x8adddd3235b8ba234ea9b4fcc77dcf90c6c7ef25a172767557288d7b8295dd29                  │
│  │ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                    │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 81313249                                                                             │
│  │ Digest: BgZPouSHhRwmSzsJNPjmuRUwyntbaLzH9Utp2z9MDXfM                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xa5e9cc06d7bfb34b49fd2f6631e0580129fa8124a36030ae5107ebf785fca37c                  │
│  │ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                    │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 81313249                                                                             │
│  │ Digest: FWZyuZSFKxVbRGS8wQXNLanzVuDH54VGWFi4B5ym28XH                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: 13735                                                                                  │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

# 通过Created Objects当中的Owner发现这笔金额被转到了自己账下，也就是自己赢回了押金，这一点也可以通过 sui clieng gas 进行确认
# 如果你不幸输掉了对局（平局也算输），那么这笔钱就会被转入publisher账下。
# 输掉对局的create_game hash: AvmRSyQuz35deGZ7MsL3pAptuzg2QhBezrgg8kuFv228
# 以及对应的choose_hand hash: BUEWya61uryXyHhQPDaSDQh97Ck9KTrYJbAT4yZXA6t2
```