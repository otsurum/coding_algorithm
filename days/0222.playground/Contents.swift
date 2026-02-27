func readInt() -> Int {
    Int(String(readLine()!))!
}

func readThreeInts() -> (Int, Int, Int) {
    let line = readLine()!.split(separator: " ")
    return (Int(String(line[0]))!, Int(String(line[1]))!, Int(String(line[2]))!)
}

func canPut(under: (Int, Int), over: (Int, Int)) -> Bool {
    if under.0 >= over.0 && under.1 >= over.1 {
        return true
    } else if under.0 >= over.1 && under.1 >= over.0 {
        return true
    }
    return false
}

let N = readInt()

var items: [(h: Int, w: Int, d: Int)] = []

for _ in 0..<N {
    let (hi, wi, di) = readThreeInts()
    items.append( (hi, wi, di) )
}

items.sort(by: { ($0.w*$0.d) > ($1.w*$1.d)})

var dp = Array(repeating: 0, count: N)
var maxHeight: Int = 0

for i in 0..<N {
    dp[i] = items[i].h
    for j in 0..<i {
        if canPut(under: (items[j].h, items[j].w), over: (items[i].h, items[i].w)) {
            dp[i] = max(dp[i], dp[j]+items[i].h)
        }
    }
    maxHeight = max(maxHeight, dp[i])
}

print(maxHeight)
