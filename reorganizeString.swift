func reorganizeString(_ S: String) -> String {
    var sArr = Array(S)
    var hashMap: [Character: Int] = [:]
    let arrCount = sArr.count
    
    for c in sArr {
        hashMap[c] = (hashMap[c] ?? 0 ) + 1
    }
    
    let sorted = hashMap.sorted(by: {
        $0.value > $1.value
    })
    
    var currentIndex: Int = 0
    
    for (key,_) in sorted {
        for i in 0..<hashMap[key]! {
            sArr[currentIndex] = key
            currentIndex += 2
            if currentIndex >= arrCount {
                currentIndex = 1
            }
        }
    }
    
    //Test if no same letters exists together
    for i in 0..<arrCount-1 {
        if sArr[i] == sArr[i+1] {
            return ""
        }
    }
    
    return String(sArr)
    
}