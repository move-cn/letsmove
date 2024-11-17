module move2024::vec {

    fun play_vec() {
        let v = vector[1,2,3,4];
        let first = &v[0];         // 调用 vector::borrow(v, 0)
        let first_copy = v[0];     // 调用 *vector::borrow(v, 0)
    }



    // 支持借用操作符的类型有：
    //
    // vector
    // sui::vec_map::VecMap
    // sui::table::Table
    // sui::bag::Bag
    // sui::object_table::ObjectTable
    // sui::object_bag::ObjectBag
    // sui::linked_table::LinkedTable
    // 要为自定义类型实现借用操作符，需要在方法上添加 #[syntax(index)] 属性。
    //
    //
    // #[syntax(index)]
    // public fun borrow(c: &List<T>, key: String): &T { /* ... */ }
    //
    // #[syntax(index)]
    // public fun borrow_mut(c: &mut List<T>, key: String): &mut T { /* ... */ }
}
