func levenshteinDistance(firstString: String, secondString: String) -> Int {
	var edits = [[Int]]()

	for i in 0 ..< firstString.count + 1 {
		var row = [Int]()

		for j in 0 ..< secondString.count + 1 {
			row.append(j)
		}

		row[0] = i
		edits.append(row)
	}


	for i in 1 ..< firstString.count + 1 {
		for j in 1 ..< secondString.count + 1 {
			let firstIndex = firstString.index(firstString.startIndex, offsetBy: i - 1)
			let secondIndex = secondString.index(secondString.startIndex, offsetBy: j - 1)

			if firstString[firstIndex] == secondString[secondIndex] {
				edits[i][j] = edits[i - 1][j - 1]
			} else {
				edits[i][j] = 1 + min(edits[i - 1][j - 1], edits[i][j - 1], edits[i - 1][j])
			}
		}
	}

	return edits[firstString.count][secondString.count]
}