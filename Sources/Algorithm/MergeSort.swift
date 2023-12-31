//
//  File.swift
//
//
//  Created by Hanley Lee on 2023/7/12.
//

import Foundation

/// Top-down recursive version
func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0 ..< middleIndex])) // 不断拆分左边的数组
    let rightArray = mergeSort(Array(array[middleIndex ..< array.count])) // 不断拆分右边的数组
    return merge(leftPile: leftArray, rightPile: rightArray) // 调用 merge 方法将所有数组合并到一起成为一个排序数组
}

private func merge<T: Comparable>(leftPile: [T], rightPile: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedPile = [T]()
    if orderedPile.capacity < leftPile.count + rightPile.count {
        orderedPile.reserveCapacity(leftPile.count + rightPile.count) // 调整新数组容量
    }

    while true { // 因为有 guard, guard 里面的 break 要求必须在循环中, 因此使用 while true象征性的进入循环
        // 比较左堆数组的当前指针所指向的元素与右堆数组当前指针指向的元素大小
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        else {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }

        // 其中一侧已经全部添加进入了新数组中, 此时只要添加另一侧的所有剩下元素到新数组中即可
        guard leftIndex < leftPile.endIndex else {
            orderedPile.append(contentsOf: rightPile[rightIndex ..< rightPile.endIndex])
            break
        }
        guard rightIndex < rightPile.endIndex else {
            orderedPile.append(contentsOf: leftPile[leftIndex ..< leftPile.endIndex])
            break
        }
    }
    return orderedPile
}

func mergeSortBottomUp<T>(_ a: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    let n = a.count
    var z = [a, a] // the two working arrays
    var d = 0 // z[d] is used for reading, z[1 - d] for writing

    var width = 1
    while width < n {
        var i = 0
        while i < n {
            var j = i
            var l = i
            var r = i + width

            let lmax = min(l + width, n)
            let rmax = min(r + width, n)

            while l < lmax, r < rmax {
                if isOrderedBefore(z[d][l], z[d][r]) {
                    z[1 - d][j] = z[d][l]
                    l += 1
                }
                else {
                    z[1 - d][j] = z[d][r]
                    r += 1
                }
                j += 1
            }
            while l < lmax {
                z[1 - d][j] = z[d][l]
                j += 1
                l += 1
            }
            while r < rmax {
                z[1 - d][j] = z[d][r]
                j += 1
                r += 1
            }

            i += width * 2
        }

        width *= 2 // in each step, the subarray to merge becomes larger
        d = 1 - d // swap active array
    }
    return z[d]
}
