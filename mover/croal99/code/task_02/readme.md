# Sui Move智能合约的单元测试(Unit Test)
通过这几天对Sui Move智能合约的学习，对其提供的测试模块sui::test_scenario有了更进一步的理解。 通过这个模块，我们可以模拟大部分的用户操作，从而避免要把代码部署上网后才能发现错误和漏洞。

# 一、独享所有权的测试
我们用一个经典的创建代币的代码来说明sui::test_scenario的使用。

```move
#[allow(duplicate_alias)]
/// Module: examples
module examples::mycoin {
    use std::debug;
    use std::ascii::string;
    use std::option;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::new_unsafe;

    public struct MYCOIN has drop {}

    #[lint_allow(self_transfer)]
    fun init(
        witness: MYCOIN,
        ctx: &mut TxContext
    ) {
        debug::print(&string(b"init MYCOIN"));
        let url_obj = new_unsafe(std::ascii::string(b"https://avatars.githubusercontent.com/u/36093027?v=4"));
        let (treasury, metadata) = coin::create_currency(
            witness,
            8, // decimals
            b"MYCOIN", // symbol
            b"My COIN", // name
            b"My first coin", // description
            option::some(url_obj), // icon url
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    #[lint_allow(self_transfer)]
    #[allow(unused_variable)]
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MYCOIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        debug::print(&string(b"mint"));
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<MYCOIN>,
        coin: Coin<MYCOIN>
    ) {
        debug::print(&string(b"burn"));
        coin::burn(treasury_cap, coin);
    }
}
```

在这段代码里，我们创建了一个代币MYCOIN。这个代币拥有独享所有权，只有创建这个代币的所有者才能进行mint和burn。但是我们怎么才能在没有部署之前
就检查我们的代码的正确性呢？下面我们就用sui::test_scenario来模拟这个操作。

## 模拟用户admin对代币MYCOIN进行mint和burn

### 0x01 引入测试模块
```move
    #[test_only]
    use sui::test_scenario as ts;
```
### 0x02 测试init接口
```move
    #[test]
    fun test_self_mint() {
        let admin = @0xA;
        let mut scenario = ts::begin(admin);

        // init
        ts::next_tx(&mut scenario, admin);
        {
            init(MYCOIN {}, scenario.ctx());
        };

        ts::end(scenario);
        // pass
    }
```

注意：
* 因为`init`是Sui Move在发布合约时调用的，所以在测试单元必须单独调用。
*  `ts::begin()` 和 `ts::end()`必须要成对出现，否则编译器会提示错误。

### 0x03 模拟admin用户调用mint接口，给自己铸造100个MYCOIN
```move
        // mint 100 coin => admin
        ts::next_tx(&mut scenario, admin);
        {
            let mut treasurycap = ts::take_from_sender<TreasuryCap<MYCOIN>>(&scenario);
            mint(&mut treasurycap, 100, admin, scenario.ctx());
            // ts::return_to_address<TreasuryCap<MYCOIN>>(admin, treasurycap);
            ts::return_to_sender<TreasuryCap<MYCOIN>>(&scenario, treasurycap);
        };
```
注意：
* 在Sui Move中，对象必须要有所有者。因此从test_scenario获取的对象要么销毁，要么退还给test_scenario！

### 0x04 查询admin用户现在拥有的coin数量
```move
        // query [admin] coin
        ts::next_tx(&mut scenario, admin);
        {
            let coin = ts::take_from_sender<Coin<MYCOIN>>(&scenario);
            debug::print(&coin::value(&coin));
            ts::return_to_sender<Coin<MYCOIN>>(&scenario, coin);
        };
```

### 0x05 将coin销毁
```move
        // burn
        ts::next_tx(&mut scenario, admin);
        {
            let coin = ts::take_from_sender<Coin<MYCOIN>>(&scenario);
            let mut treasurycap = ts::take_from_sender<TreasuryCap<MYCOIN>>(&scenario);
            burn(&mut treasurycap, coin);
            ts::return_to_address<TreasuryCap<MYCOIN>>(admin, treasurycap);
        };
```

