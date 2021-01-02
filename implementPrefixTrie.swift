class TrieNode {
    var end = false
    var children = [Character: TrieNode]()
}

class Trie {
    let root = TrieNode()
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node = root
        for char in word {
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node = node.children[char]!
        }
        node.end = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        if let node = find(word) {
            return node.end
        }
        return false
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {        
        return find(prefix) != nil
    }
    
    func find(_ str: String) -> TrieNode? {
        var node = root
        for char in str {
            if node.children[char] == nil {
                return nil
            }
            node = node.children[char]!
        }
        return node
    }
}


