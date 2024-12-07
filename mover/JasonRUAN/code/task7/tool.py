def hex_to_decimal_array(hex_str: str) -> list:
    hex_str = hex_str.replace('0x', '')
    byte_array = bytes.fromhex(hex_str)
    decimal_array = list(byte_array)
    return decimal_array

test_hex = "0x790eecea6313982c4a3b9eae286a569562bf99f68bc34e1cdfb1b773e24dcb27"
decimal_array = hex_to_decimal_array(test_hex)

decimal_string = ','.join(map(str, decimal_array))
print(decimal_string)