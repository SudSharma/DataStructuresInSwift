//
//  MergeSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by Sudarshan Sharma on 6/12/20.
//  Copyright © 2020 Sudarshan Sharma. All rights reserved.
//

import Foundation

class MergeSort<T: Comparable> {
    func mergeSort(_ values: [T]) -> [T] {
        if values.count <= 1 {
            return values
        }
        
        let mid = values.count/2
        let left = mergeSort(Array(values[0..<mid]))
        let right = mergeSort(Array(values[mid..<values.count]))
        
        var merged = [T]()
        var i = 0
        var j = 0
        let leftCount = left.count
        let rightCount = right.count
        
        while i < leftCount && j < rightCount {
            if i < leftCount && left[i] <= right[j] {
                merged.append(left[i])
                i += 1
            }
            else if j < rightCount && left[i] > right[j] {
                merged.append(right[j])
                j += 1
            }
        }
        
        if i < leftCount {
            for index in i..<leftCount {
                merged.append(left[index])
            }
        }
        
        if j < rightCount {
            for index in j..<rightCount {
                merged.append(right[index])
            }
        }
        
        return merged
    }
}
