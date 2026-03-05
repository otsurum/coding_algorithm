func readInts() -> [Int] {
    readLine()!.split(separator: " ").map { Int(String($0))! }
}

let input = readInts()
let (N, H, W, P, Q) = (input[0], input[1], input[2], input[3], input[4])

var bestSeets: [(x: Int, y: Int)] = []
var shortestDistance: Int = Int.max

struct Pair: Hashable {
    let x: Int
    let y: Int
}

var reserved: Set<Pair> = []

//9 4 5 2 3
//1 0
//1 2
//1 3
//1 4
//2 2
//2 3
//2 4
//3 3
//3 4

for _ in 0..<N {
    let input2 = readInts()
    let (x, y) = (input2[0], input2[1])
    reserved.insert(Pair(x: x, y: y))
//    let manhattanDistance = abs(x - P) + abs(y - Q)
//    
//    if manhattanDistance == 0 {
//        continue
//    }
//    
//    if manhattanDistance < shortestDistance {
//        bestSeets = [(x: x, y: y)]
//        shortestDistance = abs(x - P) + abs(y - Q)
//    } else if manhattanDistance == shortestDistance {
//        bestSeets.append((x: x, y: y))
//    }
}

for i in 0..<H {
    for j in 0..<W {
        if !reserved.contains(Pair(x: i, y: j)) {
            let manhattanDistance = abs(i - P) + abs(j - Q)
            if manhattanDistance < shortestDistance {
                bestSeets = [(x: i, y: j)]
                shortestDistance = manhattanDistance
            } else if manhattanDistance == shortestDistance {
                bestSeets.append((x: i, y: j))
            }
        }
    }
}

for (x, y) in bestSeets {
    print("\(x) \(y)")
}

//0 3
//2 1
//3 2
