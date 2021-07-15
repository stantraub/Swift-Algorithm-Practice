  class LinkedList {
    var value: Int?
    var next: LinkedList?

    init(value: Int) {
      self.value = value
      next = nil
    }
  }

  func removeKthNodeFromEnd(head: LinkedList, k: Int) {
    var counter = 1
		
    var p1: LinkedList? = head
    var p2: LinkedList? = head
    
    while counter <= k {
        p2 = p2?.next
        counter += 1
    }
    
    if p2 == nil {
        head.value = head.next?.value
        head.next = head.next?.next
        return 
    }
    
    while p2?.next != nil {
        p1 = p1?.next
        p2 = p2?.next
    }
    
    p1?.next = p1?.next?.next
  }