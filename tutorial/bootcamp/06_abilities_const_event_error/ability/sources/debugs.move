module ability::debugs {

    use std::debug::print;

    public struct People has drop{
        age:u8,
    }

    fun init(ctx: &mut TxContext) {


    }

    #[test]
    fun test_a (){
        let p = People{
        age:10,
        };
        print(&p);

        let int10: u32 = 10;
        print(&int10);
    }

}
