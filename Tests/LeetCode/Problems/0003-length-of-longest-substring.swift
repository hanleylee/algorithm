import XCTest
/*
 * @lc app=leetcode.cn id=3 lang=swift
 *
 * [3] 无重复字符的最长子串
 *
 * https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/description/
 *
 * algorithms
 * Medium (35.76%)
 * Likes:    4479
 * Dislikes: 0
 * Total Accepted:    699.1K
 * Total Submissions: 2M
 * Testcase Example:  '"abcabcbb"'
 *
 * 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 *
 * 示例 1:
 *
 * 输入: "abcabcbb"
 * 输出: 3
 * 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 *
 *
 * 示例 2:
 *
 * 输入: "bbbbb"
 * 输出: 1
 * 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 *
 *
 * 示例 3:
 *
 * 输入: "pwwkew"
 * 输出: 3
 * 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
 * 请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 *
 *
 */

final class lengthOfLongestSubstringTest: XCTestCase {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var tempStr = ""
        var res = 0

        s.forEach { s in
            if let firstIndex = tempStr.firstIndex(of: s) {
                let distance = tempStr.distance(from: tempStr.startIndex, to: firstIndex)
                tempStr.removeSubrange(tempStr.startIndex ... tempStr.index(tempStr.startIndex, offsetBy: distance))
            }
            tempStr.append(s)
            res = max(res, tempStr.count)
        }

        return res
    }

    func test1() {
        XCTAssertEqual(lengthOfLongestSubstring("pwwkew"), 3)
    }

    func test2() {}
}
