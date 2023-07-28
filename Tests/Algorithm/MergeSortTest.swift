@testable import CSAlgorithm
import XCTest

final class mergeSortTest: XCTestCase {
    func test1() {
        let array = [2, 1, 5, 4, 9]
        XCTAssertEqual(mergeSort(array), [1, 2, 4, 5, 9])

        /* Bottom-up iterative version */
    }

    func test2() {
        let array2 = ["Tom", "Harry", "Ron", "Chandler", "Monica"]
        XCTAssertEqual(mergeSort(array2), ["Chandler", "Harry", "Monica", "Ron", "Tom"])
    }

    func test3() {
        let array = [2, 1, 5, 4, 9]
        XCTAssertEqual(mergeSortBottomUp(array, <), [1, 2, 4, 5, 9])
    }
}
