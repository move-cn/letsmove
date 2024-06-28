module obj::obj {
    use sui::object;
    use sui::object::UID;
    use sui::transfer::{transfer, share_object, freeze_object};
    use sui::tx_context::sender;

    public struct People has key {
        id: UID,
        gender: u8,
    }


    public struct Dog has key{
        id:UID,
        age:u8,
    }


    fun init(ctx: &mut TxContext) {

        let dog = Dog{
            id:object::new(ctx),
            age: 10,
        };

        transfer(dog, sender(ctx));


        let dog2 = Dog{
            id:object::new(ctx),
            age: 10,
        };

        share_object(dog2);


        let dog3 = Dog{
            id:object::new(ctx),
            age: 10,
        };

        freeze_object(dog3);
    }


    public fun update(dog: &mut Dog,age:u8){
        dog.age = age
    }

    public fun dog_age(dog: &Dog):u8{
        dog.age
    }


    public fun del(dog: Dog){
        let Dog {id,age} = dog;
        object::delete(id);

        let _age = age;
    }
}

