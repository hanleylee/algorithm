//
//  File.swift
//
//
//  Created by Hanley Lee on 2023/7/12.
//

import Foundation

/**
 Performs bucket sort algorithm on the given input elements.
 [Bucket Sort Algorithm Reference](https://en.wikipedia.org/wiki/Bucket_sort)

 - Parameter elements:     Array of Sortable elements
 - Parameter distributor:  Performs the distribution of each element of a bucket
 - Parameter sorter:       Performs the sorting inside each bucket, after all the elements are distributed
 - Parameter buckets:      An array of buckets

 - Returns: A new array with sorted elements
 */
func bucketSort<T>(_ elements: [T], distributor: Distributor, sorter: Sorter, buckets: [Bucket<T>]) -> [T] {
    precondition(allPositiveNumbers(elements))
    precondition(enoughSpaceInBuckets(buckets, elements: elements))

    var bucketsCopy = buckets
    for elem in elements {
        distributor.distribute(elem, buckets: &bucketsCopy)
    }

    var results = [T]()

    for bucket in bucketsCopy {
        results += bucket.sort(sorter)
    }

    return results
}

private func allPositiveNumbers<T: Sortable>(_ array: [T]) -> Bool {
    return array.filter { $0.toInt() >= 0 }.count > 0
}

private func enoughSpaceInBuckets<T>(_ buckets: [Bucket<T>], elements: [T]) -> Bool {
    let maximumValue = elements.max()?.toInt()
    let totalCapacity = buckets.count * (buckets.first?.capacity)!

    guard let max = maximumValue else {
        return false
    }

    return totalCapacity >= max
}
