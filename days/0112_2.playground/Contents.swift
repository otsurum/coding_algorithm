func readInts() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

func readTwoInts() -> (Int, Int) {
    let inputs = readInts()
    return (inputs[0], inputs[1])
}

let (N, K) = readTwoInts()

var lowestPrices = Array(repeating: (Int.max, [Int]()), count: K)

var shopPrices = [[Int]]()

for index in 0..<N {
    let prices = readInts()
    shopPrices.append(prices)
    
    for i in 0..<K {
        if lowestPrices[i].0 > prices[i] {
            lowestPrices[i].0 = prices[i]
            lowestPrices[i].1 = [index]
        }
        
        if lowestPrices[i].0 == prices[i] {
            lowestPrices[i].1.append(index)
        }
    }
}

var shopsNeetToVisit = Set<Int>()

for i in 0..<K {
    let shopIndexes = lowestPrices[i].1
    if shopIndexes.count == 1 {
        shopsNeetToVisit.insert(shopIndexes[0])
        continue
    }
    
    var tempPrices = [[Int]]()
    
    for shopIndex in shopIndexes {
        tempPrices.append(shopPrices[shopIndex])
    }
    
    var highestShopIndexes = [Int]()
    for i in 0..<K {
        var highestPrice = Int.min
        var tempHighestShopIndexes = Set<Int>()
        for  shopIndex in shopIndexes {
            let price = shopPrices[shopIndex][i]
            if price > highestPrice {
                highestPrice = price
                tempHighestShopIndexes = [shopIndex]
            } else if price == highestPrice {
                tempHighestShopIndexes.insert(shopIndex)
            }
        }
        
        for index in tempHighestShopIndexes {
            highestShopIndexes.append(<#T##newElement: Int##Int#>)
        }
    }
}

print(shopsNeetToVisit.count)
