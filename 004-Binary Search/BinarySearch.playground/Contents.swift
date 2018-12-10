let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

// range 左闭右开
func binarySearch(_ a: [Int], key: Int, range: Range<Int>) -> Int? {
    
    if range.lowerBound >= range.upperBound {
        return nil
    } else {
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        let midValue = a[midIndex]
        print("\(midIndex) -- \(midValue)")
        if key < midValue {
            // Is the search key in the left half?
            return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
        } else if key > midValue {
            // Is the search key in the right half?  +1 的原因是：排除这个边界值
            return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
        } else {
            return midIndex
        }
    }
}

binarySearch(numbers, key: 1, range: 0..<numbers.count)


func binarySearch(_ a: [Int], key: Int) -> Int? {
    var lowerBound = 0
    var upperBound = a.count
    while lowerBound < upperBound {
        // 这行僵硬了 没有必要的
        var range = lowerBound ..< upperBound
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        let midValue = a[midIndex]
        if key < midValue {
            upperBound = midIndex
        } else if key > midValue {
            lowerBound = midIndex + 1
        } else {
            return midIndex
        }
    }
    return nil
}

binarySearch(numbers, key: 1)
binarySearch(numbers, key: 3)
binarySearch(numbers, key: 67)
