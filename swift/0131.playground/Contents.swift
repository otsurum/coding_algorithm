func readTwoImts() -> (Int, Int) {
    let inputs = readLine()!.split(separator: " ").map { Int($0)! }
    return (inputs[0], inputs[1])
}

let directions = [(0, -1), (-1, 0), (1, 0),(0, 1)]

func dfs(grid: [[String]], _ x: Int, _ y: Int, visited: inout [[Bool]]) {
    var temp = grid
    temp[y][x] = "."
    visited[y][x] = true
    
    for (dx, dy) in directions {
        let newX = x + dx
        let newY = y + dy
        
        if newX >= 0, newX < W, newY >= 0, newY < H {
            if temp[newY][newX] == "#", !visited[newY][newX] {
                dfs(grid: temp, newX, newY, visited: &visited)
            }
        }
    }
}

func countComponents(grid: [[String]]) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: W), count: H)
    var componentCount = 0
    
    for x in 0..<W {
        for y in 0..<H {
            if grid[y][x] == "#", !visited[y][x] {
                dfs(grid: grid, x, y, visited: &visited)
                componentCount += 1
            }
        }
    }
    return componentCount
}


let (H, W) = readTwoImts()
//5 5

var mass = [[String]]()
//##...
//.#...
//###..
//###..
//#####


for _ in 0..<H {
    let input = readLine()!.split(separator: "").map { String($0) }
    mass.append(input)
}



var count = 0
for i in 0..<H {
    for j in 0..<W {
        if mass[i][j] == "." {
            count += 1
            continue
        } else if mass[i][j] == "#" {
            var tempMass = mass
            tempMass[i][j] = "."
            
            let countComponents = countComponents(grid: tempMass)
            if countComponents > 1 {
                continue
            } else {
                count += 1
            }
        }
    }
}

print(count)
