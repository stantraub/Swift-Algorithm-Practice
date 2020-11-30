func waterArea(heights: [Int]) -> Int {
	var maxes = Array(repeating: 0, count: heights.count)
	var leftMax = 0

	for i in 0 ..< heights.count {
		let currentHeight = heights[i]

		maxes[i] = leftMax
		leftMax = max(leftMax, currentHeight)
	}

	var rightMax = 0

	for i in stride(from: heights.count - 1, to: 0, by: -1) {
		let currentHeight = heights[i]

		let minMax = min(rightMax, maxes[i])

		if currentHeight < minMax {
			maxes[i] = minMax - currentHeight
		} else {
			maxes[i] = 0
		}

		rightMax = max(rightMax, currentHeight)
	}


	return maxes.reduce(0) { $0 + $1 }
}