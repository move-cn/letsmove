module obj::struct_code {

    use sui::tx_context::TxContext;

    public struct Person{
        age:u8,
        gender:u8,
        height:u16
    }

    public  struct Person2{
        age:u8,
        gender:u8,
        height:u16
    }

    public struct Dog {
        age:u8,
        gender:u8,
    }


   public struct Color{
        red:u8,
        green:u8,
        blue:u8
    }

    public fun delete_color(color:Color){
        let Color{ red,green,blue} = color;
    }

    public fun delete_dog(dog:Dog){
        let Dog{age,gender} = dog;

        let _age = age;
        let _gender = gender;
    }

    fun init(_ctx: &mut TxContext) {
        let color = Color{
            red:1,
            green:2,
            blue:3
        };


        let dog = Dog{
            age:1,
            gender:0,
        };

        delete_dog(dog);

        delete_color(color);
    }

}
