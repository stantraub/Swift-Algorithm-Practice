class Program {
  // This is an input class. Do not edit.
  class LinkedList {
    var value: Int
    var next: LinkedList?

    init(value: Int) {
      self.value = value
      next = nil
    }
  }

  func findLoop(head: LinkedList) -> LinkedList? {
    var p1: LinkedList? = head.next
		var p2: LinkedList? = head.next?.next
		
		while p1 !== p2 {
			p1 = p1?.next
			p2 = p2?.next?.next
		}
		
		p1 = head
		
		while p1 !== p2 {
			p1 = p1?.next
			p2 = p2?.next
		}
		
		return p1
  }
}