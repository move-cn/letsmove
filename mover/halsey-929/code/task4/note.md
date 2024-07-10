## game

sui client publish --gas-budget 50000000

PackageID: 0x1b18172aab840cd86a560003faaf5758b51b67dcbb49d2692f1c4218f8970585 

Game: ObjectID:0xcbb7cf9f47cc4f5a70933c96e4a5b89980a412c0d3dc54ef8f8a239518f5cf30 

AdminCap: ObjectID: 0x71c04e67d61cbc96423e4c66c24e11319181e58103d2c572850ea4b110ac82cc  

export PACKAGE_ID=0x1b18172aab840cd86a560003faaf5758b51b67dcbb49d2692f1c4218f8970585 
export GAME_ID=0xcbb7cf9f47cc4f5a70933c96e4a5b89980a412c0d3dc54ef8f8a239518f5cf30 
export ADMIN_CAP=0x71c04e67d61cbc96423e4c66c24e11319181e58103d2c572850ea4b110ac82cc  

export FAUCET=0x88a1063e7d6da4154040051255d0f437474b1b1a57f3350622b4e6c7da23db93

sui client call --package $PACKAGE_ID --module halsey929_dice_game --function get_faucet_coin --args $FAUCET 10000000 --gas-budget 10000000

Faucet Coin: ObjectID:   0xff35826919fc39be8198b732ff41800d08aaec2904d6a33d47566c20a7788315 

export FAUCET_COIN=0xff35826919fc39be8198b732ff41800d08aaec2904d6a33d47566c20a7788315 

sui client call --package $PACKAGE_ID --module halsey929_dice_game --function deposit --args $GAME_ID  $FAUCET_COIN 5000000 --gas-budget 20000000

Transaction Digest: 5eCHnAnzgk4Rd4wda3W4jYwih1fNi6gziJErKjzGZ6Ni

deposit coin: 0xd0b607aa99c146e63b60d72d886d01adb74a1cd95bac0e43c437b9b40ea461ae          

export GAME_COIN=0xd0b607aa99c146e63b60d72d886d01adb74a1cd95bac0e43c437b9b40ea461ae          


sui client call --package $PACKAGE_ID --module halsey929_dice_game --function play --args 1 $GAME_ID $GAME_COIN 0x6 

Transaction Digest: 3AmurKeLmBh8SNdz4R8eLgHzUxQnnAQ6XaTaVm3wo5oU

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                          │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                              │
│  │ EventID: 3AmurKeLmBh8SNdz4R8eLgHzUxQnnAQ6XaTaVm3wo5oU:0                                                        │
│  │ PackageID: 0x1b18172aab840cd86a560003faaf5758b51b67dcbb49d2692f1c4218f8970585                                  │
│  │ Transaction Module: halsey929_dice_game                                                                        │
│  │ Sender: 0x2d92259fd0c9c8934a5a9bd6d975d8d63efbf110ac9d01a001098aa55525bfa9                                     │
│  │ EventType: 0x1b18172aab840cd86a560003faaf5758b51b67dcbb49d2692f1c4218f8970585::halsey929_dice_game::GameResult │
│  │ ParsedJSON:                                                                                                    │
│  │   ┌───────────┬───────┐                                                                                        │
│  │   │ is_winner │ false │                                                                                        │
│  │   ├───────────┼───────┤                                                                                        │
│  │   │ npc_roll  │ 3     │                                                                                        │
│  │   ├───────────┼───────┤                                                                                        │
│  │   │ result    │ Lose  │                                                                                        │
│  │   ├───────────┼───────┤                                                                                        │
│  │   │ your_roll │ 1     │                                                                                        │
│  │   └───────────┴───────┘                                                                                        │
│  └──                                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

sui client call --package $PACKAGE_ID --module halsey929_dice_game --function withdraw --args $ADMIN_CAP $GAME_ID 2000 --gas-budget 10000000

Transaction Digest: EgpemyfosNWUK6ieaA46BQJ6uy1hL8HoCHL2vZqyfppC
