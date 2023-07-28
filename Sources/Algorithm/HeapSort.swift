//
//  File.swift
//
//
//  Created by Hanley Lee on 2023/7/12.
//

import Foundation

// 堆排序
private var len: Int = 0
func heapSort(_ array: inout [NSInteger]) {
    // 构建大顶堆
    for i in (0 ... (array.count / 2 - 1)).reversed() {
        adjustHead(&array, i, array.count)
    }
    // 调整堆结构+交换堆顶元素与末尾元素
    for j in (1 ... (array.count - 1)).reversed() {
        swaps(&array, 0, j) // 将堆顶元素与末尾元素进行交换
        adjustHead(&array, 0, j) // 重新对堆进行调整
    }
}

// 调整大顶堆（仅是调整过程，建立在大顶堆已构建的基础上）
private func adjustHead(_ array: inout [NSInteger], _ index: Int, _ len: Int) {
    var index = index
    let temp = array[index] // 取出当前元素
    var k = 2 * index + 1
    while k < len { // 从i结点的左子结点开始，也就是2i+1处开始
        if k + 1 < len, array[k] < array[k + 1] { // 如果左子结点小于右子结点，k指向右子结点
            k += 1
        }
        if array[k] > temp { // 如果子节点大于父节点，将子节点值赋给父节点（不用进行交换）
            array[index] = array[k]
            index = k
        } else {
            break
        }
        k = k * 2 + 1
    }
    array[index] = temp // 将temp值放到最终的位置
}

// 交换两个数
private func swaps<T>(_ chars: inout [T], _ s: Int, _ e: Int) {
    (chars[s], chars[e]) = (chars[e], chars[s])
}
