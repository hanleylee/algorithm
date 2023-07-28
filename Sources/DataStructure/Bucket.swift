//
//  File.swift
//
//
//  Created by Hanley Lee on 2023/2/21.
//

//////////////////////////////////////

// MARK: Distributor

//////////////////////////////////////

public protocol Distributor {
    func distribute<T>(_ element: T, buckets: inout [Bucket<T>])
}

/*
 * An example of a simple distribution function that send every elements to
 * the bucket representing the range in which it fits.An
 *
 * If the range of values to sort is 0..<49 i.e, there could be 5 buckets of capacity = 10
 * So every element will be classified by the ranges:
 *
 * -  0 ..< 10
 * - 10 ..< 20
 * - 20 ..< 30
 * - 30 ..< 40
 * - 40 ..< 50
 *
 * By following the formula: element / capacity = #ofBucket
 */
public struct RangeDistributor: Distributor {
    public init() {}

    public func distribute<T>(_ element: T, buckets: inout [Bucket<T>]) {
        let value = element.toInt()
        let bucketCapacity = buckets.first!.capacity

        let bucketIndex = value / bucketCapacity
        buckets[bucketIndex].add(element)
    }
}

//////////////////////////////////////

// MARK: Sortable

//////////////////////////////////////

public protocol IntConvertible {
    func toInt() -> Int
}

public protocol Sortable: IntConvertible, Comparable {}

//////////////////////////////////////

// MARK: Sorter

//////////////////////////////////////

public protocol Sorter {
    func sort<T: Sortable>(_ items: [T]) -> [T]
}

public struct InsertionSorter: Sorter {
    public init() {}

    public func sort<T: Sortable>(_ items: [T]) -> [T] {
        var results = items
        for i in 0 ..< results.count {
            var j = i
            while j > 0, results[j - 1] > results[j] {
                let auxiliar = results[j - 1]
                results[j - 1] = results[j]
                results[j] = auxiliar

                j -= 1
            }
        }
        return results
    }
}

//////////////////////////////////////

// MARK: Bucket

//////////////////////////////////////

public struct Bucket<T: Sortable> {
    public var elements: [T]
    public let capacity: Int

    public init(capacity: Int) {
        self.capacity = capacity
        elements = [T]()
    }

    public mutating func add(_ item: T) {
        if elements.count < capacity {
            elements.append(item)
        }
    }

    public func sort(_ algorithm: Sorter) -> [T] {
        return algorithm.sort(elements)
    }
}
