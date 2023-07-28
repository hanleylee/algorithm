import XCTest
/*
 * @lc app=leetcode.cn id=14 lang=swift
 *
 * [14] 最长公共前缀
 *
 * https://leetcode-cn.com/problems/longest-common-prefix/description/
 *
 * algorithms
 * Easy (38.84%)
 * Likes:    1309
 * Dislikes: 0
 * Total Accepted:    379.3K
 * Total Submissions: 976.5K
 * Testcase Example:  '["flower","flow","flight"]'
 *
 * 编写一个函数来查找字符串数组中的最长公共前缀。
 *
 * 如果不存在公共前缀，返回空字符串 ""。
 *
 * 示例 1:
 *
 * 输入: ["flower","flow","flight"]
 * 输出: "fl"
 *
 *
 * 示例 2:
 *
 * 输入: ["dog","racecar","car"]
 * 输出: ""
 * 解释: 输入不存在公共前缀。
 *
 *
 * 说明:
 *
 * 所有输入只包含小写字母 a-z 。
 *
 */

final class longestCommonPrefixTest: XCTestCase {
    func test1() {
        XCTAssertEqual(longestCommonPrefix(["flower", "flow", "flight"]), "fl")
    }

    func test2() {}
}

private func longestCommonPrefix(_ strs: [String]) -> String {
    var res = ""
    var temp = ""

    let minCount = strs.map { $0.count }.min() ?? 0

    for i in 0 ..< minCount {
        let first = strs.first ?? ""
        let str = String(first[first.index(first.startIndex, offsetBy: i)])
        temp = str
        for s in strs where String(s[s.index(s.startIndex, offsetBy: i)]) != temp {
            return res
        }
        res += str
    }

    return res
}
