
# 存款100
sui client call --package 0x0d10347ba5c1ffd235e3f25a6a701b39f4ad2b7f4215ceea3a82f4b593ce6e99 \
--module my_game \
--function deposit \
--args 0x28e7004afeb5831d43e229bbd7d7c5129aee599a4c4373e598c5425bf81a486a 0x605fb3c36d95cadc26668c9fcd7522d4fb5649e3376f0c1f356efefa4f2afd90 0xe5f2f42c9261520e32d530b8b11ea191207e2882b7b5171f291b94c6c8a282e2





# 取款10
sui client call --package 0x0d10347ba5c1ffd235e3f25a6a701b39f4ad2b7f4215ceea3a82f4b593ce6e99 \
--module my_game \
--function withdraw \
--args 0x28e7004afeb5831d43e229bbd7d7c5129aee599a4c4373e598c5425bf81a486a 0x605fb3c36d95cadc26668c9fcd7522d4fb5649e3376f0c1f356efefa4f2afd90 1000000000


# play 2 块  (game : &mut MyGame,input : bool,pay_coin : Coin<RMB>,rand:&Random,ctx
sui client call --package 0x0d10347ba5c1ffd235e3f25a6a701b39f4ad2b7f4215ceea3a82f4b593ce6e99 \
--module my_game \
--function play \
--args 0x605fb3c36d95cadc26668c9fcd7522d4fb5649e3376f0c1f356efefa4f2afd90 true 0x66580560c144ec260e008df46e8e3a195ade4f3ecac252fbd400f0de4cf0537e 0x8

