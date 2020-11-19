func runLengthEncoding(_ string: String) -> String {
	var encoding = [Character]()
	var runningLength = 1
	let indexedString = Array(string)

	for i in 1..<string.count {
		let currentChar = indexedString[i]
		let previousChar = indexedString[i - 1]

		if currentChar != previousChar || runningLength == 9 {
			encoding.append(Array(String(runningLength))[0])
			encoding.append(previousChar)
			runningLength = 0
		}

		runningLength += 1
	}

	encoding.append(Array(String(runningLength))[0])
	encoding.append(indexedString[string.count - 1])

	return String(encoding)
}