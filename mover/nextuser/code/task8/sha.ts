import   {sha3_256} from "js-sha3";
function Uint8ArrayToString(arr : Uint8Array){
    var dataString = "";
    for (var i = 0; i < arr.length; i++) {
      dataString += String.fromCharCode(arr[i]);
    }
   
    return dataString
}

function stringToUint8Array(str : string){
    var arr = [];
    for (var i = 0, j = str.length; i < j; ++i) {
      arr.push(str.charCodeAt(i));
    }
   
    var tmpUint8Array = new Uint8Array(arr);
    return tmpUint8Array
}

let str = "hello";
let sha = sha3_256.create();
sha.update(str);
console.log(sha.hex());

sha = sha3_256.create();
let arr = stringToUint8Array(str);
sha.update(arr);
console.log(sha.hex());




//'hello' sha3 => 0x3338be694f50c5f338814986cdf0686453a888b84f424d792af4b9202398f392


