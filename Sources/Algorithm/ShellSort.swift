//
//  File.swift
//
//
//  Created by Hanley Lee on 2023/7/12.
//

import Foundation
private func insertionSort(_ list: inout [Int], start: Int, gap: Int) {
    for i in stride(from: start + gap, to: list.count, by: gap) {
        let currentValue = list[i]
        var pos = i
        while pos >= gap, list[pos - gap] > currentValue {
            list[pos] = list[pos - gap]
            pos -= gap
        }
        list[pos] = currentValue
    }
}

func shellSort(_ list: inout [Int]) {
    var sublistCount = list.count / 2
    while sublistCount > 0 {
        for pos in 0 ..< sublistCount {
            insertionSort(&list, start: pos, gap: sublistCount)
        }
        sublistCount = sublistCount / 2
    }
}
