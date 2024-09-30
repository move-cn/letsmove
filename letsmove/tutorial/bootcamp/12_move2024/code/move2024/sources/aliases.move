module move2024::aliases {

    use std::string::String;
    use std::ascii;

    // // Allows calling `.to_string()` to convert an `ascii::String` into as `string::String`
    // public use fun std::string::from_ascii as String.to_string;
    //
    fun aliases() {
        let ascii_str = ascii::string(b"uvd");
        let abc: String =  ascii_str.to_string();
    }



}
