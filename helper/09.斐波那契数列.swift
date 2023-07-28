//: Playground - noun: a place where people can play
// 斐波那契数列

import Foundation

func fibonacci(n: Int) -> Int {
    if n < 0 {
        return -1
    }

    if n == 0 {
        return 0
    }

    if n == 1 {
        return 1
    }

    var p1 = 0
    var p2 = 1
    var sum = 0

    for _ in 2 ... n {
        sum = p1 + p2

        p1 = p2
        p2 = sum
    }

    return sum
}

func testFibonacci() {
    assert(fibonacci(n: -10) == -1)
    assert(fibonacci(n: 0) == 0)
    assert(fibonacci(n: 1) == 1)
    assert(fibonacci(n: 2) == 1)

    assert(fibonacci(n: 3) == 2)
    assert(fibonacci(n: 4) == 3)
    assert(fibonacci(n: 5) == 5)
    assert(fibonacci(n: 6) == 8)
    assert(fibonacci(n: 7) == 13)
}

testFibonacci()
