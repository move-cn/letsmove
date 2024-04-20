export MY_ADDRESS=0x0da178626ee2b7910f827a26491cb28f6ef67d1679e5068d2e2407a54f4008ce

sui client publish --gas-budget 20000000

export PACKAGE_ID=0x73d88a00ddca6efe69816d616a34b885afda2975635ddc0a67cf3b20f248e9df

sui client call --function play --module guessing --package $PACKAGE_ID --args \"32\" --gas-budget 20000000
