import hashlib
from binascii import unhexlify

def hexstr_to_bytes(s):
    if s.startswith('0x'):
        s = s[2:]
    return unhexlify(s)

# 參數
sender_bytes = hexstr_to_bytes('0xb961b905ab4a1d6ea41e21b29bacff75efc09759bf68decb4733a772f32820b3')
challenge_bcs = hexstr_to_bytes('0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab90a6d612d6b7a3a3b25596e03000000000000009300000000000000')

github_id = b'jack-751'  

found = False
for try_val in range(100, 4294967295):
    print('FOUND proof int:', try_val)
    proof = try_val.to_bytes((try_val.bit_length() + 7) // 8 or 1, 'big')
    # print('FOUND proof int:', try_val)
    # print('proof (bytes):', proof)
    # print('proof (hex):', proof.hex())
    # print('sender_bytes:', sender_bytes)
    # print('challenge_bcs:', challenge_bcs)
    full_proof = proof + sender_bytes + challenge_bcs
    # print('proof (bytes):', proof)
    # print('proof (hex):', proof.hex())
    # print('sender_bytes:', sender_bytes.hex())
    # print('challenge_bcs:', challenge_bcs.hex())
    # print('full_proof:', full_proof.hex())
    hash_bytes = hashlib.sha3_256(full_proof).digest()
    print('hash:', hash_bytes.hex())

    prefix_sum = 0
    for i in range(3):
        a = hash_bytes[i]
        # print('a:', a)
        # print('prefix_sum:', prefix_sum)
        # print('----------------')
        prefix_sum += a
        # print('proof:', proof)
        # print('hash:', hash_bytes.hex())

    if prefix_sum == 0:
        found = True
        print('FOUND proof int:', try_val)
        print('FOUND proof bytes:', proof)
        print('FOUND hash:', hash_bytes.hex())
        print('proof (hex):', proof.hex())
        break

if not found:
    print('No valid proof found')