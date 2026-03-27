func readInts() -> [Int] {
    readLine()!.split(separator: " ").map { Int(String($0))! }
}

func readInt() -> Int {
    Int(String(readLine()!))!
}

let N = readInt()

var zAreas: [[[Int]]] = Array(repeating: [], count: 3*N)
//(x, y, z) = (i, j, k)

//(k_1, i_1)1 1 1
//(k_1, i_2)1 1 1
//(k_1, i_3)1 1 1
//(k_2, i_1)1 1 1 // zAreas[k_2][i_1] = [1, 1, 1]
//1 1 1
//1 1 1
//1 1 1
//1 1 1
//1 1 1

for k in 0..<3*N {
    for i in 0..<3*N {
        let input = readInts()
        zAreas[k].append(input)
    }
}


//for k in 0..<3 {
//    for i in 0..<3 {
//        for j in 0..<3 {
//            maxValue += zAreas[k][i][j]
//        }
//    }
//}

var maxValue = 0
for k in 0..<N {
    for i in 0..<N {
        for j in 0..<N {
            var tmpValue = 0
            for k_o in 0..<3 {
                for i_o in 0..<3 {
                    for j_o in 0..<3 {
                        tmpValue += zAreas[k*3+k_o][i*3+i_o][j*3+j_o]
                    }
                }
            }
            
            if tmpValue > maxValue {
                maxValue = tmpValue
            }
        }
    }
}

print(maxValue)
