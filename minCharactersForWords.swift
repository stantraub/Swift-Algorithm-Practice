func minimumCharactersForWords(_ words: [String]) -> [String] {
	var maximumCharacterFrequencies = [Character: Int]()

	for word in words {
		let characterFrequencies = countCharacterFrequencies(word)
		updateMaximumFrequencies(characterFrequencies, &maximumCharacterFrequencies)

	}
	return makeArrayFromCharacterFrequencies(maximumCharacterFrequencies)
}

func countCharacterFrequencies(_ str: String) -> [Character: Int] {
	var characterFrequencies = [Character: Int]()
	for character in str {
		if characterFrequencies[character] == nil {
			characterFrequencies[character] = 0
		}
		characterFrequencies[character]! += 1
	}
	return characterFrequencies
}

func updateMaximumFrequencies(_ frequencies: [Character: Int], _ maximumFrequencies: inout [Character: Int]) {
	for (character, frequency) in frequencies {
		if maximumFrequencies[character] != nil {
			maximumFrequencies[character] = max(frequency, maximumFrequencies[character]!)
		} else {
			maximumFrequencies[character] = frequency
		}
	}
}

func makeArrayFromCharacterFrequencies(_ characterFrequencies: [Character: Int]) -> [String] {
	var characters = [String]()

	for (character, frequency) in characterFrequencies {
		for i in stride(from: 0, to: frequency, by: 1) {
			characters.append(String(character))
		}
	}
	return characters
}	