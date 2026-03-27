func readInts() -> [Int] {
    return readLine()!.split(separator: " ").map { Int((String($0)))! }
}

func readThreeInts() -> (Int, Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int((String($0)))! }
    return (input[0], input[1], input[2])
}

let (H, W, K) = readThreeInts()

var grid = [Int]()

for _ in 0..<H {
    let input = readInts()
    grid.append(contentsOf: input)
}

// DFS to find maximum sum starting from each cell
func dfs(row: Int, col: Int, remainingMoves: Int, currentSum: Int, visited: inout [Bool]) -> Int {
    let index = row * W + col
    
    // Add current cell value
    let newSum = currentSum + grid[index]
    visited[index] = true
    
    // Base case: no more moves
    if remainingMoves == 0 {
        visited[index] = false
        return newSum
    }
    
    var maxSum = newSum
    
    // Try all 4 directions: up, down, left, right
    let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    for (dr, dc) in directions {
        let newRow = row + dr
        let newCol = col + dc
        let newIndex = newRow * W + newCol
        
        // Check bounds and if not visited
        if newRow >= 0 && newRow < H && newCol >= 0 && newCol < W && !visited[newIndex] {
            let sum = dfs(row: newRow, col: newCol, remainingMoves: remainingMoves - 1, currentSum: newSum, visited: &visited)
            maxSum = max(maxSum, sum)
        }
    }
    
    visited[index] = false
    return maxSum
}

var maxResult = 0

// Try starting from each cell
for row in 0..<H {
    for col in 0..<W {
        var visited = [Bool](repeating: false, count: H * W)
        let result = dfs(row: row, col: col, remainingMoves: K, currentSum: 0, visited: &visited)
        maxResult = max(maxResult, result)
    }
}

print(maxResult)
