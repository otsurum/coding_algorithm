func readTwoInts() -> (Int, Int) {
    let inputs = readLine()!.split(separator: " ").map { Int($0)! }
    return (inputs[0], inputs[1])
}
//
//let (H, W) = readTwoInts()
//var inputStrings = [String]()
////var dotIndexes = [Int]()
//
//for _ in 0..<H {
//    let line = readLine()!.split(separator: "").map { String($0) }
//    inputStrings += line
//}
//
//var count = 0
//for i in 1..<(H-1) {
//    for j in 1..<(W-1) {
//        let index = i*W + j
//        if inputStrings[index] == "." {
//            if inputStrings[index - 1] == "#" &&
//                inputStrings[index + 1] == "#" &&
//                inputStrings[index - W] == "#" &&
//                inputStrings[index + W] == "#" &&
//                inputStrings[index - W - 1] == "#" &&
//                inputStrings[index - W + 1] == "#" &&
//                inputStrings[index + W - 1] == "#" &&
//                inputStrings[index + W + 1] == "#" {
//                count += 1
//            }
//        }
//    }
//}
//
//print(count)


func readThreeInts() -> (Int, Int, Int) {
    let inputs = readLine()!.split(separator: " ").map { Int($0)! }
    return (inputs[0], inputs[1], inputs[2])
}

func readStrings() -> [String] {
    return readLine()!.split(separator: " ").map { String($0) }
}

func readInts() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

let (H, W, N) = readThreeInts()
//var stamps = [[String]]()
var stamps = [String]()
//[
//  "abc",
//  "def",
//  "ghi",
//  "jkl"
//]

for _ in 0..<N {
    for _ in 0..<H {
        let line = String(readLine()!)
        stamps.append(line)
    }
}

let (R, C) = readTwoInts()
var canvas = [[Int]]()
//[
//  [1, 2, 1],
//  [2, 1, 2],
//  [1, 2, 1]
//]

for _ in 0..<R {
    let row = readInts()
    canvas.append(row)
}

var resultCanvas = Array(repeating: "", count: R * H)
//abcghiabc
//defjkldef
//ghiabcghi
//jkldefjkl
//abcghiabc
//defjkldef


let canvasHeight = R * H
let canvasWidth = C * W

for (i, canvasNum) in canvas.enumerated() {
    // cavasNum: [1, 2, 1]
    let canvasRowStartIndex = i * H
    for num in canvasNum {
        for h in 0..<H {
            let selectedStamp = stamps[(num-1)*H+h]
            resultCanvas[canvasRowStartIndex + h] += selectedStamp
        }
    }
}

for line in resultCanvas {
    print(line)
}
