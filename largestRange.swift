func largestRange(array: [Int]) -> [Int] {
	var bestRange = [Int]()
	var longestLength = 0
	var nums = [Int: Bool]()

	for num in array {
		nums[num] = true
	}

	for num in array {
		if !nums[num]! {
			continue
		}

		nums[num] = false
		var currentLongest = 1
		var left = num - 1
		var right = num + 1

		while nums.keys.contains(left) {
			nums[left] = false
			currentLongest += 1
			left -= 1
		}

		while nums.keys.contains(right) {
			nums[right] = false
			currentLongest += 1
			right += 1
		}

		if currentLongest > longestLength {
			longestLength = currentLongest
			bestRange = [left + 1, right - 1]
		}
	}

	return bestRange
}