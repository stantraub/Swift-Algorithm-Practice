func preorder(_ root: Node?) -> [Int] {
    var res = [Int]()
    
    func helper(_ node: Node?) {
        if let node = node {
            res.append(node.val)
            for child in node.children {
                helper(child)
            }
        }

    }
    
    helper(root)
    
    return res
}