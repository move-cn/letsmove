必看
首先编译包 sui move build --skip-fetch-latest-git-deps
然后写合约内容
制作的是singmincoin

    fun init(witness: SINGMINCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"singmin",
            b"singmin coin",
            b"singmin coin",
            option::none(),
            ctx
        );
 
        transfer::public_freeze_object(metadata);
 
        transfer::public_transfer(treasury, ctx.sender());
    }

然后发布sui client publish 

这是Transaction Digest: 9bFFbSTJYWuHhyerWxQYzuuEgmr5TGJN6a1jtisE2AYX





我们需要拿到权限然后发币
我们要先拿到
package_ID = 0x6d0c64d6f81d069b337501c793d4eb6d2a2cb8ad4e00d77a379640519134e7f5
拿到铸币权限
TREASURYCAP_ID = 0x77effe3db60bd976b7a01512fdca61d98dbfa9301a29c183fb0828518ddc7ca2
拿到要发币的地址，如果发给自己就拿自己的地址  
address =0x30a08b3623bc390a9b77e6d832ee606e6870a210de89263fe9b5c0eeb8770b39

sui client call --function mint --module singmincoin --package 0x6d0c64d6f81d069b337501c793d4eb6d2a2cb8ad4e00d77a379640519134e7f5 --args 0x77effe3db60bd976b7a01512fdca61d98dbfa9301a29c183fb0828518ddc7ca2 10000 0x77bd6d097331cdcf924e950f605025e8296ad6f383b41d88f9e1c881aef55d2f

sui client call --function <function_name> --module <> --packge <packge_ID> --args <TREASURYCAP_ID> 数量 <address>


<!-- 主网部分 -->
EkM4uqhPWbmTDA2DiasH1JRvACRZXaMTpTskJde5kuja
package_ID = 0x65b40bbac41f161e9049be55fb4f7d2f12cc82fa049433565f366623af9ebaba
TREASURYCAP_ID = 0x39a1e4eb2a01dbbad663b72a4d8c993947256df91922de6993f2392482a765a1
address= 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 //uvd
       =0x77bd6d097331cdcf924e950f605025e8296ad6f383b41d88f9e1c881aef55d2f 
       =0x90ebcdad368bdb78b30a90bd8e24d9a69befa72bf85a17adb7e84fe6d7092ef9    //google
sui client call --function mint --module singmincoin --package 0x65b40bbac41f161e9049be55fb4f7d2f12cc82fa049433565f366623af9ebaba --args 0x39a1e4eb2a01dbbad663b72a4d8c993947256df91922de6993f2392482a765a1 100 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

<!-- 给UVD转账的 D5aGLmUJK5ZrvsbTr39ern2Rw78yYiPAUQXuuf8GpwUD -->
<!-- 给singmingoogle的 -->