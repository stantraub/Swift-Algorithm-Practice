class MyQueue {

    /** Initialize your data structure here. */
    var queue: [Int]
    
    init() {
        self.queue = [Int]()
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        queue.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        let lastEle = queue.removeFirst()
        return lastEle
    }
    
    /** Get the front element. */
    func peek() -> Int {
        return queue[0]
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return queue.isEmpty
    }
}