/// 只能放 Int 栈
struct IntStack {
    fileprivate var elements: [Int] = []
    
    mutating func push(_ element: Int) {
        elements.append(element)
    }
    
    mutating func pop() -> Int? {
        return elements.popLast()
    }
    
    func peek() -> Int? {
        return elements.last
    }
}

extension IntStack: CustomStringConvertible {
    
    var description: String {
        let top = "---IntStack---\n"
        let bottom = "\n--------\n"
        let elementsText = elements.reversed().map { String($0) }.joined(separator: "\n")
        
        return top + elementsText + bottom
    }
}


var intStack = IntStack()
intStack.push(1)
intStack.push(2)
intStack.push(3)
print(intStack)
intStack.pop()
intStack.peek()
intStack.pop()
intStack.pop()
intStack.push(5)
print(intStack)


/// 泛型

struct Stack<T> {
    fileprivate var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
    
    func peek() -> T? {
        return elements.last
    }
}

extension Stack: CustomStringConvertible {
    
    var description: String {
        let top = "---Stack---\n"
        let bottom = "\n--------\n"
        let elementsText = elements.map { "\($0)" }.reversed().joined(separator: "\n")
        
        return top + elementsText + bottom
    }
}

var stack = Stack<Any>()
stack.push("x")
stack.push("y")
stack.push("z")
print(stack)

/// 其他两个常用的属性
extension Stack {
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
}
