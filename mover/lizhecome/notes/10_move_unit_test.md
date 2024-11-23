# （十）让Move语言的单元测试跑起来！

今天我们来讲一下单元测试，如果大家做到了**水分子社区**Move语言学习的task8，千万不要像我一样，把验证方法写到了合约上，那测试gas消耗的真叫一个快，而且还不出结果，使用test方式进行本地验证，不但免费，效率还高。当然，单元测试的用处不单单于此。。。什么？你要知道task8怎么做的？先卖个关子，请看后续的笔记。下面我们来看看单元测试应该怎么写。

如果代码是一本书，那么单元测试就是给每个章节加的注释和注解，帮助我们验证故事情节是否合乎逻辑。Move语言在这方面做得很细致，为测试带来了新工具和新玩法，让我们在调试中多了一丝乐趣，少了一份痛苦。以下内容将带你领略Move单元测试的奥秘，让你在开发的战场上如虎添翼。

## 1. 测试注解 (Testing Annotations)

Move单元测试有三个神奇的标记工具，它们就像开发者的超能力手环，让你精准控制测试行为：

- `#[test]`：标记测试函数

  - 无参数用法
    如果你想简单粗暴地标记一个函数是测试函数，那就直接扔上`#[test]`。但别忘了，这个函数必须 “孤单一人”，不能带任何参数。

    ```move
    #[test] // 正确：测试函数独善其身
    fun this_is_a_test() { ... }

    #[test] // 错误：测试函数带了小伙伴，编译器可不乐意
    fun this_is_not_correct(arg: signer) { ... }
    ```

  - 带参数用法
    如果非要带参数，也不是不行，但有两个硬性条件：
    1. 参数必须是signer类型。
    2. 注解里参数名要对得上号，编译器的记忆力可是杠杠的。

    ```move
    #[test(arg = @0xC0FFEE)] // 正确：参数对号入座
    fun this_is_correct_now(arg: signer) { ... }

    #[test(wrong_arg_name = @0xC0FFEE)] // 错误：名字对不上，编译器要吐槽了
    fun this_is_incorrect(arg: signer) { ... }
    ```

- `#[expected_failure]`：预期失败的艺术

  这是给那些你 “故意放倒的测试” 的专属标签，告诉大家“这不是BUG，这是艺术！”当然，如果测试结果没按预期失败，编译器会冷冷地说：“艺术失败了。”

  - 基本用法
    只需要加一个`#[expected_failure]`，它会检查测试是否失败。如果你想更精确一点，可以指定失败的错误码。

    ```move
    #[test]
    #[expected_failure(abort_code = 0)] // 测试预期失败且错误码为0
    fun this_test_should_abort_and_pass_too() { abort 0 }
    ```

- `#[test_only]`：只在测试模式下现身

  - 这是开发者的秘密武器，专为测试环境准备。标记了`#[test_only]`的模块、函数、或者变量，在测试模式外绝对隐身。

    ```move
    #[test_only]
    module test_helpers { ... }

    #[test_only]
    fun test_only_function(...) { ... }
    ```

## 2. 如何运行测试？

运行测试，就像按下游戏机的开关，看角色逐一通关。Move的测试用`move test`命令搞定，测试结果会告诉你每一个关卡是 PASS（通关）、FAIL（挂掉）、还是 TIMEOUT（卡关）。

- 运行测试

  ```sh
  $ move test
  ```

  例子输出：

  ```
  [ PASS    ] 0x1::my_module::make_sure_non_zero_coin_passes
  [ FAIL    ] 0x1::my_module::make_sure_zero_coin_fails
  ```

- 调试妙招：让失败变得清晰

  开发者的世界里，失败不可怕，可怕的是不知道为啥失败。Move给你一堆调试选项，让失败像谜底一样清晰：

  - 筛选测试：`-f` 或 `--filter`
    如果只想看特定名字的测试结果：

    ```sh
    $ move test -f zero_coin
    ```

  - 限制Gas消耗：`-i` 或 `--gas_used`
    设置测试的Gas上限，看谁跑得最节能：

    ```sh
    $ move test -i 500
    ```

  - 获取测试统计：`-s` 或 `--statistics`
    给测试做性能分析，看谁跑得最快、谁最费Gas：

    ```sh
    $ move test -s
    ```

  - 打印全局状态：`-g` 或 `--state-on-error`
    测试失败时，看看全局变量的状态，找到真正的幕后黑手：

    ```sh
    $ move test -g
    ```

## 3. 测试案例：万物皆可测试

下面是一个全副武装的测试模块，展示了如何用`#[test]`、`#[expected_failure]`和`#[test_only]`搭建坚固的测试体系：

```move
module 0x1::my_module {
    struct MyCoin has key { value: u64 }

    public fun make_sure_non_zero_coin(coin: MyCoin): MyCoin {
        assert!(coin.value > 0, 0);
        coin
    }

    #[test]
    fun make_sure_non_zero_coin_passes() {
        let coin = MyCoin { value: 1 };
        make_sure_non_zero_coin(coin);
    }

    #[test]
    #[expected_failure(abort_code = 0)]
    fun make_sure_zero_coin_fails() {
        let coin = MyCoin { value: 0 };
        make_sure_non_zero_coin(coin);
    }

    #[test(a = @0x1, b = @0x2)]
    fun test_has_coin(a: signer, b: signer) {
        assert!(true, 0);
    }
}
```

运行命令：

```sh
$ move test
```

结果示例：

```
[ PASS    ] 0x1::my_module::make_sure_non_zero_coin_passes
[ PASS    ] 0x1::my_module::make_sure_zero_coin_fails
[ PASS    ] 0x1::my_module::test_has_coin
```

Move的单元测试让你的开发变成一场策略游戏，每一行代码都是小心翼翼的布局，每一个测试都是信心满满的检验。失败不可怕，Move帮你找到失败背后的原因；调试不枯燥，工具的丰富让问题解决变成乐趣！

所以，快开始测试吧，代码的未来就掌握在你手中！ 🚀

> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)