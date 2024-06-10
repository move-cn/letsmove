## 終端機操作紀錄與回顯

步驟：
1. 調用 `sui client object` 查看 `FlagString` 物件
2. 取得 ASCII 編碼的 `str` 欄位值, 轉換為字符串
3. 將字符串作為第一個參數傳入 `get_flag` 函數中, 取得 `flag` 
    - Transaction Digest: `vNACMAgumoqKT6sx1ZFY5AoS3qKaCPQGyJXjQLKbgNw`
    - EventID: `vNACMAgumoqKT6sx1ZFY5AoS3qKaCPQGyJXjQLKbgNw:0`

```bash
(base) harperdelaviga@HarperMBP14 ~ % sui client object 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56
╭───────────────┬──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ objectId      │  0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56                                                  │
│ version       │  48024466                                                                                                            │
│ digest        │  G7LgogwM4V97XZ2SGEYUBVYGdjT6A5tAQQbSzojeUJWs                                                                        │
│ objType       │  0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd::check_in::FlagString                            │
│ owner         │ ╭────────┬─────────────────────────────────────────╮                                                                 │
│               │ │ Shared │ ╭────────────────────────┬────────────╮ │                                                                 │
│               │ │        │ │ initial_shared_version │  12674957  │ │                                                                 │
│               │ │        │ ╰────────────────────────┴────────────╯ │                                                                 │
│               │ ╰────────┴─────────────────────────────────────────╯                                                                 │
│ prevTx        │  4nptf2AX1nqHcyM51WB1wm3DqMQA6EC52A2vtdAvH9Pq                                                                        │
│ storageRebate │  1535200                                                                                                             │
│ content       │ ╭───────────────────┬──────────────────────────────────────────────────────────────────────────────────────────────╮ │
│               │ │ dataType          │  moveObject                                                                                  │ │
│               │ │ type              │  0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd::check_in::FlagString    │ │
│               │ │ hasPublicTransfer │  false                                                                                       │ │
│               │ │ fields            │ ╭──────────┬───────────────────────────────────────────────────────────────────────────────╮ │ │
│               │ │                   │ │ id       │ ╭────┬──────────────────────────────────────────────────────────────────────╮ │ │ │
│               │ │                   │ │          │ │ id │  0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56  │ │ │ │
│               │ │                   │ │          │ ╰────┴──────────────────────────────────────────────────────────────────────╯ │ │ │
│               │ │                   │ │ str      │ ╭───────╮                                                                     │ │ │
│               │ │                   │ │          │ │  120  │                                                                     │ │ │
│               │ │                   │ │          │ │  59   │                                                                     │ │ │
│               │ │                   │ │          │ │  61   │                                                                     │ │ │
│               │ │                   │ │          │ │  59   │                                                                     │ │ │
│               │ │                   │ │          │ │  56   │                                                                     │ │ │
│               │ │                   │ │          │ │  78   │                                                                     │ │ │
│               │ │                   │ │          │ │  85   │                                                                     │ │ │
│               │ │                   │ │          │ │  122  │                                                                     │ │ │
│               │ │                   │ │          │ │  73   │                                                                     │ │ │
│               │ │                   │ │          │ │  81   │                                                                     │ │ │
│               │ │                   │ │          │ │  124  │                                                                     │ │ │
│               │ │                   │ │          │ │  79   │                                                                     │ │ │
│               │ │                   │ │          │ │  71   │                                                                     │ │ │
│               │ │                   │ │          │ │  63   │                                                                     │ │ │
│               │ │                   │ │          │ │  110  │                                                                     │ │ │
│               │ │                   │ │          │ │  85   │                                                                     │ │ │
│               │ │                   │ │          │ │  106  │                                                                     │ │ │
│               │ │                   │ │          │ │  48   │                                                                     │ │ │
│               │ │                   │ │          │ ╰───────╯                                                                     │ │ │
│               │ │                   │ │ ture_num │  17                                                                           │ │ │
│               │ │                   │ ╰──────────┴───────────────────────────────────────────────────────────────────────────────╯ │ │
│               │ ╰───────────────────┴──────────────────────────────────────────────────────────────────────────────────────────────╯ │
╰───────────────┴──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
(base) harperdelaviga@HarperMBP14 ~ % sui client call --package 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd --module check_in --function get_flag --args 'x;=;8NUzIQ|OG?nUj0' 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56 0x8
Transaction Digest: vNACMAgumoqKT6sx1ZFY5AoS3qKaCPQGyJXjQLKbgNw
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                      │
│ Gas Owner: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                   │
│ Gas Budget: 3018552 MIST                                                                        │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xb398e34ad570a6db45a5544de80bf9e84a460752683562be043b16749b3a8801                       │
│  │ Version: 48024466                                                                            │
│  │ Digest: DGg2zGczcmdCRahvukmJ8W1pzAfUStbCDXta1bhhCNMz                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "x;=;8NUzIQ|OG?nUj0"                                 │ │
│ │ 1   Shared Object    ID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56 │ │
│ │ 2   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000008 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  get_flag                                                           │            │
│ │  │ Module:    check_in                                                           │            │
│ │  │ Package:   0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    ULiD5Hw+0cGhi7AeM+KZ/hptbbKtRoCM8v6cCq45g8ZrDd+V0zVejMI6rbb2r8CR6JkxOT5CSSoszO7qFaoWAg==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: vNACMAgumoqKT6sx1ZFY5AoS3qKaCPQGyJXjQLKbgNw                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 395                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 48024467                                                                              │
│  │ Digest: 55aWvkkeKujeHawixi6kx4re2VDNBwQj6x9aVcJBCLjK                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb398e34ad570a6db45a5544de80bf9e84a460752683562be043b16749b3a8801                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 48024467                                                                              │
│  │ Digest: ErEJ39jRRXbUP6ChcpeTCykVjvotCz57QGo8D9Y1w7wE                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56                         │
│  │ Version: 48024466                                                                              │
│  │ Digest: G7LgogwM4V97XZ2SGEYUBVYGdjT6A5tAQQbSzojeUJWs                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000008                         │
│  │ Version: 45397457                                                                              │
│  │ Digest: 2Eu9Q2PeoQKSAvgRXXYyEKNyYewpEFzHopKQpqdXF4QY                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb398e34ad570a6db45a5544de80bf9e84a460752683562be043b16749b3a8801                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 48024467                                                                              │
│  │ Digest: ErEJ39jRRXbUP6ChcpeTCykVjvotCz57QGo8D9Y1w7wE                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2530800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2497968 MIST                                                                   │
│    Non-refundable Storage Fee: 25232 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    A2nfTVSF6WPibJXMCR2HWNKDSaGs3nsmpkiW6rG56Ut                                                    │
│    4nptf2AX1nqHcyM51WB1wm3DqMQA6EC52A2vtdAvH9Pq                                                   │
│    GvtDcAEMFwzCSEPUqkaPGxD4CpKyD7DDfhLrnU8KuMBR                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                             │
│  │ EventID: vNACMAgumoqKT6sx1ZFY5AoS3qKaCPQGyJXjQLKbgNw:0                                        │
│  │ PackageID: 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd                 │
│  │ Transaction Module: check_in                                                                  │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                    │
│  │ EventType: 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd::check_in::Flag │
│  │ ParsedJSON:                                                                                   │
│  │   ┌────────┬────────────────────────────────────────────────────────────────────┐             │
│  │   │ flag   │ true                                                               │             │
│  │   ├────────┼────────────────────────────────────────────────────────────────────┤             │
│  │   │ sender │ 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb │             │
│  │   └────────┴────────────────────────────────────────────────────────────────────┘             │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                         │
│  ┌──                                                                                                     │
│  │ ObjectID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56                          │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                            │
│  │ Owner: Shared                                                                                         │
│  │ ObjectType: 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd::check_in::FlagString  │
│  │ Version: 48024467                                                                                     │
│  │ Digest: 55aWvkkeKujeHawixi6kx4re2VDNBwQj6x9aVcJBCLjK                                                  │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ ObjectID: 0xb398e34ad570a6db45a5544de80bf9e84a460752683562be043b16749b3a8801                          │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                            │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                            │
│  │ Version: 48024467                                                                                     │
│  │ Digest: ErEJ39jRRXbUP6ChcpeTCykVjvotCz57QGo8D9Y1w7wE                                                  │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1032832                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```