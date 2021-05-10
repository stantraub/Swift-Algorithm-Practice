func numberOfWaysToTraverseGraph(_ m: Int, _ n: Int) -> Int {
	var dp = Array(repeating: [Int](), count: m)
	for i in 0 ..< dp.count {
		dp[i] = Array(repeating: 0, count: n)
	}

	for row in dp.indices {
        for col in dp[0].indices {
            if row == 0 || col == 0 { 
                dp[row][col] = 1
            } else {
                dp[row][col] = dp[row - 1][col] + dp[row][col - 1]
            }
        }
	}

	return dp[m - 1][n - 1]
}