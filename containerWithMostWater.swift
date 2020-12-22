func maxArea(_ height: [Int]) -> Int {
    var maxA = 0

    for i in stride(from: 0, to: height.count, by: 1) {
        for j in stride(from: i + 1, to: height.count, by: 1) {
            var area = min(height[i], height[j]) * (j - i)
            maxA = max(area, maxA)
        }
    }

    return maxA
}

// O(N) time | O(1) space solution

func maxArea(_ height: [Int]) -> Int {
    var (p1, p2, maxA) = (0, height.count - 1, 0)

    while p1 < p2 {
        let currentHeight = min(height[p1], height[p2])
        let currentWidth = p2 - p1
        let area = currentHeight * currentWidth
        maxA = max(area, maxA)

        if height[p1] < height[p2] {
           p1 += 1 
        } else {
           p2 -= 1
        }
    }

    return maxA
}