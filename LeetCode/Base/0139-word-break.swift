/**
 # Word Break

 ## Description

 Given a string `s` and a dictionary of strings `wordDict`, return `true` if
 `s` can be segmented into a space-separated sequence of one or more dictionary
 words.

 **Note** that the same word in the dictionary may be reused multiple times in
 the segmentation.

 **Example 1:**

     **Input:** s = "leetcode", wordDict = ["leet","code"]
     **Output:** true
     **Explanation:** Return true because "leetcode" can be segmented as "leet code".

 **Example 2:**

     **Input:** s = "applepenapple", wordDict = ["apple","pen"]
     **Output:** true
     **Explanation:** Return true because "applepenapple" can be segmented as "apple pen apple".
     Note that you are allowed to reuse a dictionary word.

 **Example 3:**

     **Input:** s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
     **Output:** false

 **Constraints:**

   * `1 <= s.length <= 300`
   * `1 <= wordDict.length <= 1000`
   * `1 <= wordDict[i].length <= 20`
   * `s` and `wordDict[i]` consist of only lowercase English letters.
   * All the strings of `wordDict` are **unique**.

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/word-break>

 */

import XCTest

private class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let s: [Character] = Array(s)
        // dp[i] : 字符串 0 ... i 区间是否能由 wordDict 组成
        var dp: [Bool] = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        let wordSet = Set(wordDict)

        loop1: for i in 0 ..< s.count {
            loop2: for j in 0 ... i {
                if dp[i + 1] {
                    continue loop1
                }
                if dp[j] {
                    let rangeStr = String(s[j ... i])
                    if wordSet.contains(rangeStr) {
                        dp[i + 1] = true
                    }
                }
            }
        }

        return dp[s.count]
    }
}

// DFS
private class Solution2 {
    private var res: Bool = false

    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        dfs(idx: 0, total: Array(s), current: [], wordDict: wordDict)
        return res
    }

    private func dfs(idx: Int, total: [Character], current: [Character], wordDict: [String]) {
        guard idx <= total.count else { return }
        if current == total {
            res = true
            return
        }

        for s in wordDict {
            var isEqual: Bool = true

            for (i, c) in s.enumerated() {
                guard (idx + i) < total.count else { break }
                if total[idx + i] != c {
                    isEqual = false
                    break
                }
            }

            if isEqual {
                let current = current + Array(s)
                dfs(idx: idx + s.count, total: total, current: current, wordDict: wordDict)
            }
        }
    }
}

class TestSolution0139: XCTestCase {
    func test1() {
        XCTAssertTrue(Solution().wordBreak("leetcode", ["leet", "code"]))
    }

    func test2() {
        XCTAssertTrue(Solution().wordBreak("applepenapple", ["apple", "pen"]))
    }

    func test3() {
        XCTAssertFalse(Solution().wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))
    }

    func test4() {
        XCTAssertTrue(Solution().wordBreak("bb", ["a", "b", "bbb", "bbbb"]))
    }

    func test5() {
        XCTAssertTrue(Solution().wordBreak("acaaaaabbbdbcccdcdaadcdccacbcccabbbbcdaaaaaadb", ["abbcbda", "cbdaaa", "b", "dadaaad", "dccbbbc", "dccadd", "ccbdbc", "bbca", "bacbcdd", "a", "bacb", "cbc", "adc", "c", "cbdbcad", "cdbab", "db", "abbcdbd", "bcb", "bbdab", "aa", "bcadb", "bacbcb", "ca", "dbdabdb", "ccd", "acbb", "bdc", "acbccd", "d", "cccdcda", "dcbd", "cbccacd", "ac", "cca", "aaddc", "dccac", "ccdc", "bbbbcda", "ba", "adbcadb", "dca", "abd", "bdbb", "ddadbad", "badb", "ab", "aaaaa", "acba", "abbb"]))
    }
}
