class Node {
    let start: Int
    let end: Int
    var left: Node?
    var right: Node?
    
    init(start: Int, end: Int) {
        self.start = start
        self.end = end
    }
}

class MyCalendar {
    
    var root: Node?
    
    func book(_ start: Int, _ end: Int) -> Bool {
        if root == nil {
            root = Node(start: start, end: end)
            return true
        }
        return helper(start, end, root)
    }
    
    func helper(_ start: Int, _ end: Int, _ node: Node?) -> Bool {
        guard let node = node else { return false }
        
        if start >= node.end {
            if node.right == nil {
                node.right = Node(start: start, end: end)
                return true
            }
            return helper(start, end, node.right)
        } else if end <= node.start {
            if node.left == nil {
                node.left = Node(start: start, end: end)
                return true
            }
            return helper(start, end, node.left)
        } else {
            return false 
        }
    }
}