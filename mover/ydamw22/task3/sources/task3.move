module task3::task3 {
  use std::string::String;
  use sui::package;
  use sui::display;

  public struct My_Avatar_NFT has key, store {
    id: UID,
    name: String,
    image_url: String,
  }

  // 一次性见证者的名字 必须和包名一样
  public struct TASK3 has drop {}

  fun init(otw: TASK3, ctx: &mut TxContext) {
    let keys = vector[
      b"name".to_string(),
      b"image_url".to_string(),
      b"description".to_string(),
      b"creator".to_string(),
    ];

    let values = vector[
      b"{name}".to_string(),
      b"{image_url}".to_string(),
      b"a NFT of github avatar".to_string(),
      ctx.sender().to_string(),
    ];

    let publisher = package::claim(otw, ctx);

    let mut display = display::new_with_fields<My_Avatar_NFT>(
      &publisher, keys, values, ctx
    );

    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
  }

  public fun mint_and_transfer(name: String, image_url: String, recipient: address, ctx: &mut TxContext) {
    let nft = My_Avatar_NFT {
      id: object::new(ctx),
      name,
      image_url,
    };

    transfer::public_transfer(nft, recipient);
  }
}