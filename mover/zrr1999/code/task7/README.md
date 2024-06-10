```sh
sui client call  --package 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd --module check_in --function get_flag --gas-budget 10000000 --args "h[p55J|3_hAMRuqJ@8x\`a]DFIi;e]m" 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56 0x8
```

Transaction Digest: HE2rer7Yi53MjQYw9451gHdF8Lu3bfJHifPbiEBdStU2
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0da178626ee2b7910f827a26491cb28f6ef67d1679e5068d2e2407a54f4008ce │
│ Gas Owner: 0x0da178626ee2b7910f827a26491cb28f6ef67d1679e5068d2e2407a54f4008ce │
│ Gas Budget: 10000000 MIST │
│ Gas Price: 1000 MIST │
│ Gas Payment: │
│ ┌── │
│ │ ID: 0x0bfeaca713da023ce965c47a44b7ebe12eb2fc81aa903f1163fdd05ad89780c5 │
│ │ Version: 48023961 │
│ │ Digest: 9qhcp3TYg6yG9iB1kRteqS8oonhHn8Lnf6dQAfYWrZ4c │
│ └── │
│ │
│ Transaction Kind: Programmable │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0 Pure Arg: Type: vector<u8>, Value: "h[p55J|3_hAMRuqJ@8x`a]DFIi;e]m" │ │
│ │ 1 Shared Object ID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56 │ │
│ │ 2 Shared Object ID: 0x0000000000000000000000000000000000000000000000000000000000000008 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands │ │
│ ├──────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0 MoveCall: │ │
│ │ ┌ │ │
│ │ │ Function: get_flag │ │
│ │ │ Module: check_in │ │
│ │ │ Package: 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd │ │
│ │ │ Arguments: │ │
│ │ │ Input 0 │ │
│ │ │ Input 1 │ │
│ │ │ Input 2 │ │
│ │ └ │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯ │
│ │
│ Signatures: │
│ RB1Ang6Zua+eiRPuaJcDUhrOYdyksb6KlpTuNURSDpt8ROMuBAhpQmOc9mxlKDH740NC6M7Ed2NLnPEFOBh8Cw== │
│ │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HE2rer7Yi53MjQYw9451gHdF8Lu3bfJHifPbiEBdStU2 │
│ Status: Success │
│ Executed Epoch: 395 │
│ Mutated Objects: │
│ ┌── │
│ │ ID: 0x0bfeaca713da023ce965c47a44b7ebe12eb2fc81aa903f1163fdd05ad89780c5 │
│ │ Owner: Account Address ( 0x0da178626ee2b7910f827a26491cb28f6ef67d1679e5068d2e2407a54f4008ce ) │
│ │ Version: 48023962 │
│ │ Digest: Hb7CajQXdPiGFHKb9vDf4s6db75nrRjvfFnSHz5xEPrS │
│ └── │
│ ┌── │
│ │ ID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56 │
│ │ Owner: Shared( 12674957 ) │
│ │ Version: 48023962 │
│ │ Digest: 83GeQkDcubPGVPq7geTMxzYayd9GHfWCwTguCTXQfHJj │
│ └── │
│ Shared Objects: │
│ ┌── │
│ │ ID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56 │
│ │ Version: 48023961 │
│ │ Digest: 2qaWgxyskb6hnewavYYZ4ihqZjaXHEJnwpVipm1eEcwF │
│ └── │
│ ┌── │
│ │ ID: 0x0000000000000000000000000000000000000000000000000000000000000008 │
│ │ Version: 45290557 │
│ │ Digest: NZBNYmyjqr3b3yx1XMLJabLrYjSL5DRzZDfPbDGJPSx │
│ └── │
│ Gas Object: │
│ ┌── │
│ │ ID: 0x0bfeaca713da023ce965c47a44b7ebe12eb2fc81aa903f1163fdd05ad89780c5 │
│ │ Owner: Account Address ( 0x0da178626ee2b7910f827a26491cb28f6ef67d1679e5068d2e2407a54f4008ce ) │
│ │ Version: 48023962 │
│ │ Digest: Hb7CajQXdPiGFHKb9vDf4s6db75nrRjvfFnSHz5xEPrS │
│ └── │
│ Gas Cost Summary: │
│ Storage Cost: 2462400 MIST │
│ Computation Cost: 1000000 MIST │
│ Storage Rebate: 2588256 MIST │
│ Non-refundable Storage Fee: 26144 MIST │
│ │
│ Transaction Dependencies: │
│ 9vofkrxrxeHoL2SqJhPE3n3Sh3ZKUCNmf2q2DM76zfen │
│ GvtDcAEMFwzCSEPUqkaPGxD4CpKyD7DDfhLrnU8KuMBR │
│ HhSnjS56f6qMbMznhgtG1zEqFm3ZrC3ZCG6Ben6UZgw2 │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ ┌── │
│ │ EventID: HE2rer7Yi53MjQYw9451gHdF8Lu3bfJHifPbiEBdStU2:0 │
│ │ PackageID: 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd │
│ │ Transaction Module: check_in │
│ │ Sender: 0x0da178626ee2b7910f827a26491cb28f6ef67d1679e5068d2e2407a54f4008ce │
│ │ EventType: 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd::check_in::Flag │
│ │ ParsedJSON: │
│ │ ┌────────┬────────────────────────────────────────────────────────────────────┐ │
│ │ │ flag │ true │ │
│ │ ├────────┼────────────────────────────────────────────────────────────────────┤ │
│ │ │ sender │ 0x0da178626ee2b7910f827a26491cb28f6ef67d1679e5068d2e2407a54f4008ce │ │
│ │ └────────┴────────────────────────────────────────────────────────────────────┘ │
│ └── │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects: │
│ ┌── │
│ │ ObjectID: 0x0bfeaca713da023ce965c47a44b7ebe12eb2fc81aa903f1163fdd05ad89780c5 │
│ │ Sender: 0x0da178626ee2b7910f827a26491cb28f6ef67d1679e5068d2e2407a54f4008ce │
│ │ Owner: Account Address ( 0x0da178626ee2b7910f827a26491cb28f6ef67d1679e5068d2e2407a54f4008ce ) │
│ │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> │
│ │ Version: 48023962 │
│ │ Digest: Hb7CajQXdPiGFHKb9vDf4s6db75nrRjvfFnSHz5xEPrS │
│ └── │
│ ┌── │
│ │ ObjectID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56 │
│ │ Sender: 0x0da178626ee2b7910f827a26491cb28f6ef67d1679e5068d2e2407a54f4008ce │
│ │ Owner: Shared( 12674957 ) │
│ │ ObjectType: 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd::check_in::FlagString │
│ │ Version: 48023962 │
│ │ Digest: 83GeQkDcubPGVPq7geTMxzYayd9GHfWCwTguCTXQfHJj │
│ └── │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ ┌── │
│ │ Owner: Account Address ( 0x0da178626ee2b7910f827a26491cb28f6ef67d1679e5068d2e2407a54f4008ce ) │
│ │ CoinType: 0x2::sui::SUI │
│ │ Amount: -874144 │
│ └── │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
