# Prerequisite
I have two addresses:
1. Wallet Address: `0x5386d422ca6ea07e92f39c2293a2af009a2bd59682df4fdd1981e97b40ed8a54` — This is used to receive rewards and was created via the UI.
2. Local Address (Alias: `flamboyant-hematite`): Used primarily for deployment and execution tasks.

After completing Task 1, rewards were received at the wallet address. Now, to deploy Task 2 to the `mainnet`, I need to transfer coins from my wallet address to my `flamboyant-hematite` address. To do this, simply use the UI: navigate to the sending options and click the 'Send' button.

# Deployment
Before deploying the project, ensure you switch to the appropriate address and environment. Additionally, remember to add sufficient gas to the environment to facilitate the deployment process.

1. Use the `mover/liushuyu6666/code/task2/cli/publish.sh` tool to publish the package.
2. Get the `package id` and `treasury_cap id`.
3. Run the `mover/liushuyu6666/code/task2/cli/mint.sh` tool to transfer coins.
