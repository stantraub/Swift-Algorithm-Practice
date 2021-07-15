class Program {
  func maximumSubsetSum(array: [Int]) -> Int {
    if array.count == 0 {
		return 0
	}
	
	if array.count == 1 {
		return array[0]
	}
	var dp = array
	dp[1] = max(dp[0], dp[1])
	
	for i in stride(from: 2, to: array.count, by: 1) {
		dp[i] = max(dp[i - 1], array[i] + dp[i - 2])
	}
	
	return dp[dp.count - 1]
  }
}