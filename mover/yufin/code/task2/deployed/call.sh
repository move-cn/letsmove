sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0xf66e365f9f900eeb6ba09bc71a7bafb854cd864455050eb9829a5308bc92bc4a::mycoin::MYCOIN \
--args 0xedf277a00b6c8c9204a4b4c5c1057fecd463d304d7d5223353d87ef85fe8ee5f 10000000000 0x35728af3acdf166c1adf4c756a84a830b9557588cb010d081e3857c53fcc1df7


#0x2::coin::TreasuryCap<0xf66e365f9f900eeb6ba09bc71a7bafb854cd864455050eb9829a5308bc92bc4a::mycoin::MYCOIN>


# 0x115adc3cce5ec094078e6a17c65336a2780a0ec579042f11aeda3f5a8d3b8d3d::mycoin::MYCOIN  /treasuryCap pkgId 0x1e56a66eaa1689ae9df96448bde288a35da907d0708d23468b6632b8faf9f287
# 0x115adc3cce5ec094078e6a17c65336a2780a0ec579042f11aeda3f5a8d3b8d3d::faucet::FAUCET  /treasuryCap pkgId 0x1d7613be77a2f2959bac0313b4f10e8af7ac79784c948f43250431c7705ab2b8
sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0x115adc3cce5ec094078e6a17c65336a2780a0ec579042f11aeda3f5a8d3b8d3d::mycoin::MYCOIN \
--args 0x1e56a66eaa1689ae9df96448bde288a35da907d0708d23468b6632b8faf9f287 10000000000 0x35728af3acdf166c1adf4c756a84a830b9557588cb010d081e3857c53fcc1df7

sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0x115adc3cce5ec094078e6a17c65336a2780a0ec579042f11aeda3f5a8d3b8d3d::faucet::FAUCET \
--args 0x1d7613be77a2f2959bac0313b4f10e8af7ac79784c948f43250431c7705ab2b8 100000000 0x35728af3acdf166c1adf4c756a84a830b9557588cb010d081e3857c53fcc1df7



# mainnet
sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0xe31a18ace543a8d317824b15718a54cf0477e5c93bcedb2f4c5d877dedc16a18::mycoin::MYCOIN \
--args 0xb17e46efb97b496d3d97a8f91cbf90d97e5600a4cd3ffc14c6ce03829832275f 10000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0xe31a18ace543a8d317824b15718a54cf0477e5c93bcedb2f4c5d877dedc16a18::faucet::FAUCET \
--args 0x27f568ea398fb03090762d97295d7165eb5f34d4ad4e13507c9841218ba25206 100000000 0x35728af3acdf166c1adf4c756a84a830b9557588cb010d081e3857c53fcc1df7

sui client call --package 0x2 \
--module coin \
--function mint_and_transfer \
--type-args 0xe31a18ace543a8d317824b15718a54cf0477e5c93bcedb2f4c5d877dedc16a18::faucet::FAUCET \
--args 0x27f568ea398fb03090762d97295d7165eb5f34d4ad4e13507c9841218ba25206 100000000 0xdf572b1ffb53dc559c39a8c18b1c6622d77fa10850adcd5b2bb495f0e7665796
