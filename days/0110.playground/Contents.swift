func readInt() -> Int {
    Int(readLine()!)!
}

//let n = readInt()
//let a = readInt()
//let b = readInt()
//
//print(a+b-n)


func readInts() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

//let N = readInt()
//var mass = [[Int]]()
//
//for _ in 0..<N {
//    let row = readInts()
//    mass.append(row)
//}
//
//var count = 0
//let roopCount = (N-1)/2
//
//func pyramidMatrix(_ N: Int) -> [[Int]] {
//    precondition(N % 2 == 1 && N >= 1)
//    return (0..<N).map { i in
//        (0..<N).map { j in
//            let layer = min(i, j, N - 1 - i, N - 1 - j)
//            return layer + 1
//        }
//    }
//}
//
//let pyramid = pyramidMatrix(N)
//
//for i in 0..<N {
//    for j in 0..<N {
//        count += abs(mass[i][j] - pyramid[i][j])
//    }
//}
//
//print(count)

enum Hand: String {
    case G
    case C
    case P
}

let N = readInt()
var pairs = [(String, String)]()

for _ in 0..<N {
    let pair = readLine()!.split(separator: " ").map { String($0) }
    pairs.append((pair[0], pair[1]))
}

var count = 0

for pair in pairs {
    let playerA = pair.0
    let playerB = pair.1
    
    if playerA == Hand.G.rawValue {
        if playerB == Hand.C.rawValue {
            count += 1
        }
        continue
    }
    
    if playerA == Hand.C.rawValue {
        if playerB == Hand.P.rawValue {
            count += 1
        }
        continue
    }
    
    if playerA == Hand.P.rawValue {
        if playerB == Hand.G.rawValue {
            count += 1
        }
        continue
    }
}

print(count)
