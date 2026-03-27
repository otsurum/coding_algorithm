// ナップサック問題


import Foundation

func readInt() -> Int { Int(readLine()!)! }

let N = readInt()

var grid = Array(repeating: Array(repeating: 0, count: N), count: N)
for y in 0..<N {
    let chars = Array(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))
    for x in 0..<N {
        grid[y][x] = Int(String(chars[x]))!
    }
}

// 4方向だけ見れば全一直線をカバーできる（反対向きは始点が変わるだけ）
let dirs = [(1,0), (0,1), (1,1), (-1,1)]  // 右, 下, 右下, 左下

// dp[dirIndex][y][x] = (x,y) を終点にした、その方向の最長スワイプ長
var dp = Array(
    repeating: Array(repeating: Array(repeating: 1, count: N), count: N),
    count: dirs.count
)

var ans = 1

for (k, (dx, dy)) in dirs.enumerated() {
    // (x,y) の “1つ前” は (x-dx, y-dy)
    for y in 0..<N {
        for x in 0..<N {
            let px = x - dx
            let py = y - dy
            if px >= 0, py >= 0, px < N, py < N {
                // 連続（±1）なら伸ばせる
                if abs(grid[y][x] - grid[py][px]) == 1 {
                    dp[k][y][x] = dp[k][py][px] + 1
                }
            }
            ans = max(ans, dp[k][y][x])
        }
    }
}

print(ans)
