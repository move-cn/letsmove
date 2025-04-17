# sui client call -h transfer
# public entry fun mint_and_transfer<T>(
#     c: &mut TreasuryCap<T>,
#     amount: u64,
#     recipient: address,
#     ctx: &mut TxContext,
# ) {
#     transfer::public_transfer(mint(c, amount, ctx), recipient)
# }
sui client call --package 0x2 \
    --module coin \
    --function mint_and_transfer \
    --type-args 0xa01e1513bc26c4bc087876be4e6d707fcdddbfaa197b3b8fe9304dabeefbdd61::tcoin::TCOIN \
    --args 0x83c6d492344d5160d242a26a6cb16f31697c722f0f83039d7118bfe3e5943f19 10000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 # generics parameter pass the treasury_cap type: The package id of the permissions.

# sui client call -h mint
# public fun mint<T>(cap: &mut TreasuryCap<T>, value: u64, ctx: &mut TxContext): Coin<T> {
#     Coin {
#         id: object::new(ctx),
#         balance: cap.total_supply.increase_supply(value),
#     }
# }
# Error: UnusedValueWithoutDrop.
sui client call --package 0x2 \
    --module coin \
    --function mint_and_transfer \
    --type-args 0xa01e1513bc26c4bc087876be4e6d707fcdddbfaa197b3b8fe9304dabeefbdd61::tcoin_facuet::TCOIN_FACUET \
    --args 0x0fd6c9d26c0c10e51bd23566aca064ca0131ce970d1e408771453b605e9ea6be 10000000000 0x59aa2833c9e71773c52bdd6b69a68f27592185bfe1095f2e93da3373021dd4cb # generics parameter pass parameter in mint<T>
