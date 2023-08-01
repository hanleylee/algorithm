/**
 # 把字符串转换成整数 LCOF

 ## Description

 English description is not available for the problem. Please switch to
 Chinese.

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/ba-zi-fu-chuan-zhuan-huan-cheng-zheng-shu-lcof>

 */

import XCTest

// Fuck, 操蛋的测试用例
private class Solution {
    func strToInt(_ s: String) -> Int {
        var res = 0
        var sign = 1
        var signFound = false
        var digitFound = false
        for char in s {
            if char == " " {
                if digitFound || signFound {
                    break
                }
                continue
            }
            if char == "-" || char == "+" {
                if signFound || digitFound {
                    break
                }
                sign = char == "-" ? -1 : 1
                signFound = true
                continue
            }
            guard let digit = char.wholeNumberValue else { break }
            digitFound = true
            if res * 10 + digit > Int(Int32.max) {
                res = Int(Int32.max)
                res += (sign < 0 ? 1 : 0) // Int32.min 个位是8 whereas Int32.max个位是7
                break
            }
            res = res * 10 + digit
        }
        return res * sign
    }

    func strToInt2(_ s: String) -> Int {
        enum TOIState {
            case start, num, end
        }

        var characters: [Character] = []
        var state = TOIState.start
        var isNegative = false
        for c in s {
            if c.isWhitespace && state == .start {
                continue
            } else if c == "-" && state == .start {
                state = .num
                isNegative = true
            } else if c == "+" && state == .start {
                state = .num
                isNegative = false
            } else if c.isNumber {
                if state == .num {
                    characters.append(c)
                } else if state == .start {
                    state = .num
                    isNegative = false
                    characters.append(c)
                } else {
                    state = .end
                    break
                }
            } else {
                state = .end
                break
            }
        }
        guard characters.count > 0 else { return 0 }
        var num = Int(String(characters)) ?? Int.max
        if isNegative {
            num = -num
            if num < Int32.min {
                return Int(Int32.min)
            }
        }
        if num > Int32.max {
            return Int(Int32.max)
        }
        return num
    }
}

class TestSolution剑指Offer67: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().strToInt("42"), 42)
        XCTAssertEqual(Solution().strToInt("      -42"), -42)
        XCTAssertEqual(Solution().strToInt("4193 with words"), 4193)
        XCTAssertEqual(Solution().strToInt("words and 987"), 0)
        XCTAssertEqual(Solution().strToInt("-91283472332"), Int(Int32.min))
        XCTAssertEqual(Solution().strToInt("-000000000000000000000000000000000000000000000000001"), -1)
    }
}
