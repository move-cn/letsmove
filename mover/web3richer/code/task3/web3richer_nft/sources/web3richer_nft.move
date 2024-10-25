
/// Module: web3richer_nft
module web3richer_nft::web3richer_nft {

    use sui::coin;

    // Struct: NFT
    // A non-fungible token
    public struct NFT {
        // The owner of the NFT
        owner: address,
        // The unique identifier of the NFT
        id: u64,
        // The metadata of the NFT
        metadata: vector<u8>,
    }

    // Function: init
    // Initializes the NFT
    //
    // Parameters:
    // - witness: The witness of the NFT
    // - ctx: The transaction context
    fun init(witness: NFT, ctx: &mut TxContext) {
        // Create the NFT
        let (treasury, metadata) =
            coin::create_currency(
            witness,
            8,
            b"WRC",
            b"Web3Richer Coin",
            b"the coin for web3richer",
            option::none(),
            ctx
        );

        // Freeze the metadata
        transfer::public_freeze_object(metadata);

        // Transfer the treasury
        transfer::public_transfer(treasury, ctx.sender());
    }
}

