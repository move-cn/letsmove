module move2024::struct_pub {

   // Move 2020
   // struct Book {}

   // Move 2024
   public struct Book {
       a: u64,
   }


    public fun get_a(book:&Book):u64{
        book.a
    }


}
