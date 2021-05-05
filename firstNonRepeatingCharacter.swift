  func firstNonRepeatingCharacter(_ string: String) -> Int {
    var freq: [Character: Int] = [:]

    for char in string {
        if freq[char] != nil {
            freq[char]! += 1
        } else {
            freq[char] = 1
        }
    }

    for (i, char) in string.enumerated() {
        if freq[char] == 1 { return i }
    }

    return -1
}