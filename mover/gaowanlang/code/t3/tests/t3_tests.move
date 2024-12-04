#[test_only]
module t3::t3_tests {
    use sui::test_scenario::{begin, end, ctx, next_tx, take_from_sender, return_to_address};
    use t3::gaowanlang_nft::{mint_nft, transfer_nft, GaowanlangNFT, update_description, burn_nft};

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_t3() {
        let addr1 = @0xA;
        let addr2 = @0xB;
        let mut scenario1 = begin(addr1);
        let mut scenario2 = begin(addr2);
        //铸造
        {
            let name = b"Gaowan_NFT";
            let description = b"Gaowan NFT description";
            let url = b"https://avatars.githubusercontent.com/u/113753182?v=4";
            mint_nft(name, description, url, ctx(&mut scenario1));
        };

        //转移
        next_tx(&mut scenario1, addr1);
        {
            let nft = take_from_sender<GaowanlangNFT>(&scenario1);
            transfer_nft(nft, addr2, ctx(&mut scenario1));
        };

        //修改说明
        next_tx(&mut scenario2, addr2);
        {
            let mut nft = take_from_sender<GaowanlangNFT>(&scenario2);
            let description = b"Gaowan NFT description 666";
            update_description(&mut nft, description, ctx(&mut scenario2));
            return_to_address(addr2, nft);
        };

        //销毁
        next_tx(&mut scenario2, addr2);
        {
            let nft = take_from_sender<GaowanlangNFT>(&scenario2);
            burn_nft(nft, ctx(&mut scenario2))
        };

        end(scenario1);
        end(scenario2);
    }

    #[test, expected_failure(abort_code = ENotImplemented)]
    fun test_t3_fail() {
        abort ENotImplemented
    }
}