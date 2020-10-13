class Program {
  // This is an input class. Do not edit.
  class LinkedList {
    var value: Int
    var next: LinkedList?

    init(value: Int) {
      self.value = value
    }
  }

  func mergeLinkedLists(_ headOne: LinkedList, _ headTwo: LinkedList) -> LinkedList {
    var dummy = LinkedList(value: -1)
    var head = dummy
    var l1 = headOne as LinkedList?
    var l2 = headTwo as LinkedList?

    while l1 != nil, l2 != nil {
        if l1!.value < l2!.value {
            dummy.next = l1
            l1 = l1!.next
        } else {
            dummy.next = l2
            l2 = l2!.next
        }

        if let dummyNext = dummy.next {
            dummy = dummyNext
        }
    }

    if l1 != nil {
        dummy.next = l1
    } else {
        dummy.next = l2
    }

    return head.next ?? headTwo
  }
}