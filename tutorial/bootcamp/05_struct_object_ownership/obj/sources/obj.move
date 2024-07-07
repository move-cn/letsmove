module obj::obj {
    use std::vector;
    use sui::object;
    use sui::object::UID;
    use sui::transfer::{transfer, share_object, freeze_object};
    use sui::tx_context::sender;


    public struct Person {
        age: u8,
        gender: u8,
        height: u16
    }

    public struct PersonObject has key {
        id: UID,
        age: u8,
        gender: u8,
        height: u16
    }


    public struct People has key {
        id: UID,
        gender: u8,
    }


    public struct House has key {
        id: UID,
        age: u8,
        onwer_address: vector<address>
    }


    public struct Dog has key {
        id: UID,
        age: u8,
    }


    fun aaa(ctx: &mut TxContext){

    }



    /// dog 检查所有权
    /// dog 张三拥有   张三来调用 不会报错     ,  李四 来调用 方法
    public entry fun use_dog(dog: Dog, _ctx: &mut TxContext){
        // 把对象的所有权交给了这个函数

       // 1    transfer(dog, @0x3333);


        // 2    delete(dog, @0x3333);


       // transfer(dog, @0x3333)
         transfer(dog, @0x3333);

    }


    public entry fun use_dog2(dog: &Dog, _ctx: &mut TxContext){
        // 不涉及所有权 所以没法内部改变所有权
        let _age = dog.age;
    }

    public entry fun use_dog3(dog: &mut Dog, _ctx: &mut TxContext){
        // 不涉及所有权 所以没法内部改变所有权

        let _age = dog.age;

        dog.age = 111;


    }



    /// 共享所有权 检查所有权
    public entry fun use_house( house: &House, ctx: &mut TxContext){
        //
        // let adress = sender(ctx);
        // let flag = vector::contains(&house.onwer_address ,&adress );

    }



    fun init(ctx: &mut TxContext) {

        let dog = Dog {
            id: object::new(ctx),
            age: 10,
        };


        // 独享所有权 被地址持有
        let dog11 = Dog{
            id: object::new(ctx),
            age: 11,
        };

        let adddress_my = sender(ctx);
        transfer(dog11, adddress_my);



        let mut addresses:vector<address> = vector[];
        vector::push_back(&mut addresses, @0x33);
        vector::push_back(&mut addresses, @0x33);

        // 共享所有权 被全部的地址持有
        let house = House{
            id: object::new(ctx),
            age: 11,
            onwer_address:addresses,
        };

        share_object(house);


        let dog22 = Dog {
            id: object::new(ctx),
            age: 10,
        };
        // xxx


        del(dog22);





        transfer(dog, sender(ctx));


        let dog2 = Dog {
            id: object::new(ctx),
            age: 10,
        };

        share_object(dog2);


        let dog3 = Dog {
            id: object::new(ctx),
            age: 10,
        };

        freeze_object(dog3);
    }


    public fun update(dog: &mut Dog, age: u8) {
        dog.age = age
    }

    public fun dog_age(dog: &Dog): u8 {
        dog.age
    }


    public fun del(dog: Dog) {
        let Dog { id, age  } = dog;
        object::delete(id);

        let _age = age;
    }
}

