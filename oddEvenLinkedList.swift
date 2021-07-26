func oddEvenList(_ head: ListNode?) -> ListNode? {
    var odd: ListNode? = head
    var even: ListNode? = head?.next
    var evenHead: ListNode? = even

    while even != nil, even?.next != nil {
        odd?.next = even?.next
        odd = odd?.next
        even?.next = odd?.next
        even = even?.next
    }

    odd?.next = evenHead

    return head
}
