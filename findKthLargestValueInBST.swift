class BST {
    var value: Int
    var left: BST?
    var right: BST?

    init(value: Int) {
        self.value = value
        left = nil
        right = nil
    }
}

struct TreeInfo {
    var numberOfNodesVisited: Int
    var latestVisitedNodeValue: Int
}

func findKthLargestValueInBst(_ tree: BST, _ k: Int) -> Int {
    var info = TreeInfo(numberOfNodesVisited: 0, latestVisitedNodeValue: -1)
    reverseInOrderTraverse(tree, k, &info)
    return info.latestVisitedNodeValue
}

func reverseInOrderTraverse(_ node: BST?, _ k: Int, _ treeInfo: inout TreeInfo) {
    if node == nil || treeInfo.numberOfNodesVisited >= k {
        return 
    }
    
    reverseInOrderTraverse(node!.right, k, &treeInfo)
    if treeInfo.numberOfNodesVisited < k {
        treeInfo.numberOfNodesVisited += 1
        treeInfo.latestVisitedNodeValue = node!.value
        reverseInOrderTraverse(node!.left, k, &treeInfo)
    }
}
