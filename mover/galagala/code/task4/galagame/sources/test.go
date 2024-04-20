// 判断游戏是否结束
func gameOver(board [][]int) bool {
	// 检查行和列
	for i := 0; i < 3; i++ {
		if board[i][0] != Empty && board[i][0] == board[i][1] && board[i][1] == board[i][2] {
			return true
		}
		if board[0][i] != Empty && board[0][i] == board[1][i] && board[1][i] == board[2][i] {
			return true
		}
	}
	// 检查对角线
	if board[0][0] != Empty && board[0][0] == board[1][1] && board[1][1] == board[2][2] {
		return true
	}
	if board[0][2] != Empty && board[0][2] == board[1][1] && board[1][1] == board[2][0] {
		return true
	}
	// 检查是否有空格
	for i := 0; i < 3; i++ {
		for j := 0; j < 3; j++ {
			if board[i][j] == Empty {
				return false
			}
		}
	}
	return true
}

// 最小最大算法
func minimax(board [][]int, depth int, maximizingPlayer bool) int {
	if gameOver(board) || depth == 0 {
		return evaluate(board)
	}

	if maximizingPlayer {
		maxEval := math.MinInt32
		for i := 0; i < 3; i++ {
			for j := 0; j < 3; j++ {
				if board[i][j] == Empty {
					board[i][j] = Player1
					eval := minimax(board, depth-1, false)
					board[i][j] = Empty
					maxEval = int(math.Max(float64(maxEval), float64(eval)))
				}
			}
		}
		return maxEval
	} else {
		minEval := math.MaxInt32
		for i := 0; i < 3; i++ {
			for j := 0; j < 3; j++ {
				if board[i][j] == Empty {
					board[i][j] = Player2
					eval := minimax(board, depth-1, true)
					board[i][j] = Empty
					minEval = int(math.Min(float64(minEval), float64(eval)))
				}
			}
		}
		return minEval
	}
}

// 选择最佳下棋位置
func findBestMove(board [][]int) (int, int) {
	bestScore := math.MinInt32
	var bestMoveX, bestMoveY int
	for i := 0; i < 3; i++ {
		for j := 0; j < 3; j++ {
			if board[i][j] == Empty {
				board[i][j] = Player1
				score := minimax(board, 3, false)
				board[i][j] = Empty
				if score > bestScore {
					bestScore = score
					bestMoveX, bestMoveY = i, j
				}
			}
		}
	}
	return bestMoveX, bestMoveY
}