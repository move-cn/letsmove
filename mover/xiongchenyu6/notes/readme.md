# 发布项目
sui client publish --gas-budget 200000000 . 

UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello
warning[W02021]: duplicate alias
  ┌─ /home/freeman.xiong/Private/letsmove/mover/xiongchenyu6/code/hello/sources/hello.move:4:19
  │
4 │ use sui::object::{Self, UID};
  │                   ^^^^ Unnecessary alias 'object' for module 'sui::object'. This alias is provided by default
  │
  = This warning can be suppressed with '#[allow(duplicate_alias)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W02021]: duplicate alias
  ┌─ /home/freeman.xiong/Private/letsmove/mover/xiongchenyu6/code/hello/sources/hello.move:4:25
  │
4 │ use sui::object::{Self, UID};
  │                         ^^^ Unnecessary alias 'UID' for module member 'sui::object::UID'. This alias is provided by default
  │
  = This warning can be suppressed with '#[allow(duplicate_alias)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W02021]: duplicate alias
  ┌─ /home/freeman.xiong/Private/letsmove/mover/xiongchenyu6/code/hello/sources/hello.move:6:23
  │
6 │ use sui::tx_context::{TxContext};
  │                       ^^^^^^^^^ Unnecessary alias 'TxContext' for module member 'sui::tx_context::TxContext'. This alias is provided by default
  │
  = This warning can be suppressed with '#[allow(duplicate_alias)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

Successfully verified dependencies on-chain against source.
Networking or low-level protocol error: Server returned an error status code: 502

Caused by:
    Server returned an error status code: 502

testnet不通，需要换到devnet网络

```
sui client new-env --alias devnet --rpc https://fullnode.devnet.sui.io:443
Added new Sui env [devnet] to config.

sui client switch --env devnet
Active environment switched to [devnet]
```
