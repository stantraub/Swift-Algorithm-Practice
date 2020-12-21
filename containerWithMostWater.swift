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