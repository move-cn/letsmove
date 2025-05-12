my_address="0x6e6c6885e780bbfd7c81b6b3849b45881305e3ecd08340a32fef3b5f3a619be7"

zeros_swap_package_id="0xe1baec3e1ecb8b21bdfe02d4769bd23cd4f318d1393a7ff787a2dadda8e1e540"
global_id="0x4d9fb8de63cc65f6c6f8f1d7e9041f0ab49ad1f665369c3d08bd07a4b3656f72"

type_x="0x7952b17ed79ad43f3f2e23176ed60a0a3e3ccb78ff8324e231a887a45b048b97::zeros::ZEROS"
type_y="0x7952b17ed79ad43f3f2e23176ed60a0a3e3ccb78ff8324e231a887a45b048b97::zeros_faucet::ZEROS_FAUCET"

# echo $type_x

# # mint coin
# sui client call --package 0x2 \
#   --module coin \
#   --function mint_and_transfer \
#   --type-args $type_x \
#    --args   0x994f3319b57f5d52c8ebeb81be234d17ac41536f90a5a00894ff0243c4b8f959 10000000000 $my_address

coin_x_id1="0x21db1cec548941c35d21773cac2268f550f758c4b1fb7ec7ca389a65c1b54056"

# # faucet
# sui client call --package 0x2 \
#   --module coin \
#   --function mint_and_transfer \
#   --type-args $type_y \
#    --args   0x69574780199b9abe16c61a05e0a2ce777909ef21ff04cf76acca8efbefbeb46f 100000000000 $my_address
coin_y_id1="0x7483f13baba777fef1d24fc6b8b45227a8633abab73796d776a07979e65de5a5"


# # create_pool<X, Y>(global: &mut Global, lp_fee: u64, ctx: &mut TxContext)
# sui client call --package $zeros_swap_package_id \
#   --module swap \
#   --function create_pool \
#   --type-args $type_x $type_y \
#    --args $global_id 1000


pool_id="0x480b6e50e3a64c2822ed12168826ef501d600b03a5c47cd3fca9d18b96e31ff7"

# 10,000 ZEROS +100,000 ZEROS_F
# coin_x_amount=10000_000000
# coin_x_min=10000_000000 - 100_000000
# coin_y_amount=100000_000000
# coin_y_min=100000_000000 - 1000_000000
coin_x_amount=10000000000
coin_x_min=$((10000000000 - 100000000))
coin_y_amount=100000000000
coin_y_min=$((100000000000 - 1000000000))

# #add_liquidity<X, Y>(
#     # pool: &mut Pool<X, Y>,
#     # coin_x: vector<Coin<X>>,
#     # coin_y: vector<Coin<Y>>,
#     # coin_x_amount: u64,
#     # coin_x_min: u64,
#     # coin_y_amount: u64,
#     # coin_y_min: u64,
#     # ctx: &mut TxContext)
# sui client call --package $zeros_swap_package_id \
#   --module swap \
#   --function add_liquidity \
#   --type-args $type_x $type_y \
#    --args $pool_id "[$coin_x_id1]" "[$coin_y_id1]" $coin_x_amount $coin_x_min $coin_y_amount $coin_y_min

# coin_x_id2="0x68079b8365c8822486986e1c33b6ab648eb07eaacb5eb46377ca27d2086dd58f"
# coin_x_id3="0xf823c7b3c9227d9ce6fce29500aa47e6f350aa87c6c03f5a9d27de94cf01e78c"
# in_amount=100000000
# min_out=900000000
# # swap_x_to_y<CoinIn, CoinOut>(pool: &mut Pool<CoinIn, CoinOut>, in: vector<Coin<CoinIn>>, in_amount: u64, min_out: u64, ctx: &mut TxContext)
# sui client call --package $zeros_swap_package_id \
#   --module swap \
#   --function swap_x_to_y \
#   --type-args $type_x $type_y \
#    --args $pool_id "[$coin_x_id2, $coin_x_id3]" $in_amount $min_out


coin_y_id2="0x2548b5d008d7ddefccd4b7d7a6a0b74e81521d9988553f8dc3fc101fcd7f3463"
coin_y_id3="0x2f7f4171167cf9403620014dd8d6eac24e7565c465a2d913b628bb95967afbe3"
in_amount=600000000
min_out=50000000
# swap_y_to_x<CoinIn, CoinOut>(pool: &mut Pool<CoinOut, CoinIn>, in: vector<Coin<CoinIn>>, in_amount: u64, min_out: u64, ctx: &mut TxContext)
sui client call --package $zeros_swap_package_id \
  --module swap \
  --function swap_y_to_x \
  --type-args $type_y $type_x \
   --args $pool_id "[$coin_y_id2, $coin_y_id3]" $in_amount $min_out


