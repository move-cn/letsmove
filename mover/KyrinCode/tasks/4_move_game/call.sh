PACKAGE_ID=0x235716a859b02f2bb7064f29944f5aca3cbd65ed836ce93a5e4277899121c038

ADMIN_CAP=0xcc63dd66d5a4fa58266f7795265b980cb30c165c840bfd93d49b73fe2339290e
GAME=0xd2c0135d546e0a4c9094b381c9dcd26fb545ad0178e0ecc5e1b8d16a91f22e3f

TREASURY_CAP=0xe082f774cc045f3a81ae8e5469a58d025a934fc69d22a22f593d9084575dd107

CLOCK=0x6

# # Get Faucet Coin
# sui client call --package $PACKAGE_ID \
#                 --module kyrincode_game \
#                 --function get_faucet_coin \
#                 --args $TREASURY_CAP 1000000000 \
#

# INPUT=0x627e8035c35043e85ef5e89573b428913326d8a4c3e9aec6ad75ed0dc7c85be1

# # Deposit
# sui client call --package $PACKAGE_ID \
#                 --module kyrincode_game \
#                 --function deposit \
#                 --args $GAME $INPUT 500000000 \
#

INPUT=0x7d1f5a1a4923fee63b252bb77d78605ed3623cfb5a1d190aca5fffefcb6ed1ba

# Play
sui client call  --package $PACKAGE_ID \
                --module kyrincode_game \
                --function play \
                --args 2 $GAME $INPUT $CLOCK \
