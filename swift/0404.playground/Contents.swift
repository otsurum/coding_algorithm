func readInt() -> Int {
    Int(readLine()!)!
}

func readInts() -> [Int] {
    readLine()!.split(separator: " ").map { Int(String($0))! }
}

let N = readInt()
let days = readInts()
// 0: 休日, 1: 平日

var daysStack: [Int] = []

for i in 0..<7 {
    daysStack.append(days[i])
}


var holidayCount = 0

var isOkayDays: [Bool] = Array(repeating: false, count: N)

//1 1 1 1 1 0 0
daysStack.forEach {
    if $0 == 0 {
        holidayCount += 1
    }
}

if holidayCount >= 2 {
    isOkayDays[0..<7] = ArraySlice(repeating: true, count: 7)
}

//1 1 1 1 1 0 0
for i in 1..<(N-6) {
    let removeDay = daysStack.removeFirst()
    let addDay = days[i+6]
    
    if removeDay == 0 {
        holidayCount -= 1
    }
    
    if addDay == 0 {
        holidayCount += 1
    }
    
    daysStack.append(addDay)
    
    if holidayCount >= 2 {
        isOkayDays[i..<(i+7)] = ArraySlice(repeating: true, count: 7)
    }
}

let count = isOkayDays.filter { $0 }.count
print(count)