通过以上步骤，我们已经能够很清晰的看到Sui Move中对代币MYCOIN的处理。但是我们如何测试这个代币MYCOIN是拥有独享所有权的呢？下面我们通过test_scenario来模拟两个用户的操作：

## 模拟用户admin和user1对代币MYCOIN进行mint和burn

### 0x01 定义两个用户admin和user1
```move
    #[test]
    fun test_another_mint() {
        let admin = @0xA;
        let user1 = @0xB;
        let mut scenario = ts::begin(admin);

        // init，注意这里使用admin初始化，因为独享所有权，所以后面的操作都必须切换回admin
        ts::next_tx(&mut scenario, admin);
        {
            init(MYCOIN {}, scenario.ctx());
        };

        ts::end(scenario);
        // pass
```
注意：
* 用户地址可以随便选择，只要你方便区别就可以。
* 因为在初始化的时候用的是admin，所以后面的操作都必须要切换回admin，否则测试都会失败！

### 0x02 模拟admin用户调用mint接口，给user1铸造100个MYCOIN
```move
        // mint 100 coin => user1
        ts::next_tx(&mut scenario, admin);  // if change to user1, failed!
        {
            let mut treasurycap = ts::take_from_sender<TreasuryCap<MYCOIN>>(&scenario);
            mint(&mut treasurycap, 100, user1, scenario.ctx());
            ts::return_to_sender<TreasuryCap<MYCOIN>>(&scenario, treasurycap);
        };
```
注意：
* 因为MYCOIN的所有者是admin，所以只要是admin来操作，就能既给admin铸币也可以给user1铸币。

### 0x03 查询user1用户现在拥有的coin数量
```move
        // query [user1] coin
        ts::next_tx(&mut scenario, user1);
        {
            let coin = ts::take_from_sender<Coin<MYCOIN>>(&scenario);
            debug::print(&coin::value(&coin));
            ts::return_to_sender<Coin<MYCOIN>>(&scenario, coin);
        };
```
注意：
* 因为刚刚我们是铸造了100个MYCOIN给user1，因此查询时必须切换到用户user1。如果继续用admin进行查询，测试就会失败。

### 0x04 将coin销毁
```move
        // burn [user1] coin
        {
            // switch to user1
            ts::next_tx(&mut scenario, user1);
            let coin = ts::take_from_sender<Coin<MYCOIN>>(&scenario);

            // switch to admin  独享所有权!
            ts::next_tx(&mut scenario, admin);
            let mut treasurycap = ts::take_from_sender<TreasuryCap<MYCOIN>>(&scenario);
            burn(&mut treasurycap, coin);
            ts::return_to_address<TreasuryCap<MYCOIN>>(admin, treasurycap);
            // ts::return_to_sender<TreasuryCap<MYCOIN>>(&scenario, treasurycap);
        };
```
注意：
* 因为刚刚生成的100个coin的是user1，因此需要从用户user1获取这些代币。
* 因为合约的所有者是admin，因此调用burn销毁时需要切换到用户admin。

到此为止，我们通过sui::test_scenario模块已经充分测试了具有独享所有权的代币MYCOIN的所有功能，可以直接发布上网了！

# 二、共享所有权的测试

