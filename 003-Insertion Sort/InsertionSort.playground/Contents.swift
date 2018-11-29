// Sort an array from low to high (or high to low).


let array = [2, 1, 3, 8, 3, 5, 4]

var newArray = [Int]()
for (k, v) in array.enumerated() {
    for (nK, nV) in newArray.enumerated() {
        // 本次的数 小于 存在的数的第一个(nv)
        if v < nV {
            newArray.insert(v, at: nK)
            break
        }
    }
    // 没有插入成功 放在末尾
    if newArray.count < k + 1 {
        newArray.append(v)
    }
}

print(newArray)

/// 交换排序
print("-- 交换排序 --")
var a = array
for x in 1..<a.count {
    var y = x
    while y > 0 && a[y - 1] > a[y] {
        a.swapAt(y, y - 1)
        print(a)
        y -= 1
    }
}
print(a)

/// 冒泡
print("-- 冒泡 --")
func insertionSort(_ array: [Int]) -> [Int] {
    var a = array
    for x in 1..<a.count {
        var y = x
        let value = a[y]
        // 下面 注意错误 a[y]
        while y > 0 && a[y - 1] > value {
            // 后面的值向上移动
            a[y] = a[y - 1]
            y -= 1
            print("--\(a)")
        }
        a[y] = value
    }
    return a
}

print(insertionSort(array))

func insertionSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]
        while y > 0, isOrderedBefore(temp, a[y - 1])  {
            a[y] = a[y - 1]
            y -= 1
        }
        a[y] = temp
    }
 
    return a
}

let numbers = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
insertionSort(numbers, <)
insertionSort(numbers, >)

