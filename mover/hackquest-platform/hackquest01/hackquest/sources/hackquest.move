module hackquest::hackquest_module {

    use std::ascii::{String, string};

    public struct CourseInfo has key {
        id: UID,
        name: String,
    }

    fun init(ctx: &mut TxContext) {
        let suiCourse = CourseInfo {
            id: object::new(ctx),
            name: string(b"sui"),
        };

        transfer::transfer(suiCourse, ctx.sender());
    }
}
