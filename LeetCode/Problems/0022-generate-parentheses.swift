/**
# Generate Parentheses

## Description

Given `n` pairs of parentheses, write a function to _generate all combinations
of well-formed parentheses_.



**Example 1:**

    
    
    **Input:** n = 3
    **Output:** ["((()))","(()())","(())()","()(())","()()()"]
    

**Example 2:**

    
    
    **Input:** n = 1
    **Output:** ["()"]
    



**Constraints:**

  * `1 <= n <= 8`



**Difficulty:** Medium\n
**Link**: <https://leetcode-cn.com/problems/generate-parentheses>

*/

import XCTest

private class Solution {
    var res: [String] = []
    func generateParenthesis(_ n: Int) -> [String] {
        dfs(remainLeft: n, remainRight: n, chars: [])

        return res
    }

    private func dfs(remainLeft: Int, remainRight: Int, chars: [Character]) {
        if remainLeft == 0 && remainRight == 0 {
            res.append(String(chars))
        }

        if remainLeft > 0 {
            var chars = chars
            chars.append("(")
            dfs(remainLeft: remainLeft - 1, remainRight: remainRight, chars: chars)
        }

        if remainRight > 0 && remainLeft != remainRight {
            var chars = chars
            chars.append(")")
            dfs(remainLeft: remainLeft, remainRight: remainRight - 1, chars: chars)
        }
    }
}

class TestSolution0022: XCTestCase {
    func test1() {
        var res = Solution().generateParenthesis(3)
        XCTAssertEqual(res.sorted(), ["((()))","(()())","(())()","()(())","()()()"].sorted())
    }
}
