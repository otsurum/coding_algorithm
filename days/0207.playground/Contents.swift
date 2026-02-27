func readTwoInts() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

struct DSU {
    var parent: [Int]
    var rank: [Int]

    init(_ n: Int) {
        parent = Array(0..<n)
        rank = Array(repeating: 0, count: n)
    }

    mutating func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        parent[x] = find(parent[x])
        return parent[x]
    }

    mutating func union(_ a: Int, _ b: Int) {
        var ra = find(a), rb = find(b)
        if ra == rb { return }
        if rank[ra] < rank[rb] { swap(&ra, &rb) }
        parent[rb] = ra
        if rank[ra] == rank[rb] { rank[ra] += 1 }
    }
}

let (N, R) = readTwoInts()
var xs = [Int](repeating: 0, count: N)
var ys = [Int](repeating: 0, count: N)
for i in 0..<N {
    let (x, y) = readTwoInts()
    xs[i] = x
    ys[i] = y
}

var dsu = DSU(N)
let limit = 2 * R
let limit2 = limit * limit

for i in 0..<N {
    for j in (i+1)..<N {
        let dx = xs[i] - xs[j]
        let dy = ys[i] - ys[j]
        if dx*dx + dy*dy <= limit2 {
            dsu.union(i, j)
        }
    }
}

var roots = Set<Int>()
for i in 0..<N { roots.insert(dsu.find(i)) }
print(roots.count)