我们还是用一个经典的Faucet Coin代码来说明sui::test_scenario的使用。
```move
#[allow(duplicate_alias)]
/// Module: faucetcoin
module examples::faucet_coin {
    use std::debug;
    use std::ascii::string;
    use std::option;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::new_unsafe;

    public struct FAUCET_COIN has drop {}

    #[lint_allow(self_transfer)]
    #[allow(lint(share_owned))]
    fun init(
        witness: FAUCET_COIN,
        ctx: &mut TxContext
    ) {
        debug::print(&string(b"init FAUCET_COIN"));
        let url_obj = new_unsafe(std::ascii::string(b"https://avatars.githubusercontent.com/u/36093027?v=4"));
        let (treasury, metadata) = coin::create_currency(
            witness,
            8,                // decimals
            b"SuiFaucetRMB",           // symbol
            b"Sui Faucet RMB",       // name
            b"My faucet coin", // description
            option::some(url_obj),   // icon url
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    #[lint_allow(self_transfer)]
    #[allow(unused_variable)]
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        debug::print(&string(b"faucet mint"));
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        coin: Coin<FAUCET_COIN>
    ) {
        debug::print(&string(b"burn"));
        coin::burn(treasury_cap, coin);
    }
}
```
在这段代码里，我们创建了一个代币FAUCET_COIN。这个代币拥有共享所有权，任意人都可以对这个代币能进行mint和burn。我们怎么用sui::test_scenario来模拟这个操作呢。
### 0x01 定义两个用户admin和user1
```move
    // === Tests ===
    #[test_only]
    use sui::test_scenario as ts;

    #[test]
    fun test_faucet_coin() {
        let admin = @0xA;
        let user1 = @0xB;
        let mut scenario = ts::begin(admin);

        // init
        ts::next_tx(&mut scenario, admin);
        {
            init(FAUCET_COIN {}, scenario.ctx());
        };

        ts::end(scenario);
        // pass
```
注意：
* 因为共享所有权，所以在初始化的时候可以随便用admin或者user1。

### 0x02 模拟admin用户调用mint接口，给admin铸造100个FAUCET_COIN
```move
        // admin mint 100 coin
        ts::next_tx(&mut scenario, admin);
        {
            let mut treasurycap = ts::take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
            mint(&mut treasurycap, 100, admin, scenario.ctx());
            ts::return_shared<TreasuryCap<FAUCET_COIN>>(treasurycap);
        };

        // query [admin] coin
        ts::next_tx(&mut scenario, admin);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            debug::print(&coin::value(&coin));
            ts::return_to_sender<Coin<FAUCET_COIN>>(&scenario, coin);
        };
```
注意：
* 在Sui Move中，对象必须要有所有者。因为我们是给用户admin完成100个铸币的mint，所以在查询coin的时候需要用admin身份！
* 因为是共享所有权，所以sui::test_scenario是用take_shared方法返回对象。同理，将对象退给test_scenario的时候也必须用return_shared！

### 0x03 模拟user1用户调用mint接口，给user1铸造200个FAUCET_COIN
```move
        // user1 mint 200 coin。注意，这里和独享所有权不同，不会报错，可以mint！
        ts::next_tx(&mut scenario, user1);
        {
            let mut treasurycap = ts::take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
            mint(&mut treasurycap, 200, user1, scenario.ctx());
            ts::return_shared<TreasuryCap<FAUCET_COIN>>(treasurycap);
        };

        // query [user1] coin
        ts::next_tx(&mut scenario, user1);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            debug::print(&coin::value(&coin));
            ts::return_to_sender<Coin<FAUCET_COIN>>(&scenario, coin);
        };
```
注意：
* 因为FAUCET_COIN是共享所有权，所以切换用户user1后依然可以调用mint，这里就能清楚的看到共享所有权和独享所有权的区别！
* 铸币接收的对象不同，必须切换到接收对象才能正确查询到该用户的coin数量

### 0x04 将coin销毁
```move
        // burn [admin] coin，共享所有权，分别对自己的coin操作！
        ts::next_tx(&mut scenario, admin);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            let mut treasurycap = ts::take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
            burn(&mut treasurycap, coin);
            ts::return_shared<TreasuryCap<FAUCET_COIN>>(treasurycap);
        };

        // burn [user1] coin，共享所有权，分别对自己的coin操作！
        ts::next_tx(&mut scenario, user1);
        {
            let coin = ts::take_from_sender<Coin<FAUCET_COIN>>(&scenario);
            let mut treasurycap = ts::take_shared<TreasuryCap<FAUCET_COIN>>(&scenario);
            burn(&mut treasurycap, coin);
            ts::return_shared<TreasuryCap<FAUCET_COIN>>(treasurycap);
        };
```
注意：
* 因为FAUCET_COIN的所有权是不同用户，因此销毁的时候要切换用户分别销毁自己的coin。

到此为止，我们通过sui::test_scenario模块已经充分测试了具有共享所有权的代币FAUCET_COIN的所有功能，也从测试代码中发现了共享所有权和独享所有权的区别！
