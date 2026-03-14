func readInt() -> Int {
    Int(readLine()!)!
}

func readTwoInts() -> (Int, Int) {
    let input = readLine()!.split(separator: " ")
    return (Int(input[0])!, Int(input[1])!)
}
//
//let N = readInt()
//
//var dials: [(Int, Int)] = []
//// L: start, R: finish
////2 8
////1 7
////3 6
////4 5
//
//for _ in 0..<N {
//    let (L, R) = readTwoInts()
//    dials.append((L, R))
//}
//
//dials.sort { $0.0 < $1.0 }
//var canRun = true
//var maxR = Int.min
//
//for (i, dialA) in dials.enumerated() {
////    for (j, dialB) in dials[i+1..<N].enumerated() {
////        if dialA.1 > dialB.1 {
////            canRun = false
////            break
////        }
////    }
//    if dialA.1 < maxR {
//        canRun = false
//        break
//    }
//    maxR = dialA.1
//}
//
//if canRun {
//    print("Yes")
//} else {
//    print( "No" )
//}


let (N, M) = readTwoInts()
// N: 高さ、M：幅
let K = readInt()

var grid: [[Bool]] = Array(repeating: Array(repeating: false, count: M), count: N)

let directions: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0), (-1, -1), (1, -1), (-1, 1), (1, 1)]

//var settingsPoints: [(Int, Int)] = []

var count = 0
for _ in 0..<K {
    let input = readTwoInts()
    let (x, y) = (input.0 - 1, input.1 - 1)
    if !grid[y][x] {
        grid[y][x] = true
        count += 1
    }
    for direction in directions {
        let nextX = x + direction.0
        let nextY = y + direction.1
        
        if nextX >= 0, nextX < M, nextY >= 0, nextY < N {
            if !grid[nextY][nextX] {
                grid[nextY][nextX] = true
                count += 1
            }
        }
    }
}

print(count)
