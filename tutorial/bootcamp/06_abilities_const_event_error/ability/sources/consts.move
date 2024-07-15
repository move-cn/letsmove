module ability::consts {

    use std::string::String;
    use sui::object;
    use sui::object::UID;
    use sui::transfer::freeze_object;

    // 'u8', 'u16', 'u32', 'u64', 'u128', 'u256', 'bool', 'address', 'vector<_>'
    const TenNum: u32 = 10;
    const OneNum: u32 = 0x1;
    const OneBool: bool = false;
    const AddrMe: address = @0x22;
    const Str: vector<u8> = b"3123123";  // [1,2,3,4,5]


    public struct ObjConst has key {
        id: UID,
        num: u8,
    }


    fun init(ctx: &mut TxContext) {
        let obj_const = ObjConst {
            id:object::new(ctx),
            num: 1
        };
        freeze_object(obj_const);
    }
}
