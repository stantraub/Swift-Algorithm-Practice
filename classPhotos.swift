// O(nlogn) | O(1) space
func classPhotos(_ redShirtHeights: inout [Int], _ blueShirtHeights: inout [Int]) -> Bool {
    redShirtHeights.sort { $0 > $1 }
    blueShirtHeights.sort { $0 > $1 } 

    let shirtColorInfirstRow = redShirtHeights[0] < blueShirtHeights[0] ? "RED" : "BLUE"

    for i in 0 ..< redShirtHeights.count {
        let redShirtHeight = redShirtHeights[i]
        let blueShirtHeight = blueShirtHeights[i]

        if shirtColorInfirstRow == "RED" {
            if redShirtHeight >= blueShirtHeight {
                return false
            }
        } else {
            if blueShirtHeight >= redShirtHeight {
                return false
            }
        }
    }

    return true
}