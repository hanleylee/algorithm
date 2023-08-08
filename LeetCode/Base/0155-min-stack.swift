/**
 # Min Stack

 ## Description

 Design a stack that supports push, pop, top, and retrieving the minimum
 element in constant time.

 Implement the `MinStack` class:

   * `MinStack()` initializes the stack object.
   * `void push(int val)` pushes the element `val` onto the stack.
   * `void pop()` removes the element on the top of the stack.
   * `int top()` gets the top element of the stack.
   * `int getMin()` retrieves the minimum element in the stack.

 **Example 1:**

     **Input**
     ["MinStack","push","push","push","getMin","pop","top","getMin"]
     [[],[-2],[0],[-3],[],[],[],[]]

     **Output**
     [null,null,null,null,-3,null,0,-2]

     **Explanation**
     MinStack minStack = new MinStack();
     minStack.push(-2);
     minStack.push(0);
     minStack.push(-3);
     minStack.getMin(); // return -3
     minStack.pop();
     minStack.top();    // return 0
     minStack.getMin(); // return -2

 **Constraints:**

   * `-231 <= val <= 231 - 1`
   * Methods `pop`, `top` and `getMin` operations will always be called on **non-empty** stacks.
   * At most `3 * 104` calls will be made to `push`, `pop`, `top`, and `getMin`.

 **Difficulty:** Easy\n
 **Link**: <https://leetcode-cn.com/problems/min-stack>

 */

import XCTest

private class MinStack {
    // 存放最小值
    private var minArr: [Int] = []
    // 存放元素
    private var valueArr: [Int] = []

    init() {}

    func push(_ val: Int) {
        valueArr.append(val)
        let previousMinValue = minArr.last ?? Int.max
        minArr.append(min(previousMinValue, val))
    }

    func pop() {
        valueArr.popLast()
        minArr.popLast()
    }

    func top() -> Int {
        return valueArr.last ?? 0
    }

    func getMin() -> Int {
        return minArr.last ?? 0
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

class TestSolution0155: XCTestCase {
    func test1() {}
}
