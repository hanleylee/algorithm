/**
# Restore IP Addresses

## Description

A **valid IP address** consists of exactly four integers separated by single
dots. Each integer is between `0` and `255` ( **inclusive** ) and cannot have
leading zeros.

  * For example, `"0.1.2.201"` and `"192.168.1.1"` are **valid** IP addresses, but `"0.011.255.245"`, `"192.168.1.312"` and `"192.168@1.1"` are **invalid** IP addresses.

Given a string `s` containing only digits, return _all possible valid IP
addresses that can be formed by inserting dots into_`s`. You are **not**
allowed to reorder or remove any digits in `s`. You may return the valid IP
addresses in **any** order.



**Example 1:**

    
    
    **Input:** s = "25525511135"
    **Output:** ["255.255.11.135","255.255.111.35"]
    

**Example 2:**

    
    
    **Input:** s = "0000"
    **Output:** ["0.0.0.0"]
    

**Example 3:**

    
    
    **Input:** s = "101023"
    **Output:** ["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]
    



**Constraints:**

  * `0 <= s.length <= 20`
  * `s` consists of digits only.



**Difficulty:** Medium\n
**Link**: <https://leetcode-cn.com/problems/restore-ip-addresses>

*/

import XCTest

private class Solution {
    var res: [String] = []

    func restoreIpAddresses(_ s: String) -> [String] {
        let intArr = s.compactMap { Int($0.asciiValue! - Character("0").asciiValue!) }

        dfs(numArr: intArr, start: 0, track: [])

        return res
    }

    private func dfs(numArr: [Int], start: Int, track: [[Character]]) {
        if start >= numArr.count && track.count == 4 {
            let str = track.map { String($0) }.joined(separator: ".")
            res.append(str)
            return
        }

        for index in start ..< numArr.count {
            let currentNums = Array(numArr[start ... index])
            if currentNums.count > 3 {
                break
            }
            if isIp(nums: currentNums) {
                var track = track
                track.append(currentNums.map { Character("\($0)") })
                dfs(numArr: numArr, start: index + 1, track: track)
            }

        }

    }

    private func isIp(nums: [Int]) -> Bool {
        guard !nums.isEmpty else { return false }
        guard nums.count <= 3 else { return false }

        if nums.count == 1 && nums[0] == 0 {
            return true
        }

        if nums[0] == 0 {
            return false
        }

        var res = 0
        for num in nums {
            res = (res * 10) + num
        }

        if res > 255 {
            return false
        } else {
            return true
        }
    }
}

class TestSolution0093: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().restoreIpAddresses("25525511135").sorted(), ["255.255.11.135", "255.255.111.35"].sorted())
    }

    func test2() {
        XCTAssertEqual(Solution().restoreIpAddresses("99999999999999999999"), [])
    }
}
