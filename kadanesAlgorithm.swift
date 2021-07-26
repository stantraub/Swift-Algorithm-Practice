func kadanesAlgorithm(array: [Int]) -> Int {
		var currentSum = array[0]
		var maxSum = array[0]

		for i in stride(from: 1, to: array.count, by: 1) {
				currentSum = max(array[i], currentSum + array[i])
				maxSum = max(maxSum, currentSum)
		}

		return maxSum
}