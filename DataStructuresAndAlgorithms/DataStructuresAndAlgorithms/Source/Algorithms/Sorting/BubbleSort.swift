//
//  BubbleSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by Sudarshan Sharma on 6/11/20.
//  Copyright © 2020 Sudarshan Sharma. All rights reserved.
//

import Foundation

class BubbleSort<T: Comparable> {
    func bubbleSort(_ values: inout [T]) {
        for i in 0..<values.count {
            var swapped = false
            for j in 1..<values.count - i {
                if values[j] < values[j - 1] {
                    let temp = values[j - 1]
                    values[j - 1] = values[j]
                    values[j] = temp
                    swapped = true
                }
            }
            
            if !swapped {
                break
            }
        }
    }
}
