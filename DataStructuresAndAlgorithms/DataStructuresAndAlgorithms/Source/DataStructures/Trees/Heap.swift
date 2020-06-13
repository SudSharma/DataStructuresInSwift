//
//  Heap.swift
//  DataStructuresAndAlgorithms
//
//  Created by Sudarshan Sharma on 6/12/20.
//  Copyright © 2020 Sudarshan Sharma. All rights reserved.
//

import Foundation

enum HeapError: Error {
    case isEmpty
    case illegalIndex
}

enum HeapType {
    case min
    case max
}

class Heap<T: Comparable> {
    var count: Int {
        return storage.count
    }
    var storage = [T]()
    var type: HeapType = .min
    
    func hasLeftChild(_ index: Int) -> Bool {
        return leftChildIndex(of: index) < storage.count
    }
    
    func hasParent(_ index: Int) -> Bool {
        return parentIndex(ofChild: index) >= 0
    }
    
    func hasRightChild(_ index: Int) -> Bool {
        return rightChildIndex(of: index) < storage.count
    }
    
    func insert(_ value: T) {
        storage.append(value)
        shiftUp()
    }
    
    func isEmpty() -> Bool {
        return storage.isEmpty
    }
    
    func peek() throws -> T {
        if storage.isEmpty {
            throw HeapError.isEmpty
        }
        
        return storage[0]
    }
    
    @discardableResult
    func remove() throws -> T {
        if storage.isEmpty {
            throw HeapError.isEmpty
        }
        
        let elementRemoved = storage[0]
        storage[0] = storage[storage.count - 1]
        storage.removeLast()
        
        shiftDown()
        
        return elementRemoved
    }
    
    func shiftUp() {
        var index = storage.count - 1
        
        if type == .min {
            while parentIndex(ofChild: index) >= 0 && storage[parentIndex(ofChild: index)] > storage[index] {
                let parentIndexValue = parentIndex(ofChild: index)
                swap(item1Index: index, item2Index: parentIndexValue)
                index = parentIndexValue
            }
        }
        else if type == .max {
            while parentIndex(ofChild: index) >= 0 && storage[parentIndex(ofChild: index)] < storage[index] {
                let parentIndexValue = parentIndex(ofChild: index)
                swap(item1Index: index, item2Index: parentIndexValue)
                index = parentIndexValue
            }
        }
    }
    
    func shiftDown() {
        var index = 0
        
        if type == .min {
            while hasLeftChild(index) {
                var smallChildIndex = leftChildIndex(of: index)
                if hasRightChild(index) && storage[rightChildIndex(of: index)] < storage[leftChildIndex(of: index)] {
                    smallChildIndex = rightChildIndex(of: index)
                }
                
                if storage[index] < storage[smallChildIndex] {
                    break
                }
                else {
                    swap(item1Index: index, item2Index: smallChildIndex)
                }
                index = smallChildIndex
            }
        }
        else if type == .max {
            while hasLeftChild(index) {
                var smallChildIndex = leftChildIndex(of: index)
                if hasRightChild(index) && storage[rightChildIndex(of: index)] > storage[leftChildIndex(of: index)] {
                    smallChildIndex = rightChildIndex(of: index)
                }
                
                if storage[index] > storage[smallChildIndex] {
                    break
                }
                else {
                    swap(item1Index: index, item2Index: smallChildIndex)
                }
                index = smallChildIndex
            }
        }
    }
    
    func swap(item1Index: Int, item2Index: Int) {
        let temp = storage[item1Index]
        storage[item1Index] = storage[item2Index]
        storage[item2Index] = temp
    }
    
    // Mark - Get Parent or Child
    
    func leftChild(for index: Int) throws -> T {
        let count = storage.count
        guard index >= 0 && index < count && leftChildIndex(of: index) >= 0 && leftChildIndex(of: index) <= count else {
            throw HeapError.illegalIndex
        }
        
        return storage[leftChildIndex(of: index)]
    }
    
    func leftChildIndex(of parentIndex: Int) -> Int {
        return 2*parentIndex + 1
    }
    
    func parent(for index: Int) throws -> T {
        let count = storage.count
        guard index >= 0 && index < count && parentIndex(ofChild: index) >= 0 && parentIndex(ofChild: index) <= count else {
            throw HeapError.illegalIndex
        }
        
        return storage[parentIndex(ofChild: index)]
    }
    
    func parentIndex(ofChild index: Int) -> Int {
        return Int((index - 1) / 2)
    }
    
    func rightChild(for index: Int) throws -> T {
        let count = storage.count
        guard index >= 0 && index < count && rightChildIndex(of: index) >= 0 && rightChildIndex(of: index) <= count else {
            throw HeapError.illegalIndex
        }
        
        return storage[rightChildIndex(of: index)]
    }
    
    func rightChildIndex(of parentIndex: Int) -> Int {
        return 2*parentIndex + 2
    }
}
