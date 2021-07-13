class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        let operators: Set<String> = ["+", "-", "*", "/"]
        var stack = [Int]()

        for token in tokens {
            if !operators.contains(token) {
                stack.append(Int(token)!)
            } else {
                let second = stack.removeLast()
                let first = stack.removeLast()

                if token == "+" {
                    stack.append(first + second)
                } else if token == "-" {
                    stack.append(first - second)
                } else if token == "*" {
                    stack.append(first * second)
                } else {
                    stack.append(first / second)
                }
            }
        }

        return stack.removeLast()
    }
}