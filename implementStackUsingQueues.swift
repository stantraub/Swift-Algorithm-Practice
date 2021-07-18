class MyStack {

    var queue = [Int]()
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        queue.append(x)
        for i in stride(from: 0, to: queue.count - 1, by: 1) {
            queue.append(queue.first!)
            queue.removeLast()
        }
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        queue.removeLast()
    }
    
    /** Get the top element. */
    func top() -> Int {
        queue[queue.count - 1]
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        queue.isEmpty
    }
}