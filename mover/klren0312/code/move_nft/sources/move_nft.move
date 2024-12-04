module move_nft::zcdc_nft {
  use std::string::{utf8, String};
  use sui::url::{Url, new_unsafe_from_bytes};
  use sui::event;
  public struct ZCDCNFT has key, store {
    id: UID,
    name: String,
    description: String,
    url: Url,
  }

  public struct ZCDCNFTMinted has copy, drop {
    object_id: ID,
    creator: address,
    name: String,
    description: String,
    url: Url,
  }

  // 创建nft到自己钱包
  public entry fun mint (
    ctx: &mut TxContext
  ) {
    let sender = tx_context::sender(ctx);
    let nft = ZCDCNFT {
      id: object::new(ctx),
      name: utf8(b"zcdc nft"),
      description: utf8(b"zcdc nft"),
      url: new_unsafe_from_bytes(b"https://aggregator.walrus-testnet.walrus.space/v1/_4ApAD7Xujmz6YxCKIdvYf-mXa0x050LqV93qTm4Q20")
    };
    event::emit(ZCDCNFTMinted {
      object_id: object::id(&nft),
      creator: sender,
      name: nft.name,
      description: nft.description,
      url: nft.url,
    });
    transfer::public_transfer(nft, sender);
  }

  // 转发nft
  public entry fun transfer (
    nft: ZCDCNFT,
    receiver: address,
    _: &mut TxContext
  ) {
    transfer::public_transfer(nft, receiver);
  }

  // 销毁nft
  public entry fun burn (
    nft: ZCDCNFT,
    _: &mut TxContext
  ) {
    let ZCDCNFT {
      id,
      name: _,
      description: _,
      url: _,
    } = nft;
    object::delete(id);
  }
}
