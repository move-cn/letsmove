from binascii import unhexlify

def serialize_address(addr: str) -> bytes:
    # 去掉 0x，補齊 32 bytes
    addr_bytes = unhexlify(addr[2:])
    return addr_bytes.rjust(32, b'\x00')

def serialize_string(s: str) -> bytes:
    # Move BCS string: length (uleb128) + utf8 bytes
    s_bytes = s.encode('utf8')
    length = len(s_bytes)
    # uleb128 encoding
    out = bytearray()
    while True:
        byte = length & 0x7F
        length >>= 7
        if length:
            out.append(byte | 0x80)
        else:
            out.append(byte)
            break
    return bytes(out) + s_bytes

def serialize_u64(val: int) -> bytes:
    return val.to_bytes(8, 'little')

def serialize_challenge(obj: dict) -> bytes:
    return (
        serialize_address(obj['id']) +
        serialize_string(obj['str']) +
        serialize_u64(obj['difficulity']) +
        serialize_u64(obj['ture_num'])
    )

challenge = {
    'id': '0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9',
    'str': 'ma-kz:;%Yn',
    'difficulity': 3,
    'ture_num': 147,
}

bcs_bytes = serialize_challenge(challenge)
print('Challenge BCS:', bcs_bytes.hex())

