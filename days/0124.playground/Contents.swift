import Foundation

// --- 入力部分 ---
func readInt() -> Int {
    return Int(readLine()!)!
}

func readTwoInts() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    return (input[0], input[1])
}

let _ = readLine()
let (L, R) = readTwoInts()
let S = readLine()!


var alphabetList = [String]()
var numberList = [Int]()

var tempNumberString: String = ""

for char in S {
    if let integer = Int(String(char)) {
        tempNumberString += String(char)
    } else {
        if !tempNumberString.isEmpty {
            numberList.append(Int(tempNumberString) ?? 0)
            tempNumberString = ""
        }
        alphabetList.append(String(char))
    }
}

if !tempNumberString.isEmpty {
    numberList.append(Int(tempNumberString)!)
}

var currentPos = 1 // 現在何文字目まで処理したか (1-indexed)
var result = ""

for (i, char) in alphabetList.enumerated() {
    let count = numberList[i]
    let sectionStart = currentPos
    let sectionEnd = currentPos + count - 1
    
    // 現在のセクション(L...R)が、求めたい範囲と重なっているか判定
    let overlapStart = max(L, sectionStart)
    let overlapEnd = min(R, sectionEnd)
    
    if overlapStart <= overlapEnd {
        // 重なっている文字数分だけ連結
        let repeatCount = overlapEnd - overlapStart + 1
        result += String(repeating: char, count: repeatCount)
    }
    
    currentPos += count
    
    // R文字目まで取得し終わったらループを抜ける（効率化）
    if currentPos > R { break }
}

print(result)
