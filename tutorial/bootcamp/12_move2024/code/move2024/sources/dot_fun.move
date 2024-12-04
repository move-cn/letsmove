module move2024::dot_fun {


    // 以结构体作为第一个参数的函数与结构体关联。
    // 这意味着可以使用点表示法调用函数。在与类型定义在同一模块中的方法会自动导出

    #[test_only]
    use std::debug::print;

    public struct Dog{
       age: u16
    }

    public fun set_age(dog: &mut Dog,   age:u16){
        dog.age = age
    }

    public fun get_age(dog: &Dog): u16{
        dog.age
    }





    #[test]
    fun test_set(){
        let mut dog = Dog{
            age:10
        };


        set_age(&mut dog,20);

        dog.set_age(40);


        print(&dog.get_age());


        let Dog{age:_} = dog;

    }


}
