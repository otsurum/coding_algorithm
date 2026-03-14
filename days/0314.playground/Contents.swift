func readInt() -> Int {
    return Int(readLine()!)!
}

func readTwoInts() -> (Int, Int) {
    let line = readLine()!.split(separator: " ")
    return (Int(line[0])!, Int(line[1])!)
}

func readInts() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

//let (H, W) = readTwoInts()
//let N = readInt()
//
//var grid = Array(repeating: Array(repeating: 0, count: W), count: H)
//
//let directions: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0), (-1, -1), (-1, 1), (1, -1), (1, 1)]
//
////10 10
////5
////2 2 4 2
////3 9 3 1
////5 5 6 3
////8 3 4 1
////9 7 3 1
////5
////5 5
////2 8
////7 7
////3 3
////8 3
//
//for _ in 0..<N {
//    let line = readInts()
//    let (r, c, p, q) = (line[0] - 1, line[1] - 1, line[2], line[3])
//    
//    grid[r][c] = p
//
//    for (dx, dy) in directions {
//        let ny = r + dy
//        let nx = c + dx
//        
//        if ny >= 0 && ny < H && nx >= 0 && nx < W {
//            grid[ny][nx] = q
//        }
//    }
//}
//
//let M = readInt()
//
//var sum = 0
//for _ in 0..<M {
//    let (a, b) = readTwoInts()
//    sum += grid[a - 1][b - 1]
//}
//
//print(sum)



//4 4
//....
//.#..
//..#.
//....
//

let (H, W) = readTwoInts()

func readString() -> String {
    String(readLine()!)
}

var grid = Array(repeating: [String](), count: H)

for h in 0..<H {
    let line = readString()
    for char in line {
        grid[h].append(String(char))
    }
}

var visited = Array(repeating: Array(repeating: false, count: W), count: H)

let directions: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]

func dfs(h: Int, w: Int, visited: inout [[Bool]], grid: [[String]], mass: inout Int, length: inout Int) {
    visited[h][w] = true
    mass += 1
    for (dh, dw) in directions {
        let nh = h + dh
        let nw = w + dw
        
        if nh >= 0 && nh < H && nw >= 0 && nw < W && !visited[nh][nw] {
            if grid[nh][nw] == "#" {
                dfs(h: nh, w: nw, visited: &visited, grid: grid, mass: &mass, length: &length)
            } else {
                length += 1
            }
        }
        
        if nh >= 0 && nh < H && nw >= 0 && nw < W {} else {
            length += 1
        }
    }
}

// mass & length
func search(h: Int, w: Int, visited: inout [[Bool]], grid: [[String]]) -> (Int, Int) {
    var mass = 0
    var length = 0
    dfs(h: h, w: w, visited: &visited, grid: grid, mass: &mass, length: &length)
    
    return (mass, length)
}

var islandInfo: [(Int, Int)] = []
for h in 0..<H {
    for w in 0..<W {
        if !visited[h][w], grid[h][w] == "#" {
            let (mass, length) = search(h: h, w: w, visited: &visited, grid: grid)
            islandInfo.append((mass, length))
        }
    }
}

islandInfo.sort {
    if $0.0 == $1.0 {
        return $0.1 > $1.1
    }
    return $0.0 > $1.0
}

for (mass, length) in islandInfo {
    print("\(mass) \(length)")
}
