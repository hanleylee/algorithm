/**
 # Reverse Words in a String

 ## Description

 Given an input string `s`, reverse the order of the **words**.

 A **word** is defined as a sequence of non-space characters. The **words** in
 `s` will be separated by at least one space.

 Return _a string of the words in reverse order concatenated by a single
 space._

 **Note** that `s` may contain leading or trailing spaces or multiple spaces
 between two words. The returned string should only have a single space
 separating the words. Do not include any extra spaces.

 **Example 1:**

     **Input:** s = "the sky is blue"
     **Output:** "blue is sky the"

 **Example 2:**

     **Input:** s = "  hello world  "
     **Output:** "world hello"
     **Explanation:** Your reversed string should not contain leading or trailing spaces.

 **Example 3:**

     **Input:** s = "a good   example"
     **Output:** "example good a"
     **Explanation:** You need to reduce multiple spaces between two words to a single space in the reversed string.

 **Constraints:**

   * `1 <= s.length <= 104`
   * `s` contains English letters (upper-case and lower-case), digits, and spaces `' '`.
   * There is **at least one** word in `s`.

 **Follow-up:  **If the string data type is mutable in your language, can you
 solve it  **in-place**  with `O(1)` extra space?

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/reverse-words-in-a-string>

 */

import XCTest

private class Solution {
    func reverseWords(_ s: String) -> String {
        var res: [Substring] = []
        var wordBegin = 0
        var parts: Substring = ""

        if let begin = s.firstIndex(where: { $0 != " " }), let end = s.lastIndex(where: { $0 != " " }) {
            parts = s[begin ... end]
        }
        var partArr = Array(parts)

        for i in 1 ..< parts.count {
            if partArr[i] != " " && partArr[i - 1] == " " { // begin of word
                wordBegin = i
            } else if partArr[i] == " " && partArr[i - 1] != " " { // end of word
                let startIndex = parts.index(parts.startIndex, offsetBy: wordBegin)
                let endIndex = parts.index(parts.startIndex, offsetBy: i)
                let part = s[startIndex ..< endIndex]
                res.append(part)
            }
        }

        let startIndex = parts.index(parts.startIndex, offsetBy: wordBegin)
        let part = s[startIndex ..< parts.endIndex]
        res.append(part)

        var resStr: Substring = ""

        while !res.isEmpty {
            if let last = res.popLast() {
                if !resStr.isEmpty {
                    resStr += " "
                    resStr += last
                } else {
                    resStr += last
                }
            }
        }

        return String(resStr)
    }

    func reverseWords2(_ s: String) -> String {
        return s.split(separator: " ").reversed().joined(separator: " ")
    }
}

class TestSolution0151: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().reverseWords("  hello world  "), "world hello")
    }

    func test2() {
        XCTAssertEqual(Solution().reverseWords("the sky is blue"), "blue is sky the")
    }

    func test3() {
        XCTAssertEqual(Solution().reverseWords("a good example"), "example good a")
    }

    func test4() {
        XCTAssertEqual(Solution().reverseWords("a"), "a")
    }
}
