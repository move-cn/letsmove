module ability::only_drop {


    public struct OnlyDrop has drop{
        num:u8
    }


    fun init(ctx:&mut TxContext){

        let  only = OnlyDrop{
            num: 10
        };

      //  let _= only;

    }


}
