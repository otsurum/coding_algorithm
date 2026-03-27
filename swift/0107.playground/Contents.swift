//import Foundation
//
//var inputNumber = Int(readLine()!)!
//
//let coins: [Int] = [500, 100, 50, 10, 5, 1]
//var count = 0
//
//for coin in coins {
//    let countCoins = inputNumber / coin
//    count += countCoins
//    inputNumber -= countCoins * coin
//}
//
//print(count)

var inputs = ["3 4"]
@MainActor func readLine() -> String? {
    guard !inputs.isEmpty else {
        return nil
    }
    return inputs.removeFirst()
}
// for TEST

import Foundation

@MainActor func readInts() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

@MainActor func main() {
    let ab = readInts()
    let isEven = ab[0] * ab[1] % 2 == 0
    print(isEven ? "Even" : "Odd")
}

main()
