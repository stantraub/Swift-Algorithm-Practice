func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    if lists == nil || lists.isEmpty { return nil }
    return mergeKLists(lists, 0, lists.count - 1)
}

func mergeKLists(_ lists: [ListNode?], _ start: Int, _ end: Int) -> ListNode? {
    if start == end { return lists[start] }
    
    let mid = (start + end) / 2
    let left = mergeKLists(lists, start, mid)
    let right = mergeKLists(lists, mid + 1, end)
    return merge(left, right)
}

func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard var l1 = l1, var l2 = l2 else { return nil }
    
    let result: ListNode?
    let curr = result
    
    while l1 != nil || l2 != nil {
        if l1 == nil {
            curr.next = l2
            l2 = l2?.next
        } else if l2 == nil {
            curr?.next = l1
            l1 = l1?.next
        } else if l1.val < l2.val {
            curr?.next = l1
            l1 = l1?.next
        } else {
            curr?.next = l2
            l2 = l2?.next
        }
        
        curr = curr.next
    }
    
    return result
}