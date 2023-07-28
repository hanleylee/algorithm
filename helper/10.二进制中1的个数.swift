//: Playground - noun: a place where people can play

import Foundation

func numberofOne(num: Int) -> Int {
    var count = 0
    var n = num
    while n != 0 {
        n = n & (n - 1) // 从最右边的1开始，每一次操作都使n的最右的一个1变成了0
        count += 1
    }

    return count
}

print(numberofOne(num: 7)) // 7
print(numberofOne(num: 0b1001)) // 9
