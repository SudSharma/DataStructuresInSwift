//
//  HeapSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by Sudarshan Sharma on 6/13/20.
//  Copyright © 2020 Sudarshan Sharma. All rights reserved.
//

extension Heap {
    func sorted() -> [T] {
        if type == .max {
            for lastIndex in stride(from: storage.count - 1, to: 1, by: -1) {
                swap(item1Index: 0, item2Index: lastIndex)
                shiftDown(fromIndex: 0, toIndex: lastIndex - 1)
            }
        }
        print(storage)
        return storage
    }
}
