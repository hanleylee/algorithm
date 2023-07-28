//
//  SegmentTreeTest.swift
//
//
//  Created by Hanley Lee on 2023/6/11.
//

import CSAlgorithm
import XCTest

final class SegmentTreeTest: XCTestCase {
    func test1() {
        let array = [1, 2, 3, 4]

        let sumSegmentTree = SegmentTree(array: array, function: +)

        XCTAssertEqual(sumSegmentTree.query(leftBound: 0, rightBound: 3), 10) // 1 + 2 + 3 + 4 = 10
        XCTAssertEqual(sumSegmentTree.query(leftBound: 1, rightBound: 2), 5) // 2 + 3 = 5
        XCTAssertEqual(sumSegmentTree.query(leftBound: 0, rightBound: 0), 1) // 1 = 1

        sumSegmentTree.replaceItem(at: 0, withItem: 2) // our array now is [2, 2, 3, 4]

        XCTAssertEqual(sumSegmentTree.query(leftBound: 0, rightBound: 0), 2) // 2 = 2
        XCTAssertEqual(sumSegmentTree.query(leftBound: 0, rightBound: 1), 4) // 2 + 2 = 4

        // you can use any associative function (i.e (a+b)+c == a+(b+c)) as function for segment tree
        func gcd(_ m: Int, _ n: Int) -> Int {
            var a = 0
            var b = max(m, n)
            var r = min(m, n)

            while r != 0 {
                a = b
                b = r
                r = a % b
            }
            return b
        }

        let gcdArray = [2, 4, 6, 3, 5]

        let gcdSegmentTree = SegmentTree(array: gcdArray, function: gcd)

        XCTAssertEqual(gcdSegmentTree.query(leftBound: 0, rightBound: 1), 2) // gcd(2, 4) = 2
        XCTAssertEqual(gcdSegmentTree.query(leftBound: 2, rightBound: 3), 3) // gcd(6, 3) = 3
        XCTAssertEqual(gcdSegmentTree.query(leftBound: 1, rightBound: 3), 1) // gcd(4, 6, 3) = 1
        XCTAssertEqual(gcdSegmentTree.query(leftBound: 0, rightBound: 4), 1) // gcd(2, 4, 6, 3, 5) = 1

        gcdSegmentTree.replaceItem(at: 3, withItem: 10) // gcdArray now is [2, 4, 6, 10, 5]

        XCTAssertEqual(gcdSegmentTree.query(leftBound: 3, rightBound: 4), 5) // gcd(10, 5) = 5

        // example of segment tree which finds minimum on given range
        let minArray = [2, 4, 1, 5, 3]

        let minSegmentTree = SegmentTree(array: minArray, function: min)

        XCTAssertEqual(minSegmentTree.query(leftBound: 0, rightBound: 4), 1) // min(2, 4, 1, 5, 3) = 1
        XCTAssertEqual(minSegmentTree.query(leftBound: 0, rightBound: 1), 2) // min(2, 4) = 2

        minSegmentTree.replaceItem(at: 2, withItem: 10) // minArray now is [2, 4, 10, 5, 3]

        XCTAssertEqual(minSegmentTree.query(leftBound: 0, rightBound: 4), 2) // min(2, 4, 10, 5, 3) = 2

        // type of elements in array can be any type which has some associative function
        let stringArray = ["a", "b", "c", "A", "B", "C"]

        let stringSegmentTree = SegmentTree(array: stringArray, function: +)

        XCTAssertEqual(stringSegmentTree.query(leftBound: 0, rightBound: 1), "ab") // "a"+"b" = "ab"
        XCTAssertEqual(stringSegmentTree.query(leftBound: 2, rightBound: 3), "cA") // "c"+"A" = "cA"
        XCTAssertEqual(stringSegmentTree.query(leftBound: 1, rightBound: 3), "bcA") // "b"+"c"+"A" = "bcA"
        XCTAssertEqual(stringSegmentTree.query(leftBound: 0, rightBound: 5), "abcABC") // "a"+"b"+"c"+"A"+"B"+"C" = "abcABC"

        stringSegmentTree.replaceItem(at: 0, withItem: "I")
        stringSegmentTree.replaceItem(at: 1, withItem: " like")
        stringSegmentTree.replaceItem(at: 2, withItem: " algorithms")
        stringSegmentTree.replaceItem(at: 3, withItem: " and")
        stringSegmentTree.replaceItem(at: 4, withItem: " swift")
        stringSegmentTree.replaceItem(at: 5, withItem: "!")

        XCTAssertEqual(stringSegmentTree.query(leftBound: 0, rightBound: 5), "I like algorithms and swift!")
    }
}
