@testable import CSAlgorithm
import XCTest

final class bubbleSortTest: XCTestCase {
    func test1() {
        var array = [4, 2, 1, 3]

        print("before:", array)
        print("after:", bubbleSort(&array, <))
        print("after:", bubbleSort(&array, >))
    }

    func test2() {}
}
