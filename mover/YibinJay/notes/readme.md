task1: sui client publish --gas-budget 20000000

task2:

sui client publish --gas-budget 20000000

error[Sui E02003]: invalid 'init' function
  ┌─ ./sources/faucet.move:8:9
  │
8 │     fun init(witness: YIBINJAY_FAUCET_COIN, ctx: &mut TxContext) {
  │         ^^^^          -------------------- Invalid parameter 'witness' of type 'task2::yibinjayfaucet_coin::YIBINJAY_FAUCET_COIN'. Expected a one-time witness type, 'task2::yibinjayfaucet_coin::YIBINJAYFAUCET_COIN
  │         │              
  │         Invalid 'init' function declaration
  │
  = One-time witness types are structs with the following requirements: their name is the upper-case version of the module's name, they have no fields (or a single boolean field), they have no type parameters, and they have only the 'drop' ability.

Failed to build Move modules: Compilation error.

change module name. solved

Failed to build Move modules: Failed to resolve dependencies for package 'task2'

Caused by:
    0: Fetching 'Sui'
    1: Failed to fetch to latest Git state for package 'Sui', to skip set --skip-fetch-latest-git-deps | Exit status: exit status: 128.

export http_proxy=http://192.168.187.1:10811;export https_proxy=http://192.168.187.1:10811;export ALL_PROXY=socks5://192.168.187.1:10809

Error executing transaction: Failure {
    error: "InsufficientGas",
}

sui client publish --gas-budget 20000000

PackageID: 0xe55f387b15347ce3200e408c1213ee2a6f5951875d8239124c7555e7bc4d029c       

faucet ObjectID: 0x4a10aaba6964df60beea7c48fa6fb3ffc7f4b999d481ab4c315b9dbd7426b84f

coin ObjectID: 0xc50d10f8bb12c572144438916967ef41bf6efb7a34acd901492d5e7b9f4c3ee4 

sui client call --package 0xe55f387b15347ce3200e408c1213ee2a6f5951875d8239124c7555e7bc4d029c   --module yibinjay_coin --function mint --args 0xc50d10f8bb12c572144438916967ef41bf6efb7a34acd901492d5e7b9f4c3ee4 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

Transaction Digest: FEW7azuuAH7TNVr4MHuvAoxwzUSNfjaUec9m6i2L34Bc


mint to public 

sui client call --package 0xe55f387b15347ce3200e408c1213ee2a6f5951875d8239124c7555e7bc4d029c   --module yibinjay_faucet_coin --function mint --args 0x4a10aaba6964df60beea7c48fa6fb3ffc7f4b999d481ab4c315b9dbd7426b84f 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 20000000

Transaction Digest: FLQBYUvoESubvsogLmiLYBQ5LrLDsYRTcBQwAcwBRb4i

mint to myself

sui client call --package 0xe55f387b15347ce3200e408c1213ee2a6f5951875d8239124c7555e7bc4d029c   --module yibinjay_faucet_coin --function mint --args 0x4a10aaba6964df60beea7c48fa6fb3ffc7f4b999d481ab4c315b9dbd7426b84f 1000000 0x8766fc99c2c3f9099d52d03126b5d04695bd9e1febcbdb9859fe56aedd00d394 --gas-budget 20000000

Transaction Digest: 7sWRBMf5T3hH4C5crXakUWKtXgRJs2LbztMi4GsCsqeE

sui client balance 

╭────────────────────────────────────────────────────────────╮
│ Balance of coins owned by this address                     │
├────────────────────────────────────────────────────────────┤
│ ╭────────────────────────────────────────────────────────╮ │
│ │ coin             balance (raw)  balance                │ │
│ ├────────────────────────────────────────────────────────┤ │
│ │ Sui              4524719896     4.52 SUI               │ │
│ │ YIBINJAY_FAUCET  1000000        0.00 YIBINJAY_FAUCET   │ │
│ ╰────────────────────────────────────────────────────────╯ │
╰────────────────────────────────────────────────────────────╯

task3:

sui client publish --gas-budget 20000000 

PackageID: 0x2561fe37c1fcdd2efd42229f3ae186fdde65449099ceab6ee7fe6f09de0b7192

sui client call --package 0x2561fe37c1fcdd2efd42229f3ae186fdde65449099ceab6ee7fe6f09de0b7192 --module yibinjaynft --function mint --args "YibinJay YEAH" "YibinJay's first NFT" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 20000000

Transaction Digest: HyqLsf1m8E59P6nwZKv5TAuqyff1iQ985tjLL2dYvR8R

ObjectId: 0x9bee58dd3c17133723a3f809a2c21868efd49e5e5821a4c12f0d8049d21bfb07

