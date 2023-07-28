//: Playground - noun: a place where people can play
// 把字符串中每个空格替换成 "%20"，例如输入 "We are happy"，则输出"We%20are%20happy"
import Foundation
import XCTest

func replaceBlank(str: String) -> String {
    // 1. 得到多少个 空格
    var blankCount = 0
    for c in str.characters {
        if c == " " {
            blankCount += 1
        }
    }

    if blankCount == 0 {
        return str
    }

    // 2. 有多少个 空格 必然数组会增大 多少＊2
    let charCount = str.characters.count + blankCount * 2
    var chars = [Character](count: charCount, repeatedValue: "X")

    var p1 = 0
    var p2 = 0
    while p1 < str.characters.count {
        // 3. 是空格copy"%20"并且长度会多2个 不是则 直接copy字符
        if str[str.startIndex.advancedBy(p1)] == " " {
            chars[p2 ... p2 + 2] = ["%", "2", "0"]
            p2 += 2
        } else {
            chars[p2] = str[str.startIndex.advancedBy(p1)]
        }

        p1 += 1
        p2 += 1
    }

    return String(chars)
}

func testReplaceBlank() {
    var src = "We are happy"
    var result = replaceBlank(src)
    assert(result == "We%20are%20happy")

    src = " are happy"
    result = replaceBlank(src)
    assert(result == "%20are%20happy")

    src = "We are "
    result = replaceBlank(src)
    assert(result == "We%20are%20")

    src = "Wearehappy"
    result = replaceBlank(src)
    assert(result == "Wearehappy")

    src = ""
    result = replaceBlank(src)
    assert(result == "")

    src = " "
    result = replaceBlank(src)
    assert(result == "%20")

    src = "   "
    result = replaceBlank(src)
    assert(result == "%20%20%20")
}

testReplaceBlank()
