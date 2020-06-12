//
//  QuickSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by Sudarshan Sharma on 6/11/20.
//  Copyright © 2020 Sudarshan Sharma. All rights reserved.
//

import Foundation

class QuickSort<T: Comparable> {
    
    func lomutoQuicksort(_ values: inout [T]) {
        lomutoQuicksort(&values, start: 0, end: values.count - 1)
    }
    
    func lomutoQuicksort(_ values: inout [T], start: Int, end: Int) {
        if start < end {
            let pivotIndex = lomutoPivot(&values, start: start, end: end)
            lomutoQuicksort(&values, start: start, end: pivotIndex - 1)
            lomutoQuicksort(&values, start: pivotIndex + 1, end: end)
        }
    }
    
    func lomutoPivot(_ values: inout [T], start: Int, end: Int) -> Int {
        let pivotIndex = end
        let pivot = values[pivotIndex]
        var partitionIndex = start
        for index in start..<end {
            if values[index] <= pivot {
                let itemAtPartitionIndex = values[partitionIndex]
                values[partitionIndex] = values[index]
                values[index] = itemAtPartitionIndex
                partitionIndex += 1
            }
        }
        
        let elementAtParitionIndex = values[partitionIndex]
        values[partitionIndex] = values[pivotIndex]
        values[pivotIndex] = elementAtParitionIndex
        
        return partitionIndex
    }
}

extension QuickSort {
    func hoareQuicksort(_ values: inout [T]) {
        hoareQuicksort(&values, start: 0, end: values.count - 1)
    }
    
    func hoareQuicksort(_ values: inout [T], start: Int, end: Int) {
        if start < end {
            let pivotIndex = hoarePivot(&values, start: start, end: end)
            hoareQuicksort(&values, start: start, end: pivotIndex)
            hoareQuicksort(&values, start: pivotIndex + 1, end: end)
        }
    }
    
    func hoarePivot(_ values: inout [T], start: Int, end: Int) -> Int {
        let pivot = values[start]
        var i = start - 1
        var j = end + 1
        while true {
            repeat { j -= 1 }
                while values[j] > pivot
            repeat { i += 1 }
                while values[i] < pivot
            if i < j {
                let valueAtI = values[i]
                values[i] = values[j]
                values[j] = valueAtI
            }
            else {
                return j
            }
        }
    }
}

extension QuickSort {
    func middleElementQuickSort(_ values: [T]) -> [T] {
        guard values.count > 1 else {
            return values
        }
        
        let pivot = values[values.count / 2]
        let lesserItems = values.filter{ $0 < pivot }
        let equalItems = values.filter{ $0 == pivot }
        let greaterItems = values.filter{ $0 > pivot }
        return middleElementQuickSort(lesserItems) +  equalItems + middleElementQuickSort(greaterItems)
    }
}

extension QuickSort {
    func medianQuickSort(_ values: inout [T]) {
        medianQuickSort(&values, start: 0, end: values.count - 1)
    }
    
    func medianQuickSort(_ values: inout [T], start: Int, end: Int) {
        let pivotIndex = medianOfThree(&values, start: start, end: end)
        let endElement = values[end]
        values[end] = values[pivotIndex]
        values[pivotIndex] = endElement
        let pivot = lomutoPivot(&values, start: start, end: end)
        lomutoQuicksort(&values, start: start, end: pivot - 1)
        lomutoQuicksort(&values, start: pivot + 1, end: end)
    }
    
    func medianOfThree(_ values: inout [T], start: Int, end: Int) -> Int {
        let center = (start + end) / 2
        if values[start] > values[center] {
            let centerElement = values[center]
            values[center] = values[start]
            values[start] = centerElement
        }
        if values[start] > values[end] {
            let endElement = values[end]
            values[end] = values[start]
            values[start] = endElement
        }
        if values[center] > values[end] {
            let endElement = values[end]
            values[end] = values[center]
            values[center] = endElement
        }
        
        return center
    }
}

extension QuickSort {
    func dutchFlagQuickSort(_ values: inout [T]) {
        dutchFlagQuickSort(&values, start: 0, end: values.count - 1)
    }
    
    func dutchFlagQuickSort(_ values: inout [T], start: Int, end: Int) {
        if start < end {
            let pivotIndex = Int.random(in: start...end)
            let (middleFirst, middleLast) = partitionDutchFlag(&values, start: start, end: end, pivotIndex: pivotIndex)
            dutchFlagQuickSort(&values, start: start, end: middleFirst - 1)
            dutchFlagQuickSort(&values, start: middleLast + 1, end: end)
        }
    }
    
    public func partitionDutchFlag(_ values: inout [T], start: Int, end: Int, pivotIndex: Int) -> (Int, Int) {
        let pivot = values[pivotIndex]
        var smaller = start
        var equal = start
        var larger = end
        while equal <= larger {
            if values[equal] < pivot {
                values.swapAt(smaller, equal)
                smaller += 1
                equal += 1
            } else if values[equal] == pivot {
                equal += 1
            } else {
                values.swapAt(equal, larger)
                larger -= 1
            }
        }
        
        return (smaller, larger)
    }
}

extension QuickSort {
    func dutchFlagQuickSortNonGeneric(_ values: inout [Int]) {
        dutchFlagQuickSortNonGeneric(&values, start: 0, end: values.count - 1)
    }
    
    func dutchFlagQuickSortNonGeneric(_ values: inout [Int], start: Int, end: Int) {
        if start < end {
            let pivotIndex = Int.random(in: start...end)
            let (middleFirst, middleLast) = partitionDutchFlagNonGeneric(&values, start: start, end: end, pivotIndex: pivotIndex)
            dutchFlagQuickSortNonGeneric(&values, start: start, end: middleFirst - 1)
            dutchFlagQuickSortNonGeneric(&values, start: middleLast + 1, end: end)
        }
    }
    
    public func partitionDutchFlagNonGeneric(_ values: inout [Int], start: Int, end: Int, pivotIndex: Int) -> (Int, Int) {
        let pivot = values[pivotIndex]
        var smaller = start
        var equal = start
        var larger = end
        while equal <= larger {
            if values[equal] < pivot {
                values.swapAt(smaller, equal)
                smaller += 1
                equal += 1
            } else if values[equal] == pivot {
                equal += 1
            } else {
                values.swapAt(equal, larger)
                larger -= 1
            }
        }
        
        return (smaller, larger)
    }
}
