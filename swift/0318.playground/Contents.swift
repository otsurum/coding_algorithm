func readTwoInts() -> (Int, Int) {
    let line = readInts()
    return (line[0], line[1])
}

func readInts() -> [Int] {
    readLine()!.split(separator: " ").map { Int(String($0))! }
}

let (N, L) = readTwoInts()

var stones = [[Int]]()

for _ in 0..<N {
    let input = readInts()
    stones.append(input)
}

func canIdentify(_ features: [Int]) -> Bool {
    var seen = Set<[Int]>()
    
    for stone in stones {
        let identifiedFeatures = features.map { stone[$0] }
        if seen.contains(identifiedFeatures) {
            return false
        }
        seen.insert(identifiedFeatures)
    }
    return true
}
