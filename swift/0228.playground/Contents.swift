import Foundation

func readInt() -> Int {
    return Int(String(readLine()!))!
}

func readInts() -> [Int] {
    return readLine()!.split(separator: " ").map { Int(String($0))! }
}

@inline(__always)
func gcd(_ a: Int, _ b: Int) -> Int {
    var x = abs(a), y = abs(b)
    while y != 0 {
        let t = x % y
        x = y
        y = t
    }
    return x
}

// 比を「既約分数 (num, den)」または 0 特殊ケースで表現
// den==0 を含む特殊値も使う（0の連続などを正しく扱う）
struct Ratio: Equatable {
    let num: Int
    let den: Int
}

func makeRatio(_ a: Int, _ b: Int) -> Ratio {
    // a -> b の比 = b/a
    if a == 0 {
        if b == 0 {
            // 0 -> 0 は「ゼロ連続」扱い
            return Ratio(num: 0, den: 0)
        } else {
            // 0 -> 非0 は等比が続かない（この比自体を特別値に）
            return Ratio(num: 1, den: 0)
        }
    } else {
        if b == 0 {
            // 非0 -> 0 は比 0
            return Ratio(num: 0, den: 1)
        }
        // 一般：b/a を既約化（符号は num に寄せる）
        let g = gcd(a, b)
        var num = b / g
        var den = a / g
        if den < 0 { den = -den; num = -num }
        return Ratio(num: num, den: den)
    }
}


let N = readInt()
let array = readInts()

if N < 2 {
    print(0)
    exit(0)
}

// ratio[i] は array[i] -> array[i+1] の比
var ratios = [Ratio]()
ratios.reserveCapacity(N - 1)
for i in 0..<(N - 1) {
    ratios.append(makeRatio(array[i], array[i+1]))
}

// ratios の同値が連続する最大区間ごとに、L*(L-1)/2 を足す
// ここで L は「要素数」。ratio が k 個連続なら要素数 L = k+1
var count: Int64 = 0
var run = 1  // 連続する ratio の長さ（個数）
for i in 1..<ratios.count {
    if ratios[i] == ratios[i-1] {
        run += 1
    } else {
        let L = Int64(run + 1)
        count += L * (L - 1) / 2
        run = 1
    }
}
// 最後の run
let L = Int64(run + 1)
count += L * (L - 1) / 2

print(count)
