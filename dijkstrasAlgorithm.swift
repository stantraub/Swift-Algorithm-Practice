func dijkstrasAlgorithm(_ start: Int, _ edges: [[[Int]]]) -> [Int] {
	let numOfVertices = edges.count

	var minDistances = Array(repeating: Int.max, count: numOfVertices)
	minDistances[start] = 0

	var visited = Set<Int>()

	while visited.count != numOfVertices {
		let (vertex, currentMinDistance) = getVertexWithMinDistance(&minDistances, &visited)
		if currentMinDistance == Int.max {
			break
		}

		visited.insert(vertex)

		for edge in edges[vertex] {
			var (destination, distanceToDestination) = (edge[0], edge[1])

			if visited.contains(destination) {
				continue
			}

			let newPathDistance = currentMinDistance + distanceToDestination
			let currentDestinationDistance = minDistances[destination]
			if newPathDistance < currentDestinationDistance {
				minDistances[destination] = newPathDistance
			}
		}
	}
	return minDistances.map {
		if $0 == Int.max {
			return -1
		}
		return $0
	}
}

func getVertexWithMinDistance(_ distances: inout [Int], _ visited: inout Set<Int>) -> (Int, Int) {
	var currentMinDistance = Int.max
	var vertex = -1

	for vertexIdx in 0 ..< distances.count {
		let distance = distances[vertexIdx]
		if visited.contains(vertexIdx) {
			continue
		}

		if distance <= currentMinDistance {
			vertex = vertexIdx
			currentMinDistance = distance
		}
	}
	return (vertex, currentMinDistance)
}