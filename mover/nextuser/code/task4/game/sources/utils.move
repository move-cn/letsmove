module book::utils;
use std::string::{Self};
public fun log<T> (msg: vector<u8> ,t: &T){
    std::debug::print(& string::utf8(msg));
    std::debug::print(t);
}