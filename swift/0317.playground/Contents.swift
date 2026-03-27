//func readTwoInts() -> (Int, Int) {
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//    return (input[0], input[1])
//}
//
//// N: 本, M: 制限日数
//let (N, M) = readTwoInts()
//
////b: ほんのページ数, x: 読破日数
//var b_list: [Int] = []
//var x_list: [Int] = []
//
//for _ in 0..<N {
//    let (b, x) = readTwoInts()
//    b_list.append(b)
//    x_list.append(x)
//}
//
//var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: M + 1), count: N)
//
//for i in 0...M {
//    dp[0][i] = (x_list[0] > i) ? 0 : b_list[0]
//}
//
//for i in 1..<N {
//    for j in 0...M {
//        if j >= x_list[i] {
//            dp[i][j] = max(dp[i-1][j], dp[i-1][j - x_list[i]]+b_list[i])
//        } else {
//            dp[i][j] = dp[i-1][j]
//        }
//    }
//}
//
//print(dp[N-1][M])

func readInts() -> [Int] {
    return readLine()!.split(separator: " ").map { Int(String($0))! }
}

func readTwoInts() -> (Int, Int) {
    let ints = readInts()
    return (ints[0], ints[1])
}

func readThreeInts() -> (Int, Int, Int) {
    let ints = readInts()
    return (ints[0], ints[1], ints[2])
}

//N: 日数、X: 体力、R: 回復量
let (N, X, R) = readThreeInts()

//t: 効果、s: 消費される体力
var t_list: [Int] = []
var s_list: [Int] = []

for _ in 0..<N {
    let (t, s) = readTwoInts()
    t_list.append(t)
    s_list.append(s)
}

var dp = Array(repeating: Array(repeating: -1, count: X+1), count: N + 1)
dp[0][X] = 0

for day in 0..<N {
    for hp in 0...X {
        if dp[day][hp] == -1 { continue }
        
        let recovered = min(X, hp + R)
        dp[day+1][recovered] = max(dp[day+1][recovered], dp[day][hp])
        
        let consumed = s_list[day]
        if hp >= consumed {
            dp[day+1][hp-consumed] = max(dp[day+1][hp-consumed], dp[day][hp] + t_list[day])
        }
    }
}

print(dp[N].max()!)
