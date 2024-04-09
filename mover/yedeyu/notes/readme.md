# Install Sui cli in Github Codespaces

## Install `brew`

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

## Install `sui`

```
brew install sui
```

Check that `sui` is installed.

```
sui -V
```

# Configure Sui client

```
sui client
```

## Check all environments and the active environment

```
sui client envs
```

## Connect to the testnet

```
sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
```

```
sui client switch --env testnet
```

## Generate new address

```
sui client new-address ed25519
```

## Import an address

```
sui keytool import "recovery phases" ed25519
```

## Check all addresses

```
sui client addresses
```

More information about the addresses

```
sui keytool list
```

## Switch active address

```
sui client switch --address <ADDRESS>
```

# Request test tokens via the CLI

For the active address

```
sui client faucet
```

```
sui client faucet --address <ADDRESS>
```

## Check the balance

```
sui client gas
```

# Sui Config Files

```
ls ~/.sui/sui_config/

client.yaml  sui.aliases  sui.keystore
```
