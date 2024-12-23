import pkg from "js-sha3";
import { fromBase64, toBase64 } from "@mysten/bcs";
import { consts } from "./constant.js";

const { sha3_256 } = pkg;

export function Uint8ArrayToHexString(arr) {
  var dataString = "0x";

  for (var i = 0; i < arr.length; i++) {
    dataString += arr[i].toString(16);
  }
  return dataString;
}

export function Uint8ArrayToString(arr) {
  var dataString = "";
  for (var i = 0; i < arr.length; i++) {
    dataString += String.fromCharCode(arr[i]);
  }

  return dataString;
}

export function stringToUint8Array(str, count) {
  var arr = new Uint8Array(count);
  for (var i = 0, j = str.length; i < j && i < count; ++i) {
    arr[i] = str.charCodeAt(i);
  }
  return arr;
}
export function numToUint8Array(address, byte_count) {
  let buffer = new ArrayBuffer(byte_count);
  let arr = new Uint8Array(buffer);
  for (let i = byte_count - 1; i >= 0; i--) {
    arr[i] = Number(address % 256n);
    address = address / 256n;
  }
  return arr;
}

export function fill_array(arr, value, byte_count) {
  for (let i = byte_count - 1; i >= 0; i--) {
    arr[i] = Number(value % 256n);
    value = value / 256n;
  }
  return arr;
}

export function check_challege(hash, count) {
  for (let i = 0; i < count; ++i) {
    if (hash[i] != "0") return false;
  }
  return true;
}

export function get_tail(challege) {
  let sender_bytes = numToUint8Array(consts.sender, 32);

  let chall_bytes = fromBase64(challege);
  console.log("chall_bytes", chall_bytes);
  console.log("sender_bytes", sender_bytes);

  let count = sender_bytes.length + chall_bytes.length;
  let buffer = new Uint8Array(count);
  buffer.set(sender_bytes);
  buffer.set(chall_bytes, sender_bytes.length);
  return buffer;
}

function test_sha() {
  console.log(consts.sender);
  let arr = numToUint8Array(consts.sender, 32);
  console.log(arr);
  console.log(numToUint8Array(0x3344n, 8));

  let sha = sha3_256.create();
  sha.update(arr);
  console.log("address hash:");
  console.log(sha.hex());

  let uarr = "0003";

  console.log(check_challege(uarr, 3));
  console.log(check_challege(uarr, 4));
}

// test_sha();

let data = {
  difficulity: "3",
  full_proof: [
    1, 175, 72, 130, 247, 236, 34, 21, 229, 101, 183, 161, 141, 123, 0, 231, 15,
    204, 218, 116, 179, 12, 62, 204, 239, 251, 88, 87, 177, 179, 210, 36, 158,
    40, 233, 79, 64, 164, 173, 206, 243, 42, 140, 99, 138, 243, 134, 49, 198,
    232, 56, 1, 139, 126, 228, 231, 49, 218, 177, 13, 54, 219, 118, 128, 176,
    18, 19, 16, 11, 76, 101, 116, 115, 77, 111, 118, 101, 67, 84, 70, 3, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  ],
  hash: [
    81, 153, 87, 108, 100, 98, 147, 63, 45, 210, 91, 216, 211, 28, 47, 164, 107,
    134, 179, 97, 27, 253, 160, 106, 202, 113, 4, 71, 58, 237, 131, 99,
  ],
  proof: [1, 175, 72, 130],
};
// let sha = sha3_256.create();
// sha.update(data.full_proof);
// console.log("hash is :", sha.hex());

// let str = "s1hbGSAxvxLfvIm23h7E3xsmMJT9kW02a7cMDWP5cpgLTGV0c01vdmVDVEYDAAAAAAAAAAAAAAAAAAAA";
// console.log("frombase64", fromBase64(str));

let proof = [0, 26, 201, 247];
let sender = [
  9, 190, 107, 137, 149, 183, 245, 109, 132, 145, 166, 127, 84, 81, 156, 86, 5,
  157, 63, 194, 65, 36, 71, 3, 102, 183, 238, 91, 81, 194, 122, 145,
];
let challenge = [
  25, 231, 108, 165, 4, 197, 165, 250, 94, 33, 74, 69, 252, 166, 192, 88, 23,
  27, 163, 51, 246, 218, 137, 123, 130, 115, 16, 148, 80, 77, 90, 185, 28, 105,
  125, 71, 94, 92, 48, 119, 98, 49, 67, 124, 46, 81, 49, 113, 77, 110, 122, 42,
  102, 100, 70, 94, 120, 76, 53, 39, 49, 3, 0, 0, 0, 0, 0, 0, 0, 104, 0, 0, 0,
  0, 0, 0, 0,
];

let sha = sha3_256.create();
sha.update([].concat(proof).concat(sender).concat(challenge));
console.log("hash is :", sha.hex());
