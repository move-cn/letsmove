+++
title: Task 1-2 note
date: 2024-04-14
+++

# Task 1-2 : basic knowledge of **Move**

## Permitive types
1. How to declare a variable in **Move**?  
    ```rust
    // Default declaration is immutable.
    let <variable_name>[: <type>]  = <expression>;
    // Add mut if you need a mutable variable.
    let mut <variable_name>[: <type>] = <expression>;
    ```  
2. Integer types  
    **Move** on Sui only supports 6 unsigned integer types:  
    *u8*, *u16*, *u32*, *u64*, *u128*, *u256*  

    So, how to express float and minus integer numbers in **Move** ? Here is a tip:  
    - If you want to take a float type data, you can use *a/b* instead  
    - 如果您需要负数，请考虑使用前端展现与约定的方式来表示
    
    Plus, integer types of one size can be cast to integer types of another size by using *as*: `(e as T)`.

3. Operations for integer types

    **Move** supports the following operations for integer types: 
    -  arithmetic operations for integers: addition(+), subtraction(-), multiplication(*), division(/), and remainder(%)
    - bitwise operations for integers: and(&), or(|), else(^)
    - bit shift: <<, >>
    - comparation: >, <, >=, <=, ==, !=

4. Operations for bool types

    and(&&), or(||), not(!)

5. Address type
    
    **address** is a built-in type in Move that is used to represent locations (sometimes called accounts) in storage. An **address** value is a 256-bit (32 byte) identifier. Move uses addresses to differentiate packages of modules, where each package has its own **address** and modules. Specific deployments of Move might also use the **address** value for storage operations.

    