Move_Game:

xushizhao_coin: change package、addresses
//验证依赖
published-at = "0x9863ad57403bc1a1f412ca637964e5824bcacdb89228a500b5a09f444604b81f"
xushizhao_coin = "0x9863ad57403bc1a1f412ca637964e5824bcacdb89228a500b5a09f444604b81f"


xushizhao_game: add xushizhao_coin 
//调用git依赖
{ git = "https://github.com/xushizhao/letsmove.git", subdir = "mover/xushizhao/code/xushizhao_coin", rev = "main" }

