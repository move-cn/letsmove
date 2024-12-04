
sui client publish

export PackageID=0xdc26d4bb1c3e67ce33af2eee2265d5899ebdecc15c299df2a6d198559f280536
export FaucetId=0x2dbd6e3eddfd792695e9da3beb1519f09cd8f3671fc2159a25eaf3210a73fe5f::yaominglong001_faucet_coin::YAOMINGLONG001_FAUCET_COIN

sui client call --package $PackageID --module yaominglong001_game --function creat_game --type-args $FaucetId

export GameId=0x8a2099092215be778df9b8185c5152baa5adb75fe4afe23f4930579778319d87          

export AdminCap=0x93bd2aa900ad2e08943d3abb7aac690e1ef6a980508bee7c0faa72e9068c5aa3      

export MyAddress=0xad6ae9a90e742c884906f852b63944606815bc324899b31c2f626f8b3f2d1a43 

export Task2Pack=0x2dbd6e3eddfd792695e9da3beb1519f09cd8f3671fc2159a25eaf3210a73fe5f

export TreasureId=0xbfe0861e4dfff7b57abfac202bc75c5f7fd4a7d37358dffed560d84b47a42cf0    

sui client call --package $Task2Pack  --module yaominglong001_faucet_coin --function mint --args $TreasureId 1000000 $MyAddress

export FaucetCoin=0x4e3ee1f19a9fef7af9351d167a8f00c0b991d939b5995a5416590933cd4baf22  

sui client call --package $PackageID --module yaominglong001_game --function deposit  --type-args $FaucetId --args $GameId $FaucetCoin 500000

[warn] Client/Server api version mismatch, client api version : 1.25.1, server api version : 1.25.2
Transaction Digest: C7n74CAWKotuxU3tXukBf2WBfyewbqBPt2nCtFQkU12E

export GameCoin=0xe7f0b1b2b4780f7ad6be0a6a48c40d06e1d84103a1a9b73d4a756f972de7f0c6     

sui client call --package $PackageID --module yaominglong001_game --function play --type-args $FaucetId --args $GameId $GameCoin

Transaction Digest: 7QECNN9oPWoVkwSXoBBx6vQqW8BnPpW374mz8J3tHGrH

sui client call --package $PackageID --module yaominglong001_game --function withdraw --type-args $FaucetId --args $AdminCap $GameId 2000

[warn] Client/Server api version mismatch, client api version : 1.25.1, server api version : 1.25.2
Transaction Digest: 3fCzmzUpQnKZxUgeNLT5TQT8vVNVR7fqXJzQZtQGtdfi