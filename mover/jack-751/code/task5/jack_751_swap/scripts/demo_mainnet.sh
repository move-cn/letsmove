#!/bin/bash

# Example usage of jack_751_swap

# Set environment variables
PACKAGE_ID="0xbbf6c6cd8f406df6223a9c995b970b258b2ada161bf331c0d9dfd88491adf364" # Will be filled after deployment
POOL_ID="0xfae87a1be6110761094a5c1f3db3b7df4613b98a0f884f4699723155f69d48a0"    # Will be filled after deployment
JACK_751_COIN_ID="0xa32b5b4f3d0757848079330450feccc046a4fa2b0e291c9cf95f3af2dce1bba2"
# 
FAUCET_COIN_ID="0x7c9b02e39e0b78a49ffc884bd63dc188ac641364db0561bd903a66dcfafae36a"
# 

echo "J#ack 751 Swap Contract Usage Examples"
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
