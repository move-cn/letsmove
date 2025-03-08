// 是NFT，但是在 sui 区块链浏览器上显示不出图片，怀疑是没用 display 关联

module task3::old_task3 {
  use std::string;
  use sui::url::{Self, Url};

  // NTF
  public struct GitAvatarNFT has key, store {
    id: UID,
    name: string::String,
    description: string::String,
    // https://avatars.githubusercontent.com/u/30771431?v=4
    image_url: Url,
  }

  public fun name(nft: &GitAvatarNFT): &string::String {
      &nft.name
  }

  public fun description(nft: &GitAvatarNFT): &string::String {
      &nft.description
  }

  public fun url(nft: &GitAvatarNFT): &Url {
      &nft.image_url
  }

  #[allow(lint(self_transfer))]
  public fun mint(
    name: vector<u8>,
    description: vector<u8>,
    image_url: vector<u8>,
    ctx: &mut TxContext,
  ) {
    let sender = ctx.sender();
    let nft = GitAvatarNFT {
      id: object::new(ctx),
      name: string::utf8(name),
      description: string::utf8(description),
      image_url: url::new_unsafe_from_bytes(image_url),
    };

    transfer::public_transfer(nft, sender);
  }

  // 转移
  public fun transfer_nft(
    nft: GitAvatarNFT,
    recipient: address,
    _ctx: &mut TxContext,
  ) {
    transfer::public_transfer(nft, recipient);
  }

  // 更新描述
  public fun update_description(
    nft: &mut GitAvatarNFT,
    new_description: vector<u8>,
    _ctx: &mut TxContext,
  ) {
    nft.description = string::utf8(new_description)
  }

  // 销毁
  public fun burn(nft: GitAvatarNFT, _: &mut TxContext) {
    let GitAvatarNFT { id, name: _, description: _, image_url: _ } = nft;
    id.delete()
  }
}
