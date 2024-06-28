export PackageID=0x03ae976ef1345716195c811464ea8957499fcda338211ca0e65e68a58ca7c774
export HouseCap=0x04eec7491b9f5b88b5de9fe9e1e3a21ab162e097515eddb267b70849fe7a6a20
export TreasuryCap=0xda8eb5201d7d63a8d1c0a3b67f0a14dd5097125ab5a067beeb6022e4bf75df0b

# initialize house data
sui client call --package $PackageID --module house_data --function initialize_house_data --args $HouseCap $TreasuryCap 999999999999

# start game, get house data id from last step
export HouseData=0x81391a8909ce7b13840b03ff37f5d46e54717bce2fb10181c58d408fb125c0b0
export BetsCoin=0x5579e3860b59bddde068c3d8d920239fb8fc551225d688c47212a1c76b841031
sui client call --package $PackageID --module game --function start_game --args '0x6' $BetsCoin $HouseData

# play game, get game id from last step
export GameID=0x7d8f80d9ed4405f724cd92c89ffa965ca079fc6fcdd3f2edfb150f07e4ad2329
sui client call --package $PackageID --module game --function play_game --args $GameID 3 $HouseData

