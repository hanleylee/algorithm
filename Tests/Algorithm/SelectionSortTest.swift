@testable import CSAlgorithm
import XCTest

final class selectionSortTest: XCTestCase {
    func test1() {
        let list = [10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26]
        XCTAssertEqual(selectionSort(list, <), [-1, 0, 1, 2, 3, 3, 5, 8, 9, 10, 26, 27])
        XCTAssertEqual(selectionSort(list, >), [27, 26, 10, 9, 8, 5, 3, 3, 2, 1, 0, -1])
    }

    func test2() {}
}
