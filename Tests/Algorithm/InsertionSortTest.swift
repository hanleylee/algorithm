@testable import CSAlgorithm
import Foundation
import XCTest

final class inserionSortTest: XCTestCase {
    func test1() {
        var list = [10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26]
        print(insertionSort(&list))
        print(insertionSort(&list, <))
        print(insertionSort(&list, >))
    }

    func test2() {}
}
