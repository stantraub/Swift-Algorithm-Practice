func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    guard let headA = headA, let headB = headB else { return nil }
    
    var p1: ListNode? = headA
    var p2: ListNode? = headB
    
    while p1 !== p2 {
        if p1 != nil {
            p1 = p1?.next
        } else {
            p1 = headB
        }
        
        if p2 != nil {
            p2 = p2?.next
        } else {
            p2 = headA
        }
    }
    
    return p1
}