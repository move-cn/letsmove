/// Module: task3
module task3::task3 {

    use std::string::{utf8, String};
    use sui::package;
    use sui::display;

    public struct CourseInfo has key, store {
        id: UID,
        name: String,
        image_url: String,
        time: u64
    }

    public struct TASK3 has drop {}

    fun init(w: TASK3, ctx: &mut TxContext) {
        let keys: vector<String> = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"creator"),
        ];
        let values: vector<String> = vector[
            utf8(b"best {name}"),
            utf8(b"{image_url}"),
            utf8(b"this is my NTF"),
            utf8(b"sundy"),
        ];

        //获取部署者
        let publisher: sui::package::Publisher = package::claim(w, ctx);

        let mut display: sui::display::Display<task3::task3::CourseInfo> = display::new_with_fields<CourseInfo>( &publisher, keys, values, ctx);
        //更新版本
        display::update_version(&mut display);

        //对象发送
        transfer::public_transfer(publisher, ctx.sender());
        transfer::public_transfer(display, ctx.sender());
    }

    public entry fun mint(name: String, image_url: String, time: u64, receipt: address, ctx: &mut TxContext){
        let id : sui::object::UID = object::new(ctx);
        let course: task3::task3::CourseInfo = CourseInfo{id, name, image_url, time};
        transfer::transfer(course, receipt);
    }


}
