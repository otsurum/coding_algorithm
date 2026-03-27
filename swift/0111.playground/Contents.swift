func readInt() -> Int {
    Int(readLine()!)!
}

func readLines() -> [String] {
    readLine()!.split(separator: " ").map { String($0) }
}

//let S = String(readLine()!)
//let N = readInt()
//
//for _ in 0..<N {
//    let inputs = readLines()
//    var isNotFOund = true
//    for word in inputs {
//        if word.contains(S) {
//            print("Yes")
//            isNotFOund = false
//            break
//        }
//    }
//    if isNotFOund {
//        print("No")
//    }
//}

func readInts() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

let inputs = readInts()
let (N, K) = (inputs[0], inputs[1])

var numberOnCard = [(Int, Bool)]()

for _ in 0..<N {
    let row = readInts()
    for number in row {
        numberOnCard.append((number, false))
    }
}

numberOnCard[(N*N-1)/2] = (0, true)

var calledNumbers = readInts()
//var calledNumberIndexs = Set<Int>()

for number in calledNumbers {
    if let index = numberOnCard.firstIndex(where: { $0.0 == number }) {
        numberOnCard[index].1 = true
//        calledNumberIndexs.insert(index)
    }
}


var countBingo = 0
// 縦
for i in 0..<N {
    var allMarked = true
    for row in 0..<N {
        if !numberOnCard[row * N + i].1 {
            allMarked = false
            break
        }
    }
    if allMarked {
        countBingo += 1
    }
}
// 横
for i in 0..<N {
    var allMarked = true
    for col in 0..<N {
        if !numberOnCard[i*N + col].1 {
            allMarked = false
            break
        }
    }
    if allMarked {
        countBingo += 1
    }
}

// 斜め
var allMarked = true
for i in 0..<N {
    if !numberOnCard[i*N + i].1 {
        allMarked = false
        break
    }
}
if allMarked {
    countBingo += 1
}


allMarked = true
for i in 0..<N {
    if !numberOnCard[i*N + (N-1) - i].1 {
        allMarked = false
        break
    }
}
if allMarked {
    countBingo += 1
}

print(countBingo)
