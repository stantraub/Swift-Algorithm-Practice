func reverseWordsInString(_ string: String) -> String {
	var words = [String]()
	let stringArr = Array(string)
	var startOfWord = 0 

	for (idx, char) in stringArr.enumerated() {
		if char == " " {
			words.append(String(stringArr[startOfWord ..< idx]))
			startOfWord = idx
		} else if stringArr[startOfWord] == " " {
			words.append(" ")
			startOfWord = idx
		}
	}

	words.append(String(stringArr[startOfWord...]))
	reverseList(&words)
	return words.joined(separator: "")
}

func reverseList(_ words: inout [String]) {
	var start = 0
	var end = words.count - 1

	while start < end {
		let temp = words[start]
		words[start] = words[end]
		words[end] = temp
		start += 1
		end -= 1
	}
}