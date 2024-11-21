module move_castle::utils {
    use sui::hash;
    use std::string::{ Self,String };

    public(package) fun generate_castle_serial_number(size: u64, id: &UID): u64 {

        let mut hash = hash::keccak256(&object::uid_to_bytes(id));
        let mut result_num:u64 = 0;

        while (vector::length(&hash)>0){
            let element:u8 = vector::remove(&mut hash,0);
            result_num = ((result_num <<8) | (element as u64));

        };

        result_num = result_num % 100000u64;
        size * 100000u64 + result_num
    }

    public(package) fun serial_number_to_image_id(serial_number:u64):String{
        let id = serial_number / 10 % 10000u64;
        u64_to_string(id,4)
    }
    public(package) fun u64_to_string( n: u64,fixed_length:u64):String{
        let mut result:vector<u8> = vector::empty<u8>();
        let mut m = n;
        if (m == 0){
            vector::push_back(&mut result,48);
        }else{
            while (m > 0){
                let digit = ((n % 10) as u8) + 48;
                vector::push_back(&mut result,digit);
                m = m /10;
            };

            while (vector::length(&result) < fixed_length){
                vector::push_back(&mut result,48);
            };

            vector::reverse<u8>(&mut result);
        };

        string::utf8(result)
    }

}