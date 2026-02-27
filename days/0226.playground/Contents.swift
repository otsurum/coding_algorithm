func readTwoInts() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    return (input[0], input[1])
}

func readStrings() -> [String] {
    Array(readLine()!).map { String($0) }
}

enum Color: String {
    case red = "R"
    case green = "G"
    case blue = "B"
}

let (H, W) = readTwoInts()
//5 5

var grid: [[String]] = []
//RRRGG
//RRRGG
//BBBBB
//RRGGG
//GRGGG


// result(R, G, B)
//2 3 1

for _ in 0..<H {
    let inputStrings = readStrings()
    grid.append(inputStrings)
}

struct UnionFind {
    var parent: [[(w: Int, h: Int)]]
    
    mutating func union(w1: Int, h1: Int,w2: Int, h2: Int) {
        let (wRoot, hRoot) = find(w1, h1)
        parent[w2][h2] = (wRoot, hRoot)
        
//        let (xRoot, yRoot) = find(x, y)
//        let yRoot = find(y)
//        parent[xRoot][yRoot] = 1
    }
    
    mutating func find(_ cw: Int, _ ch: Int) -> (pw: Int, ph: Int) {
        var cw = cw
        var ch = ch
        while parent[ch][cw] != (cw, ch) {
            cw = parent[ch][cw].w
            ch = parent[ch][cw].h
        }
        return (cw, ch)
    }
}

let directions: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]

func searchSameArea(w: Int, h: Int, color: String, visited: inout [[Bool]], grid: [[String]]) {
    visited[h][w] = true
    for (dx, dy) in directions {
        var nx = w + dx
        var ny = h + dy
        
        if nx >= 0, nx < W, ny >= 0, ny < H {
            if !visited[ny][nx] , grid[ny][nx] == color {
                searchSameArea(w: nx, h: ny, color: color, visited: &visited, grid: grid)
            }
        }
    }
}


var uf = UnionFind(parent: Array(repeating: Array(repeating: (0, 0), count: W), count: H))
var visited = Array(repeating: Array(repeating: false, count: W), count: H)

var colorsCount: [Color: Int] = [:]

for h in 0..<H {
    for w in 0..<W {
        if visited[h][w] { continue }
        let color = grid[h][w]
        searchSameArea(w: w, h: h, color: grid[h][w], visited: &visited, grid: grid)
        colorsCount[Color(rawValue: color)!, default: 0] += 1
    }
}

print(colorsCount[.red, default: 0],
      colorsCount[.green, default: 0],
      colorsCount[.blue, default: 0])
