//
//  SelectionSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by Sudarshan Sharma on 6/14/20.
//  Copyright © 2020 Sudarshan Sharma. All rights reserved.
//

class SelectionSort<T: Comparable> {
    func sort(_ values: inout [T]) {
        for i in 0..<values.count {
            var minimumValueIndex = i
            for j in i+1..<values.count {
                if values[j] < values[minimumValueIndex] && values[j] != values[minimumValueIndex] {
                    minimumValueIndex = j
                }
            }
            
            if values[minimumValueIndex] != values[i] {
                values.swapAt(i, minimumValueIndex)
            }
        }
    }
}
