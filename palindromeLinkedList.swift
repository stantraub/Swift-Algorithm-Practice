func isPalindrome(_ head: ListNode?) -> Bool {
    var fast: ListNode? = head
    var slow: ListNode? = head
    
    while fast != nil, fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    
    if fast != nil {
        slow = slow?.next
    }
    
    slow = reverse(slow)
    fast = head
    
    while slow != nil {
        if fast?.val != slow?.val {
            return false 
        }
        
        slow = slow?.next 
        fast = fast?.next
    }
    
    return true 

}

func reverse(_ head: ListNode?) -> ListNode? {
    var p1: ListNode?
    var p2: ListNode? = head
    
    while p2 != nil {
        var p3 = p2?.next
        p2?.next = p1
        p1 = p2
        p2 = p3
    }
    
    return p1
}