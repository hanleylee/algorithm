/**
 # Letter Combinations of a Phone Number

 ## Description

 Given a string containing digits from `2-9` inclusive, return all possible
 letter combinations that the number could represent. Return the answer in
 **any order**.

 A mapping of digit to letters (just like on the telephone buttons) is given
 below. Note that 1 does not map to any letters.

 ![](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Telephone-
 keypad2.svg/200px-Telephone-keypad2.svg.png)

 **Example 1:**

     **Input:** digits = "23"
     **Output:** ["ad","ae","af","bd","be","bf","cd","ce","cf"]

 **Example 2:**

     **Input:** digits = ""
     **Output:** []

 **Example 3:**

     **Input:** digits = "2"
     **Output:** ["a","b","c"]

 **Constraints:**

   * `0 <= digits.length <= 4`
   * `digits[i]` is a digit in the range `['2', '9']`.

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number>

 */

import XCTest

private class Solution {
    private var res: [String] = []
    private var maxDepth: Int = 0
    private var digits: [Int] = []
    private let digitInfo: [[Character]] = [
        [], [], ["a", "b", "c"], ["d", "e", "f"],
        ["g", "h", "i"], ["j", "k", "l"], ["m", "n", "o"],
        ["p", "q", "r", "s"], ["t", "u", "v"], ["w", "x", "y", "z"]
    ]

    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }

        maxDepth = digits.count
        self.digits = digits.compactMap { Int(String($0)) }
        dfs(depth: 0, combo: [])

        return res
    }

    private func dfs(depth: Int, combo: [Character]) {
        if depth == maxDepth {
            res.append(String(combo))
            return
        }

        let digit = digits[depth]

        let currentLevelDigits = digitInfo[digit]

        for char in currentLevelDigits {
            var _combo = combo
            _combo.append(char)
            dfs(depth: depth + 1, combo: _combo)
        }
    }
}

class TestSolution0017: XCTestCase {
    func test1() {
        let res = Solution().letterCombinations("23").sorted()
        XCTAssertEqual(res, ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"])
    }

    func test2() {
        let res = Solution().letterCombinations("2").sorted()
        XCTAssertEqual(res, ["a", "b", "c"])
    }
}
