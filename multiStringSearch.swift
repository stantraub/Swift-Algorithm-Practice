class TrieNode {
	var end = "false"
	var children = [Character: TrieNode]()
}

class Trie {
	var root = TrieNode()

	func insert(_ word: String) {
		var curNode = root

		for char in word {
			if curNode.children[char] == nil {
				curNode.children[char] = TrieNode()
			}

			curNode = curNode.children[char]!
		}

		curNode.end = word
	}
}

func buildTrie(_ words: [String]) -> Trie {
	let trie = Trie()

	for word in words {
		trie.insert(word)
	}

	return trie 
}

func multiStringSearch(_ bigString: String, _ smallStrings: [String]) -> [Bool] {
	let trie = buildTrie(smallStrings)
	let bigStringArr = Array(bigString)

	var foundWords = Set<String>()

	for i in bigStringArr.indices {
		findSmallSubstrings(i, bigStringArr, trie, &foundWords)
	}

	return smallStrings.map { foundWords.contains($0) }
}

func findSmallSubstrings(_ startIndex: Int, _ bigStringArr: [Character], _ trie: Trie, _ foundWords: inout Set<String>) {
	var curNode = trie.root

	for i in stride(from: startIndex, to: bigStringArr.count, by: 1) {
		let char = bigStringArr[i]
		if curNode.children[char] == nil {
			break
		}

		curNode = curNode.children[char]!

		if curNode.end != "false" {
			foundWords.insert(curNode.end)
		}
	}
} 