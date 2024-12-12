/// Module: task1
module task1::Hallo {

    use std::ascii::{String, string};
    use sui::transfer::transfer;

    public struct Hallo has key {
        id: UID,
        name: String
    }

    public entry fun hallo(ctx: &mut TxContext) {
        let hallo = Hallo {
            id: object::new(ctx),
            name: string(b"MeepoTu")
        };

        transfer(hallo, ctx.sender())
    }

    public entry fun name(hallo: &Hallo): String {
        hallo.name
    }

}
