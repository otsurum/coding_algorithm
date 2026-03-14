func readInts() -> [Int] {
  let line = readLine()!.split(separator: " ").map { Int(String($0))! }
  return line
}

let line = readInts()
let (n, k) = (line[0], line[1])
// n: 果実の数、a_i: 最初の習熟度, b_i: 1日ごとの習熟度
// k: 目標習熟度

var a_list = readInts()
let b_list = readInts()

let need = (n + 1) / 2
var days: [Int] = []

for i in 0..<n {
  let a = a_list[i]
  let b = b_list[i]

  if a >= k {
    days.append(0)
  } else if b > 0 {
    let d = (k - a + b - 1) / b
    days.append(d)
  }
}

days.sort()
print(days[need - 1])
