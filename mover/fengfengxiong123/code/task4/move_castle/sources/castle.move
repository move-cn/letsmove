module move_castle::castle {
    use move_castle::utils;
    use sui::package;
    use std::string::{Self, String, utf8};
    use move_castle::core::GameStore;
    use sui::display;

    public struct CASTLE has drop {}

    fun init(otw: CASTLE, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"link"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"project_url"),
            utf8(b"creator"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"https://movecastle.info/castles/{serial_number}"),
            utf8(b"https://images.movecastle.info/static/media/castles/{image_id}.png"),
            utf8(b"{description}"),
            utf8(b"https://movecastle.info"),
            utf8(b"Castle Builder"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<Castle>(&publisher, keys, values, ctx);
        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    public struct Castle has key, store {
        id: UID,
        name: String,
        description: String,
        serial_number: u64,
        image_id: String,
    }


    entry fun build_castle(size: u64, name_bytes: vector<u8>, desc_bytes: vector<u8>, ctx: &mut TxContext) {
        let obj_id = object::new(ctx);
        let serial_number = utils::generate_castle_serial_number(size, &obj_id);
        let image_id = utils::serial_number_to_image_id(serial_number);

        let castle = Castle {
            id: obj_id,
            name: string::utf8(name_bytes),
            description: string::utf8(desc_bytes),
            serial_number,
            image_id,
        };
        let owner = tx_context::sender(ctx);
        transfer::public_transfer(castle, owner);
    }

    #[allow(lint(custom_state_change))]
    entry fun transfer_castle(castle: Castle, to: address) {
        transfer::transfer(castle, to);
    }

    public(package) fun init_castle_data(
        id: ID,
        size: u64,
        race: u64,
        current_timestamp: u64,
        game_store: &mut GameStore
    ) {
        //
    }
}