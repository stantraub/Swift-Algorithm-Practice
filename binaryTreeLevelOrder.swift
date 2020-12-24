func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return []} 

    var res = [[Int]]()
    var queue: [TreeNode] = [root]

    while !queue.isEmpty {
        var (length, count) = (queue.count, 0)
        var currentLevelValues = [Int]()

        while count < length {
            let curNode = queue.removeFirst()
            currentLevelValues.append(curNode.val)
            if let left = curNode.left {
                queue.append(left)
            } 
            if let right = curNode.right {
                queue.append(right)
            }
            count += 1
        }

        res.append(currentLevelValues)
    }

    return res
}