func readTwoInts() -> (Int, Int) {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    return (line[0], line[1])
}

//let (H, W) = readTwoInts()
//// 7, 6
//
//var grid = [[String]]()
//var sHeight: Int = -1
//var sWidth: Int = -1
//
//for y in 0..<H {
//    let input = readLine()!.split(separator: "").map { String($0) }
//    if input.contains(where: { $0 == "S" }) {
//        sHeight = y
//    }
//    grid.append(input)
//}
//
//for (x, mass) in grid[sHeight].enumerated() {
//    if mass == "S" {
//        sWidth = x
//    }
//}
//
////    ......
////    ......
////    .####.
////    #..S.#
////    #....#
////    .####.
////    ......
//
//let directions: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
//
//func dfs(mass: [[String]], _ x: Int, _ y: Int, visited: inout [[Bool]]) {
//    visited[y][x] = true
//    for (dx, dy) in directions {
//        let newX = x + dx
//        let newY = y + dy
//        if newX >= 0, newX < W, newY >= 0, newY < H {
//            if mass[newY][newX] == ".", !visited[newY][newX] {
//                dfs(mass: mass, newX, newY, visited: &visited)
//            }
//        }
//    }
//}
//
//var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: W), count: H)
//dfs(mass: grid, sWidth, sHeight, visited: &visited)
//
//var canReachOut = false
//
//for y in 0..<H {
//    if y == 0 || y == H - 1 {
//        for x in 0..<W {
//            if visited[y][x] {
//                canReachOut = true
//            }
//        }
//        
//        if canReachOut {
//            break
//        }
//    }
//    
//    if visited[y][0] || visited[y][W - 1] {
//        canReachOut = true
//        break
//    }
//}
//
//if canReachOut {
//    print("YES")
//} else {
//    print("NO")
//}

func readInt() -> Int {
    return Int(readLine()!)!
}

let N = readInt()
let (A, B) = readTwoInts()

var visited = Array(repeating: false, count: N+1)

func dfs(_ now: Int, visited: inout [Bool]) {
    if now > N {
        visited[N] = true
    } else if visited[now]{

    } else {
        visited[now] = true
        let (nextStep1, nextStep2) = (now + A, now + B)
        dfs(nextStep1, visited: &visited)
        dfs(nextStep2, visited: &visited)
    }
}

dfs(0, visited: &visited)
var count = 0

for v in visited {
    if !v {
        count += 1
    }
}

print(count)
