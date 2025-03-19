```
Usage: sui client [OPTIONS] [COMMAND]

Commands:
  active-address              Default address used for commands when none specified
  active-env                  Default environment used for commands when none specified
  addresses                   Obtain the Addresses managed by the client
  balance                     List the coin balance of an address
  call                        Call Move function
  chain-identifier            Query the chain identifier from the rpc endpoint
  dynamic-field               Query a dynamic field by its address
  envs                        List all Sui environments
  execute-signed-tx           Execute a Signed Transaction. This is useful when the user prefers to sign elsewhere and use this command to execute
  execute-combined-signed-tx  Execute a combined serialized SenderSignedData string
  faucet                      Request gas coin from faucet. By default, it will use the active address and the active network
  gas                         Obtain all gas objects owned by the address. An address' alias can be used instead of the address
  merge-coin                  Merge two coin objects into one coin
  new-address                 Generate new address and keypair with keypair scheme flag {ed25519 | secp256k1 | secp256r1} with optional derivation path, default to m/44'/784'/0'/0'/0' for ed25519 or m/54'/784'/0'/0/0
                                  for secp256k1 or m/74'/784'/0'/0/0 for secp256r1. Word length can be { word12 | word15 | word18 | word21 | word24} default to word12 if not specified
  new-env                     Add new Sui environment
  object                      Get object info
  objects                     Obtain all objects owned by the address. It also accepts an address by its alias
  pay                         Pay coins to recipients following specified amounts, with input coins. Length of recipients must be the same as that of amounts
  pay-all-sui                 Pay all residual SUI coins to the recipient with input coins, after deducting the gas cost. The input coins also include the coin for gas payment, so no extra gas coin is required
  pay-sui                     Pay SUI coins to recipients following following specified amounts, with input coins. Length of recipients must be the same as that of amounts. The input coins also include the coin for
                                  gas payment, so no extra gas coin is required
  publish                     Publish Move modules
  split-coin                  Split a coin object into multiple coins
  switch                      Switch active address and network(e.g., devnet, local rpc server)
  tx-block                    Get the effects of executing the given transaction block
  transfer                    Transfer object
  transfer-sui                Transfer SUI, and pay gas with the same SUI coin object. If amount is specified, only the amount is transferred; otherwise the entire object is transferred
  upgrade                     Upgrade Move modules
  verify-bytecode-meter       Run the bytecode verifier on the package
  verify-source               Verify local Move packages against on-chain packages, and optionally their dependencies
  profile-transaction         Profile the gas usage of a transaction. Unless an output filepath is not specified, outputs a file `gas_profile_{tx_digest}_{unix_timestamp}.json` which can be opened in a flamegraph
                                  tool such as speedscope
  replay-transaction          Replay a given transaction to view transaction effects. Set environment variable MOVE_VM_STEP=1 to debug
  replay-batch                Replay transactions listed in a file
  replay-checkpoint           Replay all transactions in a range of checkpoints
  help                        Print this message or the help of the given subcommand(s)

Options:
      --client.config <CONFIG>  Sets the file storing the state of our user accounts (an empty one will be created if missing)
      --json                    Return command outputs in json format
  -y, --yes
  -h, --help                    Print help
```


```
sui -V
sui client faucet
sui client gas
sui client addresses
sui move new hello_move
sui client publish
sui client new-env --alias devnet --rpc https://fullnode.devnet.sui.io:443
sui client switch --env <ALIAS>

sui client new-address ed25519
sui client switch --address xxxxxxxxxx

```