class Program {
  // This is an input class. Do not edit.
  class AncestralTree {
    var name = String()
    var ancestor: AncestralTree?

    init(name: String) {
      self.name = name
      ancestor = nil
    }
  }

  func getYoungestCommonAncestor(_ topAncestor: AncestralTree?, _ descendantOne: inout AncestralTree?, _ descendantTwo: inout AncestralTree?) -> AncestralTree {
		var firstDescendant = descendantOne
		var secondDescendant = descendantTwo
		
		let depthOne = getDescendantDepth(topAncestor, &descendantOne)
		let depthTwo = getDescendantDepth(topAncestor, &descendantTwo)
		
		if depthOne > depthTwo {
			var difference = depthOne - depthTwo
			return backtrackTree(&firstDescendant, &secondDescendant, &difference)
		} else {
			var difference = depthTwo - depthOne
			return backtrackTree(&secondDescendant, &firstDescendant, &difference)
		}
  }
	
	func getDescendantDepth(_ topAncestor: AncestralTree?, _ descendant: inout AncestralTree?) -> Int {
		var depth = 0 
		
		while descendant !== topAncestor {
			depth += 1
			descendant = descendant?.ancestor
		}
		return depth 
	}
	
	func backtrackTree(_ lowerDescendant: inout AncestralTree?, _ higherDescendant: inout AncestralTree?, _ difference: inout Int) -> AncestralTree {
		while difference > 0 {
			difference -= 1
			lowerDescendant = lowerDescendant?.ancestor
		}
		
		while lowerDescendant !== higherDescendant {
			lowerDescendant = lowerDescendant?.ancestor
			higherDescendant = higherDescendant?.ancestor
		}
		
		return lowerDescendant!
	}

}
	