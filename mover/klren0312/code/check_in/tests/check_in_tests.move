
#[test_only]
module check_in::check_in_tests;
// uncomment this line to import the module
use check_in::check_in;
use std::debug::print;
#[test]
fun test_check_in() {
    let res2 = check_in::get_flag();
    print(&res2);
    // check_in::check_get_flag(
    //     res2, 
    //     string(b"klren0312"),
    //     string(b"0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147"),
    // );
    /**
        function hexToUint8Array(hex) {
            if (typeof hex !== 'string') {
                throw new TypeError('Input must be a string');
            }
            
            if (hex.length % 2 !== 0) {
                throw new Error('Hex string must have an even length');
            }

            const array = new Uint8Array(hex.length / 2);
            for (let i = 0; i < hex.length; i += 2) {
                array[i / 2] = parseInt(hex.substring(i, i + 2), 16);
            }

            return array;
        }
        JSON.stringify(Array.from(hexToUint8Array('acb41a9ddfa1572aa4a818ffc04e27c1c16187115128323154257e452f033700')))

    */
}
