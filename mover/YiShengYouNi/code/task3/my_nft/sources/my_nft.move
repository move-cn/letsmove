module my_nft::my_nft;

use std::string::{String, utf8};
use sui::transfer::public_transfer;
use sui::tx_context::sender;
use sui::package;
use sui::display;

/// Define the NFT struct
public struct MyNFT has key, store {
  id: UID,
  nft_id: u64,
  name: String,
  image_url: String,
  creator: address, // 创造者
  recipient: address, // 拥有者
}
/// define OTW
public struct MY_NFT has drop {}

/// Define the init function
fun init(otw: MY_NFT, ctx: &mut TxContext) {
  
  let keys = vector[
      utf8(b"name"),
      utf8(b"image_url"),
      utf8(b"creator"),
    ];
    let values = vector[
      utf8(b"{name} #{nft_id}"),
      utf8(b"{image_url}"),
      utf8(b"{creator}"),
    ];

    let publisher = package::claim(otw, ctx);
    let mut display = display::new_with_fields<MyNFT>(&publisher, keys, values, ctx);

    display::update_version(&mut display);

    public_transfer(publisher, ctx.sender());
    public_transfer(display, ctx.sender());
}

public entry fun mint(name: String, nft_id: u64, image_url:String, recipient: address, ctx: &mut TxContext) {

  let nft = MyNFT {
      id: object::new(ctx),
      nft_id,
      name,
      image_url,
      creator: ctx.sender(),
      recipient,
    };

    public_transfer(nft, recipient);

}

/*
要求： mint 一个 nft 发送到地址: `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

export PACKAGE="0x078f380879c1f335880ee39457f078e987eccc41ab59d61f26ef50433e50b30d"
export MODULE="my_nft"
export RECIPIENT="0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2"
sui client call --package $PACKAGE --module $MODULE --function mint --args "Github NFT" 2 "https://avatars.githubusercontent.com/u/16838172" $RECIPIENT
*/
