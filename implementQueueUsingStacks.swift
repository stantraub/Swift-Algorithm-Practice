class MyQueue {

    /** Initialize your data structure here. */
    var inStack: [Int]
    var outStack: [Int]
    
    init() {
        self.inStack = [Int]()
        self.outStack = [Int]()
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        inStack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if outStack.isEmpty {
            while inStack.count > 0 {
                outStack.append(inStack.removeLast())
            }
        }
        
        return outStack.removeLast()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if outStack.isEmpty {
            while inStack.count > 0 {
                outStack.append(inStack.removeLast())
            }
        }
        
        return outStack[outStack.count - 1]
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return inStack.isEmpty && outStack.isEmpty
    }
}