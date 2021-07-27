func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
  var dummyHead: ListNode? = ListNode()
  dummyHead?.next = head
  var slow: ListNode? = dummyHead
  var fast: ListNode? = dummyHead

  for i in 0...n {
    fast = fast?.next
  }

  while fast != nil {
    slow = slow?.next
    fast = fast?.next
  }

  slow?.next = slow?.next?.next

  return dummyHead?.next
}