package main

import (
	"encoding/hex"
	"fmt"
	"math/rand"
	"time"

	"golang.org/x/crypto/sha3"
)

// sha3_256 计算 SHA3-256 哈希
func sha3_256(data []byte) []byte {
	hash := sha3.New256()
	hash.Write(data)
	return hash.Sum(nil)
}

// findProof 寻找满足条件的 proof 并返回字节数组
func findProof(sender []byte, challenge []byte, difficulty int) []byte {
	rand.Seed(time.Now().UnixNano()) // 初始化随机数生成器

	for {
		// 随机生成 8 字节的 proof
		proof := make([]byte, 4)
		rand.Read(proof)

		// 构建 full_proof = proof + sender + challenge
		fullProof := append(proof, sender...)
		fullProof = append(fullProof, challenge...)

		// 计算 SHA3-256 哈希
		hashResult := sha3_256(fullProof)

		// 检查前 difficulty 个字节的和是否为 0
		prefixSum := 0
		for i := 0; i < difficulty; i++ {
			prefixSum += int(hashResult[i])
		}
		if prefixSum == 0 {
			fmt.Printf("Proof found (byte array): %v\n", proof)
			return proof
		}
	}
}

func main() {
	// 将 sender 转换为字节数组（16 进制字符串转为 bytes）
	senderHex := "becf7738a5b792939a8777eb32e5ed7b2fbf4c9c82d88037ec4c2e3e3bd1d4b5"
	senderBytes, err := hex.DecodeString(senderHex)
	if err != nil {
		fmt.Println("Error decoding sender hex:", err)
		return
	}

	// 使用提供的 challengeBytes
	challengeBytes := []byte{
		25, 231, 108, 165, 4, 197, 165, 250, 94, 33, 74, 69, 252, 166, 192, 88, 23, 27, 163, 51, 246, 218, 137, 123, 130, 115, 16, 148, 80, 77, 90, 185, 9, 65, 44, 41, 50, 52, 74, 42, 60, 52, 3, 0, 0, 0, 0, 0, 0, 0, 114, 0, 0, 0, 0, 0, 0, 0,
	}

	// 计算 proof 并输出为字节数组
	proof := findProof(senderBytes, challengeBytes, 3)
	fmt.Printf("Calculated proof as byte array: %v\n", proof)
}
