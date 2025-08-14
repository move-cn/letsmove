task6:
```
@Euraxluo ➜ .../mover/euraxluo/code/task6 (main) $ npm run task6

> task6@1.0.0 task6
> ts-node task6.ts

Network Type:  mainnet
address: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3
config: {
  ProtocolPackage: '0xc6374c7da60746002bfee93014aeb607e023b2d6b25c9e55a152b826dbc8c1ce',
  StorageId: '0xbb4e2f4b6205c2e2a2db47aeb4f830796ec7c005f88537ee775986639bc442fe',
  Incentive: '0xaaf735bf83ff564e1b219a0d644de894ef5bdc4b2250b126b2a46dd002331821',
  IncentiveV2: '0xf87a8acb8b81d14307894d12595541a73f19933f88e1326d5be349c7a6f7559c',
  PriceOracle: '0x1568865ed9a0b5ec414220e8f79b3d04c77acc82358f6e5ae4635687392ffbef',
  ReserveParentId: '0xe6d4c6610b86ce7735ea754596d71d72d10c7980b5052fc3c8cdf8d09fea9b4b',
  uiGetter: '0x1ee4061d3c78d6244b5f32eb4011d081e52f5f4b484ca4a84de48b1146a779f7'
}
result: {
  digest: '65HuFk3zt3E2Ypy7cvSHcGejQycTRZe8QnKJfnF9jKDQ',
  effects: {
    messageVersion: 'v1',
    status: {
      status: 'failure',
      error: 'MoveAbort(MoveLocation { module: ModuleId { address: d899cf7d2b5db716bd2cf55599fb0d5ee38a3061e7b6bb6eebf73fa5bc4c81ca, name: Identifier("logic") }, function: 2, instruction: 72, function_name: Some("execute_borrow") }, 1600) in command 2'
    },
    executedEpoch: '379',
    gasUsed: {
      computationCost: '39750000',
      storageCost: '96330000',
      storageRebate: '95366700',
      nonRefundableStorageFee: '963300'
    },
    modifiedAtVersions: [ [Object], [Object], [Object], [Object], [Object], [Object] ],
    sharedObjects: [
      [Object], [Object],
      [Object], [Object],
      [Object], [Object],
      [Object]
    ],
    transactionDigest: '65HuFk3zt3E2Ypy7cvSHcGejQycTRZe8QnKJfnF9jKDQ',
    mutated: [ [Object], [Object], [Object], [Object], [Object], [Object] ],
    gasObject: { owner: [Object], reference: [Object] },
    dependencies: [
      '6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN',
      '8N6i9jzMa4kpad3TJgZQv323JxzcmPNqGeAMotyNPWAh',
      '9b9wP1PcLQyn4LBaWNWGWsRunYQDYj5gyxoUEcutZVkr',
      '9xN8SD1uCHDYmzWHV3R5nCrEbQSuaWRfMQTPEaXXTmCA',
      'BBir5QSG441hd5BfGTRSP7bx9sXif6hFLxji2pSBAmGb',
      'BwwvEuTvPKSpYzPGdLkDW9gmyasVBMdHfzWptZu3Yokb',
      'CYjfe1SivFcBfgkdb3KSQWjsSmjhWvtZ1m5mzNhmuDC1',
      'CfjmnhLHP5zcHRVPb714StLorN3SFXm6VNk4LKfh95bo',
      'DnYCtKAVz1dhZ6WCUQCysNF2zKAGehtZg1akc78xESk3'
    ]
  },
  confirmedLocalExecution: true
}
```


Navigators dev Round 4️⃣ :
```
@Euraxluo ➜ .../mover/euraxluo/code/task6 (main) $ npm run start

> task6@1.0.0 start
> ts-node index.ts

Network Type:  mainnet
address: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3
config: {
  ProtocolPackage: '0xc6374c7da60746002bfee93014aeb607e023b2d6b25c9e55a152b826dbc8c1ce',
  StorageId: '0xbb4e2f4b6205c2e2a2db47aeb4f830796ec7c005f88537ee775986639bc442fe',
  Incentive: '0xaaf735bf83ff564e1b219a0d644de894ef5bdc4b2250b126b2a46dd002331821',
  IncentiveV2: '0xf87a8acb8b81d14307894d12595541a73f19933f88e1326d5be349c7a6f7559c',
  PriceOracle: '0x1568865ed9a0b5ec414220e8f79b3d04c77acc82358f6e5ae4635687392ffbef',
  ReserveParentId: '0xe6d4c6610b86ce7735ea754596d71d72d10c7980b5052fc3c8cdf8d09fea9b4b',
  uiGetter: '0x1ee4061d3c78d6244b5f32eb4011d081e52f5f4b484ca4a84de48b1146a779f7'
}
result: {
  digest: 'DnYCtKAVz1dhZ6WCUQCysNF2zKAGehtZg1akc78xESk3',
  effects: {
    messageVersion: 'v1',
    status: { status: 'success' },
    executedEpoch: '379',
    gasUsed: {
      computationCost: '72750000',
      storageCost: '676445600',
      storageRebate: '416626452',
      nonRefundableStorageFee: '4208348'
    },
    modifiedAtVersions: [
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object]
    ],
    sharedObjects: [
      [Object], [Object],
      [Object], [Object],
      [Object], [Object],
      [Object]
    ],
    transactionDigest: 'DnYCtKAVz1dhZ6WCUQCysNF2zKAGehtZg1akc78xESk3',
    created: [
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object],
      ... 40 more items
    ],
    mutated: [
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object], [Object], [Object], [Object],
      [Object], [Object]
    ],
    deleted: [ [Object] ],
    gasObject: { owner: [Object], reference: [Object] },
    eventsDigest: '5mW9mFiKYstGzJKy4rn8jXBsyBKppnPPG44ePEuNvuA3',
    dependencies: [
      '2ZBqdCi1nxwWfUyLa7CWm84fGvfwTdWXa4sihYNXcdFP',
      '6ioWwDFjjVpkiZm4tpMiS9Ksio6N32J3UfxahovdrG4x',
      '6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN',
      'BBir5QSG441hd5BfGTRSP7bx9sXif6hFLxji2pSBAmGb',
      'C33qsgs2Z5drNHKtVroJdQp18TyX6q3EjcC82NfrWnqd',
      'DnewygWu1SsaF16mJC6LectDAqXQuKPuLGPYGPwctg6f',
      'FaoFHAebDjMP3htrMNDPmJF8QRAkbxHkovbV3jZb8Fhy',
      'FsYUSa4YLT4bXsB4aCS7rVSaZAsr6FTtkW57i9u6qhas',
      'HVmGy4nwFYWax8b67DssN7m81rB8tSGNeA4hfJghvmfF'
    ]
  },
  confirmedLocalExecution: true
}

```