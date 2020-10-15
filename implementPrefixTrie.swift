class TrieNode {
    var word = ""
    var children = [Character: TrieNode]()
}
class Trie {
    var root = TrieNode()
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var currentNode = root
        
        for char in word {
            if let node = currentNode.children[char] {
                currentNode = node
            }
            else {
                let newNode = TrieNode()
                currentNode.children[char] = newNode
                currentNode = newNode
            }
        }
        
        currentNode.word = word
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var currentNode = root
        
        for char in word {
            if let node = currentNode.children[char] {
                currentNode = node
            }
            else {
                return false
            }
        }
        
        return currentNode.word.isEmpty ? false : true
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var currentNode = root
        
        for char in prefix {
            if let node = currentNode.children[char] {
                currentNode = node
            }
            else {
                return false
            }
        }
        
         return currentNode.children.isEmpty && currentNode.word.isEmpty ? false : true
    }
}