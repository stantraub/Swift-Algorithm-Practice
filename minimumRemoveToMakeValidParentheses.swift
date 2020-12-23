func minRemoveToMakeValid(_ s: String) -> String {
    var str = Array(s)
    var stack = [Int]()

    for i in str.indices {
        if str[i] == "(" {
            stack.append(i)
        } else if str[i] == ")" {
            if stack.count > 0 {
                stack.removeLast()
            } else {
                str[i] = "*"
            }
        }
    }

    while stack.count > 0 {
        let index = stack.removeLast() 
        str[index] = "*"
    }

    return String(str).replacingOccurrences(of: "*", with: "")
}