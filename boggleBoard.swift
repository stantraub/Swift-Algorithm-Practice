class TrieNode {
    var end: String = "false"
    var children = [String: TrieNode]()
}

class Trie {
    var root = TrieNode()

    func insert( _ word: String) {
            var curNode = root

            for char in word {
                    let strChar = String(char)
                    if curNode.children[strChar] == nil {
                            curNode.children[strChar] = TrieNode()
                    }

                    curNode = curNode.children[strChar]!
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


func boggleBoard(boggleBoard: [[String]], words: [String]) -> [String] {
    let trie = buildTrie(words)
    var foundWords = Set<String>()
    var visited = boggleBoard.map { row in row.map { _ in false }}

    for row in boggleBoard.indices {
        for col in boggleBoard[0].indices {
            dfs(row, col, boggleBoard, trie.root, &visited, &foundWords)
        }
    }

    return Array(foundWords)
}

func inBounds(_ dir: [Int], _ board: [[String]]) -> Bool { 
    if dir[0] >= 0, dir[0] < board.count, dir[1] >= 0, dir[1] < board[0].count {
        return true
    } 

    return false
}

func dfs(_ row: Int, _ col: Int, _ board: [[String]], _ trie: TrieNode, _ visited: inout [[Bool]], _ foundWords: inout Set<String>) {
    guard visited[row][col] != true else { return }

    let letter = board[row][col]

    guard let nextNode = trie.children[letter] else { return }

    let dirs = [[0, 1], [1, 0], [-1, 0], [0, -1], [1, -1], [-1, 1], [-1, -1], [1, 1]]

    if nextNode.end != "false" { 
        foundWords.insert(nextNode.end)
    }

    visited[row][col] = true

    for dir in dirs {
        let nextPos = [dir[0] + row, dir[1] + col]
        if inBounds(nextPos, board) {
            dfs(nextPos[0], nextPos[1], board, nextNode, &visited, &foundWords)
        }
    }

    visited[row][col] = false 
}

var words = [
  "this",
  "is",
  "not",
  "a",
  "simple",
  "boggle",
  "board",
  "test",
  "REPEATED",
  "NOTRE-PEATED"
]

var board = [
  ["t", "h", "i", "s", "i", "s", "a"],
  ["s", "i", "m", "p", "l", "e", "x"],
  ["b", "x", "x", "x", "x", "e", "b"],
  ["x", "o", "g", "g", "l", "x", "o"],
  ["x", "x", "x", "D", "T", "r", "a"],
  ["R", "E", "P", "E", "A", "d", "x"],
  ["x", "x", "x", "x", "x", "x", "x"],
  ["N", "O", "T", "R", "E", "-", "P"],
  ["x", "x", "D", "E", "T", "A", "E"]
]

print(boggleBoard(boggleBoard: board, words: words))