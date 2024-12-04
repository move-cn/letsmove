<style>
pre {
    overflow-y:auto;
    max-height: 300px;
}
</style>

# task 4

### Build Package：

```bash
cd ../code/task4
sui move build
```

### Publish Package：

```bash
cd ../code/task4
sui client publish --gas-budget 50000000
```

* Publish Log:

```text

```

### Play Game:

* Mainnet

```bash
 sui client switch --env mainnet && sui client call \
--gas-budget 5000000 \
--package 0xdc919d8d90c2822e52f28e8086c52d15b5123e443b9dca2b0a838270805f364d \
--module Guess_Number_Game \
--function play_game \
--args \
5 \
"0x02f95db2ca9966e1af26148e17daa3dd0e4c65407563f08ff1c2f6a439265966" \
"0x6" 
```

* Testnet

```bash
 sui client switch --env testnet && sui client call \
--gas-budget 5000000 \
--package 0xa56843d739f92c24db5a4df1f9193101bc050858c044aa329506b01d502062f1 \
--module Guess_Number_Game \
--function play_game \
--args \
5 \
"0xd2e9a691bc1901b6d3c50f8c3cb6a724be8c48a4842465c731b9112c59040cb7" \
"0x6" 
```