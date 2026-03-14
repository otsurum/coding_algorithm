func readTwoInts() -> (Int, Int) {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    return (line[0], line[1])
}

let (m, n) = readTwoInts()

let directions: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]

func dfs(w: Int, h: Int, grid: [[Bool]], count: inout Int) {
    var grid = grid
    grid[w][h] = true
    
    var isChanged = false
    
    for (dw, dh) in directions {
        let nextW = w + dw
        let nextH = h + dh
        
        if nextW >= 0, nextW < m, nextH >= 0, nextH < n, !grid[nextW][nextH] {
            dfs(w: nextW, h: nextH, grid: grid, count: &count)
            isChanged = true
        }
    }
    
    var isCompleted = true
    if !isChanged {
        grid.forEach {
            if !$0.allSatisfy { $0 == true } {
                isCompleted = false
            }
        }
        
        if isCompleted {
            count += 1
        }
    }
}

var count = 0
var isVisited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: m)

dfs(w: 0, h: 0, grid: isVisited, count: &count)

print(count)
