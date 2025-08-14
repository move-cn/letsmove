module function::function {

    use sui::transfer::{transfer, public_transfer, share_object, public_share_object};

    fun init(_:&mut TxContext){



    }


    fun a(){
    }

    public fun b(){
    }

    public(package) fun c(){}


    public entry fun d(){
    }


    public  fun f(a:u32, b:u32): bool {
         a > b
    }

    public  fun f2(a:u32, b:u32): (bool,bool){
        (a > b, a < b)
    }

}
