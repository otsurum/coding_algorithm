func readTwoInts() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    return (input[0], input[1])
}

let (N, x) = readTwoInts()

var weights: [Int] = []
var values: [Int] = []

for _ in 0..<N {
    let (w, r) = readTwoInts()
    weights.append(w)
    values.append(r)
}

// index: 魚の耐久の合計、リストの要素=魚のindex
//var dp = Array(repeating: Array(repeating: 0, count: x+1), count: N)
//
//func maxValueList(_ list1: [Int], _ list2: [Int]) -> [Int] {
//    var sum1 = 0
//    list1.forEach { sum1 += values[$0] }
//    var sum2 = 0
//    list2.forEach { sum2 += values[$0] }
//    return sum1 > sum2 ? list1 : list2
//}
//
//for i in 0...x {
//    for j in 0..<N {
//        let cost = weights[j]
//        if i + cost <= x {
//            dp[i+cost] = maxValueList(dp[i+cost], dp[i] + [j])
//        } else {
//            dp[i] = maxValueList(dp[i], dp[i-1])
//        }
//    }
//}

var dp = Array(repeating: Array(repeating: 0, count: x+1), count: N)

for w in 0...x {
    if w >= weights[0] {
        dp[0][w] = values[0]
    }
}
    

for i in 1..<N {
    for w in (0...x) {
        if w >= weights[i] {
            dp[i][w] = max(dp[i-1][w - weights[i]] + values[i], dp[i-1][w])
        } else {
            dp[i][w] = dp[i-1][w]
        }
    }
}

print(dp[N-1][x-1])
