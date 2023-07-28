@testable import CSAlgorithm
import XCTest

final class binarySearchTest: XCTestCase {
    // Using recursive solution
    func test1() {
        let numArr = [3, 2, 66, 4, 99, 67]
        // Binary search requires that the array is sorted from low to high
        let sorted = numArr.sorted()
        XCTAssertEqual(binarySearch(sorted, key: 2, range: 0 ..< sorted.count), 0)
        XCTAssertEqual(binarySearch(sorted, key: 99, range: 0 ..< sorted.count), 5)
        XCTAssertNil(binarySearch(sorted, key: 43, range: 0 ..< sorted.count))
        XCTAssertNil(binarySearch(sorted, key: 42, range: 0 ..< sorted.count))
    }

    // Using iterative solution
    func test2() {
        let numArr = [3, 2, 66, 4, 99, 67]
        // Binary search requires that the array is sorted from low to high
        let sorted = numArr.sorted()
        XCTAssertEqual(binarySearch1(sorted, key: 2), 0)
        XCTAssertEqual(binarySearch1(sorted, key: 67), 4)
        XCTAssertNil(binarySearch1(sorted, key: 43))
        XCTAssertEqual(binarySearch1(sorted, key: 67), 4)
    }

    // Using iterative solution
    func test3() {
        let numArr = [1, 3, 5, 7, 9, 13]
        // Binary search requires that the array is sorted from low to high
        let sorted = numArr.sorted()
        XCTAssertEqual(binarySearchLowerBound(sorted, key: 0), nil)
        XCTAssertEqual(binarySearchLowerBound(sorted, key: 5), 2)
        XCTAssertEqual(binarySearchLowerBound(sorted, key: 10), 4)
        XCTAssertEqual(binarySearchLowerBound(sorted, key: 13), 5)
        XCTAssertEqual(binarySearchLowerBound(sorted, key: 67), 5)
    }
}
