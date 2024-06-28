module generics::generics {

    public struct Box<T> {
        value: T
    }

    public fun create_box<T>(value: T): Box<T> {
        Box<T> { value }
    }

}

