class LinkedList {
    var value: Int
    var next: LinkedList?

    init(value: Int) {
      self.value = value
    }
}

func removeDuplicatesFromLinkedList(_ linkedList: LinkedList) -> LinkedList {
  var curNode: LinkedList? = linkedList
  
  while curNode != nil {
    var nextDistinctNode = curNode!.next
    while nextDistinctNode != nil, nextDistinctNode!.value == curNode!.value {
      nextDistinctNode = nextDistinctNode!.next
    }
    
    curNode!.next = nextDistinctNode
    curNode = nextDistinctNode
  }
  
  return linkedList
}
