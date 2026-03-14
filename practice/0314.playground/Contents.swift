func readInt() -> Int {
    return Int(readLine()!)!
}



enum Command: String {
    case MOVE
    case QUERY_EAST
    case QUERY_NORTH
}

let N = readInt()

var eastPassedLog: [Int] = [0]
var northPassedLog: [Int] = [0]

var nowEastPosition = 0
var nowNorthPosition = 0

func passedCount(point: Int, log: [Int]) -> Int {
    var copyLog = log
    var nowPoint = copyLog.removeFirst()
    
    var passCount = 0
    for log in copyLog {
        if log > nowPoint {
            if nowPoint < point && log >= point {
                passCount += 1
            }
        } else {
            if nowPoint > point && log <= point {
                passCount += 1
            }
        }
        
        nowPoint = log
    }
    
    return passCount
}

for _ in 0..<N {
    let commandString = String(readLine()!)
    if commandString.hasPrefix(Command.MOVE.rawValue) {
        let parts = commandString.split(separator: " ")
        let a = Int(parts[1])!
        let b = Int(parts[2])!
        
        nowEastPosition += a
        nowNorthPosition += b

        eastPassedLog.append(nowEastPosition)
        northPassedLog.append(nowNorthPosition)
    } else if commandString.hasPrefix(Command.QUERY_EAST.rawValue) {
        let parts = commandString.split(separator: " ")
        let p = Int(parts[1])!
        
        let count = passedCount(point: p, log: eastPassedLog)
        print(count)
    } else {
        let parts = commandString.split(separator: " ")
        let q = Int(parts[1])!
        
        let count = passedCount(point: q, log: northPassedLog)
        print(count)
    }
}
