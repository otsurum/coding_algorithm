func readTwoInts() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    return (input[0], input[1])
}

// N: 本, M: 制限日数
let (N, M) = readTwoInts()

//b: ほんのページ数, x: 読破日数
var b_list: [Int] = []
var x_list: [Int] = []

for _ in 0..<N {
    let (b, x) = readTwoInts()
    b_list.append(b)
    x_list.append(x)
}

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: M + 1), count: N)

for i in 0...M {
    dp[0][i] = (x_list[0] > i) ? 0 : b_list[0]
}

for i in 1..<N {
    for j in 0...M {
        if j >= x_list[i] {
            dp[i][j] = max(dp[i-1][j], dp[i-1][j - x_list[i]]+b_list[i])
        } else {
            dp[i][j] = dp[i-1][j]
        }
    }
}

print(dp[N-1][M])
