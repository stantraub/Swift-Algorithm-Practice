func rightSideView(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }

    var res = [Int]()
    var queue: [TreeNode] = [root]

    while !queue.isEmpty {
        var length = queue.count

        for i in stride(from: 0, to: length, by: 1) {
            let curNode = queue.removeFirst()
            if i == length - 1 {
                res.append(curNode.val)
            }
            if let left = curNode.left { queue.append(left) }
            if let right = curNode.right { queue.append(right ) }
        }
    }

    return res
}