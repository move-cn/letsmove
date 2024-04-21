
#[test_only]
module PhigrosX_NFT::PhigrosX_nft_tests {
    // uncomment this line to import the module
    use PhigrosX_NFT::PhigrosX_nft::PHIGROSX_NFT;
    use sui::test_scenario;
    use sui::test_scenario::{ctx, next_tx, end};
    use PhigrosX_NFT::PhigrosX_nft;

    //PackageID: 0xf5f12d8f861ab63e47f6a3a75c26456047c298635936725e1051bcf56f088351
    // nftID: 0x65fdb95f1dcddb8d3de8f93f538fb2f5b74bef8c6f91cfbe6629f7299ae7f07f
    // transID: AoZi5d7wBQXD3v2vTNRsELsfERuxWuVyNjjUnHoBqZKq

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_my_nft() {
        let addrA = @0xA;
        let addrB = @0xB;
        // create the scenaro
        let mut sce = test_scenario::begin(addrA);
        {
            // call the mint function
            PhigrosX_nft::test_mint(ctx(&mut sce));
        };
        next_tx(&mut sce, addrA);
        {
            // get the nft
            let nft = test_scenario::take_from_sender<PHIGROSX_NFT>(&sce);
            // call the function
            PhigrosX_nft::test_transfer(nft, addrB, ctx(&mut sce));
        };
        // clean the sce
        test_scenario::end(sce);
    }
}

