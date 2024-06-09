

```shell
# mint X
sui client call --package  0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124\
                --module Lumia001Coin \
                --function mint \
                --gas-budget 100000000 \
                --args 0x3428d0b61176fcc6b8076be0ecc341f38643065028ec41ef176267cacb0af896  \
                       200000000 \
                       0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59
                       
# mint Y               
sui client call --package  0xeca401e43db776c5a3149e27245c747907858abc38382a672e0f85d28d2ba124\
                --module Lumia001Faucet \
                --function mint \
                --gas-budget 10000000 \
                --args 0x55dba045d64cab75c3ac52a8c5add543d3dff9a1e2669a030b1a901971b16422  
```