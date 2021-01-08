func sunsetViews(_ buildings: [Int], _ direction: String) -> [Int] {
	var res = [Int]()

	var startIdx = buildings.count - 1
	var step = -1

	if direction == "WEST" {
		startIdx = 0
		step = 1
	}

	var idx = startIdx 
	var runningMaxHeight = 0

	while idx >= 0, idx < buildings.count {
		let buildingHeight = buildings[idx]

		if buildingHeight > runningMaxHeight {
			res.append(idx)
		}

		runningMaxHeight = max(runningMaxHeight, buildingHeight)

		idx += step
	}

	if direction == "EAST" {
		res.reverse()
	}

	return res
}