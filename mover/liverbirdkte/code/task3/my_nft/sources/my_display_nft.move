module my_nft::my_nft ;
use std::string;
use sui::tx_context::{sender};
use std::string::{utf8, String};


use sui::package;
use sui::display;

public struct A<T> {}

    // Finitely many types -- allowed.
    // foo<T> -> foo<T> -> foo<T> -> ... is valid
    fun foo<T>() {
        foo<T>();
    }
