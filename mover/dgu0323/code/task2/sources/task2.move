module task2::task2;
use sui::coin;

fun aa(){
    coin::create_regulated_currency_v2()
}