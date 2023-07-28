//
//  File.swift
//
//
//  Created by Hanley Lee on 2023/7/12.
//

import Foundation

// The recursive version of binary search.

func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        return nil
    } else {
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
        } else {
            return midIndex
        }
    }
}

/**
 二分查找(迭代)

 返回一个下标, 该下标对应的数值等于目标值
 **/

func binarySearch1<T: Comparable>(_ a: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = a.count - 1
    while lowerBound <= upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if a[midIndex] == key {
            return midIndex
        } else if a[midIndex] < key {
            lowerBound = midIndex + 1
        } else if a[midIndex] > key {
            upperBound = midIndex - 1
        }
    }
    return nil
}

/**
 二分查找(迭代)

 返回一个下标, 下标值对应的值要求如下:

 - 该下标对应的数值等于目标值
 - 目标值在数组范围内, 但数组没有该目标值 , 返回仅小于目标值的下标
 - 给定目标值小于数组最小值, 返回 nil
 **/
func binarySearchLowerBound<T: Comparable>(_ a: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = a.count - 1
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound + 1) / 2
        if a[midIndex] == key {
            return midIndex
        } else if a[midIndex] < key {
            lowerBound = midIndex
        } else if a[midIndex] > key {
            upperBound = midIndex - 1
        }
    }
    return a[lowerBound] > key ? nil : lowerBound
}
