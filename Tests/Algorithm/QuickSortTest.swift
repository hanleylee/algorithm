@testable import CSAlgorithm
//: Playground - noun: a place where people can play
import Foundation
import XCTest

final class quickSortTest: XCTestCase {
    func test1() {
        let list1 = [10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26]
        XCTAssertEqual(quicksort(list1), [-1, 0, 1, 2, 3, 5, 8, 8, 9, 10, 14, 26, 27])
    }

    func test2() {
        var list2 = [10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8]
        let _ = partitionLomuto(&list2, low: 0, high: list2.count - 1)
        XCTAssertEqual(list2, [0, 3, 2, 1, 5, 8, -1, 8, 9, 10, 14, 26, 27])
    }

    func test3() {
        var list2 = [10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8]
        quicksortLomuto(&list2, low: 0, high: list2.count - 1)
        XCTAssertEqual(list2, [-1, 0, 1, 2, 3, 5, 8, 8, 9, 10, 14, 26, 27])
    }

    func test4() {
        var list3 = [8, 0, 3, 9, 2, 14, 10, 27, 1, 5, 8, -1, 26]
        let _ = partitionHoare(&list3, low: 0, high: list3.count - 1)
        XCTAssertEqual(list3, [-1, 0, 3, 8, 2, 5, 1, 27, 10, 14, 9, 8, 26])
    }

    func test5() {
        let list3 = [8, 0, 3, 9, 2, 14, 10, 27, 1, 5, 8, -1, 26]
        XCTAssertEqual(list3, [8, 0, 3, 9, 2, 14, 10, 27, 1, 5, 8, -1, 26])
    }

    func test6() {
        var list4 = [10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26]
        quicksortRandom(&list4, low: 0, high: list4.count - 1)
        XCTAssertEqual(list4, [-1, 0, 1, 2, 3, 5, 8, 8, 9, 10, 14, 26, 27])
    }

    func test7() {
        var list5 = [10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26]
        let _ = partitionDutchFlag(&list5, low: 0, high: list5.count - 1, pivotIndex: 10)
        XCTAssertEqual(list5, [-1, 0, 3, 2, 5, 1, 8, 8, 27, 14, 9, 26, 10])
    }

    func test8() {
        var list5 = [10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26]
        quicksortDutchFlag(&list5, low: 0, high: list5.count - 1)
        XCTAssertEqual(list5, [-1, 0, 1, 2, 3, 5, 8, 8, 9, 10, 14, 26, 27])
    }
}
