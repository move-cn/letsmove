#!/bin/bash

# Task 5: Deploy jack_751_swap contract
# This script deploys the swap contract to Sui network

echo "Building jack_751_swap contract..."
sui move build

if [ $? -eq 0 ]; then
    echo "Build successful!"
    echo "Publishing to Sui network..."
    sui client publish --gas-budget 100000000
else
    echo "Build failed!"
    exit 1
fi
