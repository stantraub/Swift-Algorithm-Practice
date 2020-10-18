func reverseString(_ s: inout [Character]) {
    var p1 = 0
    var p2 = s.count - 1
    
    while p1 < p2 {
        var temp = s[p1]
        s[p1] = s[p2]
        s[p2] = temp
        p1 += 1
        p2 -= 1
    }
}