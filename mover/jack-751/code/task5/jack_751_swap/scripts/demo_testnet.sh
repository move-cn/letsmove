#!/bin/bash

# Example usage of jack_751_swap

# Set environment variables
PACKAGE_ID="0x2f9cae065aac8fd27ded487bf90828db05152a1dc960933dc4868deb19e99841" # Will be filled after deployment
POOL_ID="0x4746c053e8520bc66adbb2a7f1391ad5915bff856b5089f9b3045a864180d28f"    # Will be filled after deployment
JACK_751_COIN_ID="0x7bbc41c54bc06a9bcb5cbb4f253144187c1818d70ada95976515e3a00946fb6a"
FAUCET_COIN_ID="0x2eef78abb5b3f89852f794a05959c635a28383748f361ef25e7a7f61fa31cfb1"

echo "Jack 751 Swap Contract Usage Examples"
echo "===================================="

if [ -z "$PACKAGE_ID" ]; then
    echo "Please set PACKAGE_ID first by running deploy.sh"
    exit 1
fi

echo "1. Add liquidity to the pool:"
echo "sui client call --package $PACKAGE_ID --module jack_751_swap --function add_liquidity \\"
echo "    --args $POOL_ID $JACK_751_COIN_ID $FAUCET_COIN_ID \\"
echo "    --gas-budget 10000000"
echo

echo "2. Swap JACK_751 to JACK_751_FAUCET_COIN:"
echo "sui client call --package $PACKAGE_ID --module jack_751_swap --function swap_jack_751_to_faucet \\"
echo "    --args $POOL_ID $JACK_751_COIN_ID \\"
echo "    --gas-budget 10000000"
echo

echo "3. Swap JACK_751_FAUCET_COIN to JACK_751:"
echo "sui client call --package $PACKAGE_ID --module jack_751_swap --function swap_faucet_to_jack_751 \\"
echo "    --args $POOL_ID $FAUCET_COIN_ID \\"
echo "    --gas-budget 10000000"
echo

echo "4. Get pool information:"
echo "sui client call --package $PACKAGE_ID --module jack_751_swap --function get_pool_info \\"
echo "    --args $POOL_ID \\"
echo "    --gas-budget 1000000"
echo

echo "5. Calculate swap output:"
echo "sui client call --package $PACKAGE_ID --module jack_751_swap --function calculate_swap_output \\"
echo "    --args $POOL_ID 100 true \\"
echo "    --gas-budget 1000000"
