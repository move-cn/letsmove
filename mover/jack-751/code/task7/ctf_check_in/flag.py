from hashlib import sha3_256

# 1. Move bcs::to_bytes(String) 會加上長度前綴
# "hJeYQ}`9<b<\r$K(bN1;4Jg@" 長度為 24 (0x18)
bcs_bytes = b'\x18hJeYQ}`9<b<\r$K(bN1;4Jg@'
github_id = b'jack-751'
data = bcs_bytes + github_id
flag = "0x" + sha3_256(data).hexdigest()
print(flag)