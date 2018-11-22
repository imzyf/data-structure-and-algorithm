/// 队列 - 先进先出 - 自己实现
struct MyQueue<T> {
    
    fileprivate var array = [T]()
 
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard array.count > 0  else {
            return nil
        }
        return array.remove(at: 0)
    }
    
    func peek() -> T? {
        return array.first
    }
}

extension MyQueue: CustomDebugStringConvertible {
    
    var debugDescription: String {
        return array.description
    }
}

var myQueue = MyQueue<Int>()
myQueue.enqueue(10)
myQueue.enqueue(3)
myQueue.enqueue(57)
print(myQueue)
myQueue.dequeue()
myQueue.dequeue()
print(myQueue)
myQueue.enqueue(66)
myQueue.peek()


public struct Queue<T> {
    
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        // 使用数组自身的方法，而不是 array.count > 0
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        // 使用定义的变量
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
    
    /// peek() 改为更有语义话的只读变量
    public var front: T? {
        return array.first
    }
}


/// 优化 队列 的出队
public struct OptimizedQueue<T> {
    
    /// 这里改为了可选型，为了可以清理无效的元素
    fileprivate var array = [T?]()
    /// 起始索引
    fileprivate var head = 0
    
    public var count: Int {
        // 减去 起始索引 前面的数量
        return array.count - head
    }
    
    public var isEmpty: Bool {
        // 根据实际数量判断
        return count == 0
    }
    
    // 保持不变
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count,
            let element = array[head] else {
            return nil
        }
        // 置空当前位置元素
        array[head] = nil
        // 前移起始索引
        head += 1
        
        // 空索引的占用比例
        let percentage = Double(head)/Double(array.count)
        // 50 0.25 都是魔法数字，主要是为了控制数组修剪的频率，可以自行调整
        if array.count > 50 && percentage > 0.25 {
            // 将起始空元素删除
            array.removeFirst(head)
            // 重置 起始索引
            head = 0
        }
        
        return element
    }
    
    public var front: T? {
        if isEmpty {
            return nil
        } else {
            // 根据 起始索引进行 返回
            return array[head]
        }
    }
}
