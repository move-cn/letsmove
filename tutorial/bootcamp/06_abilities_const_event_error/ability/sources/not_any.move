module ability::not_any {

    public struct NotAny {
        age:u8
    }


    fun init(_:&mut TxContext){

        let  not = NotAny{
            age:10
        };
       delete(not);
        //let NotAny{age} = not;
    }



    public fun delete(not:NotAny){
        let NotAny{age} = not;
        let _ = age;
    }


}
