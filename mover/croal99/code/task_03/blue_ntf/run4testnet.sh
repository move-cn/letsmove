sui client switch --env testnet
sui client envs

sui client switch --address 0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b
sui client addresses

# 创建一个属于0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b的NTF
sui client call \
--package 0xc1d3378f795e5a693ff4e3fc727127e80b76a6e70b61dc8335d59731ea1254b8 \
--module blue_ntf \
--function mint_ntf

sui client switch --address 0x7295d0fbf1edee2d8b617a5b0d306a1e8aca84e0e94d15c912a052cf7569ff9d
sui client addresses

# 创建一个属于0x7295d0fbf1edee2d8b617a5b0d306a1e8aca84e0e94d15c912a052cf7569ff9d的NTF
sui client call \
--package 0xc1d3378f795e5a693ff4e3fc727127e80b76a6e70b61dc8335d59731ea1254b8 \
--module blue_ntf \
--function mint_ntf

# 删除刚刚创建的NTF
sui client call \
--package 0xc1d3378f795e5a693ff4e3fc727127e80b76a6e70b61dc8335d59731ea1254b8 \
--module blue_ntf \
--function burn \
--args 0x7de1456862456d4da484be96ff7a57e3a2d5472ed96fdf6ee154a5865feef8c4

sui client switch --address 0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b
sui client addresses

# 将0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b的NTF
# 转移给0x7295d0fbf1edee2d8b617a5b0d306a1e8aca84e0e94d15c912a052cf7569ff9d
sui client call \
--package 0xc1d3378f795e5a693ff4e3fc727127e80b76a6e70b61dc8335d59731ea1254b8 \
--module blue_ntf \
--function transfer \
--args 0x4ef180bb61d8e3a7ca2df5f73f1b7f04d0e4bc70ffd87b40bc2e1160cd19660d 0x7295d0fbf1edee2d8b617a5b0d306a1e8aca84e0e94d15c912a052cf7569ff9d

