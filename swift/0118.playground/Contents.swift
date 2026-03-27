func readInts() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

func readTwoInts() -> (Int, Int) {
    let inputs = readInts()
    return (inputs[0], inputs[1])
}

func readInt() -> Int {
    Int(readLine()!)!
}

//let (N, M) = readTwoInts()
//
//
//
//var chargeTable = [[Int]]()
////0 1 2 3
////0 4 5 6
////0 7 8 9
//
//for _ in 0..<N {
//    let inputs = readInts()
//    chargeTable.append(inputs)
//}
//
//let X = readInt()
//
//var ridePlans = [(Int, Int)]()
////1 4 // 1の4駅目に移動
////3 2 // 3の2駅目
////2 2 // 2の2駅目
//
//
//
//for _ in 0..<X {
//    let plan = readTwoInts()
//    ridePlans.append(plan)
//}
//
//var nowTrain = 1
//var nowStation = 1
//var tatalCharge = 0
//
//for (trainIndex, stationIndex) in ridePlans {
//    nowTrain = trainIndex
//    let charge = abs(chargeTable[nowTrain - 1][nowStation - 1] - chargeTable[nowTrain - 1][stationIndex - 1])
//    tatalCharge += charge
//    nowStation = stationIndex
//}
//
//print(tatalCharge)

//let (N, M) = readTwoInts()
////5 3 (N, M)
//
//var pairs = [(Int, Int)]()
////1 2
////3 4
////5 3
//
//for _ in 0..<M {
//    let pair = readTwoInts()
//    pairs.append(pair)
//}
//
//var scores = Array(repeating: 1, count: N)
//
//for (winner, loser) in pairs {
//    scores[winner - 1] += scores[loser - 1]
//    scores[loser - 1] = 0
//}
//
//var winners = [Int]()
//var maxScore = 0
//for (index, score) in scores.enumerated() {
//    if score < maxScore {
//        continue
//    } else if score == maxScore {
//        winners.append(index + 1)
//    } else {
//        maxScore = score
//        winners = [index + 1]
//    }
//}
//
//for winner in winners {
//    print(winner)
//}


let (n, m) = readTwoInts()
let (h, w) = readTwoInts()
//3 2 // (n, m)
//2 4 // (h, w)

var plans = [(Int, Int, Int, Int, Int)]()
//1 2 3 4 1 h(1...2), w(3...4)を収穫、その後m(1)を追加
//1 1 1 4 2 h(1...1), w(1...4)を収穫(1, 3), (1, 4)にはm(1)が植えてあり、それを収穫する。その後m(2)を追加
//1 2 2 3 1

for _ in 0..<n {
    let input = readInts()
    plans.append((input[0], input[1], input[2], input[3], input[4]))
}

var cropCounts = Array(repeating: 0, count: m)
var field = Array(repeating: Array(repeating: 0, count: w), count: h)

for (h1, h2, w1, w2, crop) in plans {
    for h in h1...h2 {
        for w in w1...w2 {
            if field[h - 1][w - 1] > 0 {
                cropCounts[field[h - 1][w - 1] - 1] += 1
            }
            field[h - 1][w - 1] = crop
        }
    }
}

for count in cropCounts {
    print(count)
}

for row in field {
    var line = ""
    for cell in row {
        if cell > 0 {
            line += "\(cell)"
        } else {
            line += "."
        }
    }
    print(line)
}
