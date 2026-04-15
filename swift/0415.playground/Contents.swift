func readInt() -> Int {
    Int(String(readLine()!))!
}

func readTwoInts() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    return (input[0], input[1])
}

func readInts() -> [Int] {
    readLine()!.split(separator: " ").map { Int(String($0))! }
}

// N: 行, M: 列
let (N, M) = readTwoInts()
let K = readInt()

//3 3
//3
//1 1 20
//1 3 25
//3 3 30
//25

var grid = Array(repeating: Array(repeating: -1, count: M), count: N)
for _ in 0..<K {
    let input = readInts()
    let (R, C, T) = (input[0], input[1], input[2])
    
    grid[R-1][C-1] = T
}

let T = readInt()

// 小数点切り捨て
var notSensorPositions = [(Int, Int)]()

for n in 0..<N {
    for m in 0..<M {
        if grid[n][m] == -1 {
            notSensorPositions.append((n, m))
        }
    }
}



let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

func calculateAverage(n: Int, m: Int, grid: [[Int]]) -> Int? {
    var aroundTemperatures = [Int]()
    for direction in directions {
        let (nx, ny) = (m + direction.0, n + direction.1)
        if nx >= 0, nx < M, ny >= 0, ny < N {
            let targetTemperature = grid[ny][nx]
            if targetTemperature != -1 {
                aroundTemperatures.append(targetTemperature)
            }
        }
    }
    
    let count = aroundTemperatures.count
    
    if count == 0 {
        return nil
    } else {
        var sum = 0
        aroundTemperatures.forEach({ sum += $0 })
        return sum / count
    }
}

while !notSensorPositions.isEmpty {
    // 書き換える
    var tempGrid = grid
    var copyNotSensors = notSensorPositions
    
    for (n, m) in notSensorPositions {
        if let average = calculateAverage(n: n, m: m, grid: grid) {
            tempGrid[n][m] = average
            copyNotSensors.removeAll(where: { $0 == (n, m) })
        }
    }
    notSensorPositions = copyNotSensors
    grid = tempGrid
}

var count = 0
grid.forEach {
    $0.forEach {
        if $0 >= T {
            count += 1
        }
    }
}

print(count)
