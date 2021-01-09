func longestBalancedSubstring(_ string: String) -> Int {
	return max(
		getLongestBalancedInDirection(string, true),
		getLongestBalancedInDirection(string, false)
	)
}

func getLongestBalancedInDirection(_ string: String, _ leftToRight: Bool) -> Int {
	let str = Array(string)
	var openingParens = "("
	var startIdx = 0
	var step = 1

	if !leftToRight {
		openingParens = ")"
		startIdx = str.count - 1
		step = -1
	}

	let openingParensIdx = openingParens.index(string.startIndex, offsetBy: 0)
	let openingParensChar = openingParens[openingParensIdx]

	var idx = startIdx
	var maxLength = 0
	var openingCount = 0
	var closingCount = 0

	while idx >= 0, idx < str.count {
		let char = str[idx]

		if char == openingParensChar {
			openingCount += 1
		} else {
			closingCount += 1
		}

		if openingCount == closingCount {
			maxLength = max(maxLength, closingCount * 2)
		} else if closingCount > openingCount {
			openingCount = 0
			closingCount = 0
		}

		idx += step
	}

	return maxLength
}