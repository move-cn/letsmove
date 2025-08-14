package main

import (
	"encoding/hex"
	"fmt"
	"golang.org/x/crypto/sha3"
	"math/rand"
	"time"
)

func main() {
	preFixSum := 1

	addrByte := bytesFromHex("c1f4704452819f75c258fe3a01e54d6561899e3478f818625ee8be716fbdd007")
	fmt.Println(addrByte)
	objByte := bytesFromHex("19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab91d4d395b665a23676c75407146354a387a643a6d292a5638373e432a5c5903000000000000006c00000000000000")
	fmt.Println(objByte)

	// Create a new hash & write input string
	for preFixSum != 0 {
		proof := getRandomString(10)
		hash := sha3.New256()
		_, _ = hash.Write([]byte(proof))
		hash.Write(addrByte)
		hash.Write(objByte)
		sha3 := hash.Sum(nil)

		preFixSum = 0
		for i := 0; i < 3; i++ {
			preFixSum = preFixSum + int(sha3[i])
		}
		fmt.Println(preFixSum)
		if preFixSum == 0 {
			fmt.Println("getproof")
			fmt.Println(proof)
			break
		}
	}
	return
}

func getRandomString(n int) string {
	const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	rand.Seed(time.Now().UnixNano())
	b := make([]byte, n)
	for i := range b {
		b[i] = letters[rand.Intn(len(letters))]
	}
	return string(b)
}

func bytesFromHex(hexstr string) []byte {
	bytes, err := hex.DecodeString(hexstr)
	fmt.Println(err)
	return bytes
}
