func levelOrder(_ root: Node?) -> [[Int]] {
    guard let root = root else { return [] }
    var res = [[Int]]()
    var queue: [Node] = [root]

    while !queue.isEmpty {
        let length = queue.count
        var currentLevelValues = [Int]()

        for i in stride(from: 0, to: length, by: 1) {
            let curNode = queue.removeFirst()
            currentLevelValues.append(curNode.val)

            for child in curNode.children {
                queue.append(child)
            }
        }

        res.append(currentLevelValues)
    }

    return res
}