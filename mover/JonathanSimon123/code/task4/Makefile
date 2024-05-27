#Makefile
export PACKAGE_ID=0xf0eeb7971ea706b7b5877b591be081e7cda08d11649b02bc05c19fab8b8cb158
export TREASURY_CAP=0x2::package::UpgradeCap
export OWNER=0x90755c93d459d98352906117443f179ebe27bec4e9d1baf9a6b7ff45b67963c3



call-play:
	sui client call --package ${PACKAGE_ID} --module DiceGame --function play --args 6 --gas-budget 10000000
