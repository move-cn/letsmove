```golang
package main

import (
	"bytes"
	"crypto/rand"
	"encoding/hex"
	"fmt"
	"golang.org/x/crypto/sha3"
)

func generateRandomString(length int) string {
	bytes := make([]byte, length)
	rand.Read(bytes)
	return hex.EncodeToString(bytes)
}

func sha3_256WithPrefix(prefixBytes []byte, suffix []byte) (string, []byte) {
	prefixLength := len(prefixBytes)
	for {
		randomString := generateRandomString(10)
		hash := sha3.New256()
		b := []byte(randomString)
		b = append(b, suffix...)
		hash.Write(b)
		hashValue := hash.Sum(nil)
		if string(hashValue[:prefixLength]) == string(prefixBytes) {
			return randomString, hashValue
		}
	}
}

func main() {
	addr := mustDecode("8ab93080ffbb054ba711158dc952fbfe61ac0aafe7cbd4cc8617578a574ccf67")
	objId := mustDecode("ac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff")
	code := []byte("@Am{ziNE6?>;m)Jcly<") // sui client object 0xac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff
	difficulity := []byte{3, 0, 0, 0, 0, 0, 0, 0}
	trueNum := []byte{3, 0, 0, 0, 0, 0, 0, 0} // sui client object 0xac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff
	var b bytes.Buffer
	b.Write(addr)
	b.Write(objId)
	b.Write([]byte{byte(len(code))})
	b.Write(code)
	b.Write(difficulity)
	b.Write(trueNum)
	fmt.Printf("%+v\n", b.Bytes())
	prefixToMatch := []byte{0, 0, 0} // Prefix bytes to match for the hash

	randomString, hashValue := sha3_256WithPrefix(prefixToMatch, b.Bytes())
	fmt.Println("Random String:", randomString)
	fmt.Println("SHA3-256 Hash:", hex.EncodeToString(hashValue))
}

func mustDecode(s string) []byte {
	res, err := hex.DecodeString(s)
	if err != nil {
		panic(err)
	}
	return res
}
```