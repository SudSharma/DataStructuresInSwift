//
//  SingleLinkedList.swift
//  DataStructuresAndAlgorithms
//
//  Created by Sudarshan Sharma on 6/10/20.
//  Copyright © 2020 Sudarshan Sharma. All rights reserved.
//

import Foundation

class Node<T: Comparable>: CustomStringConvertible {
    var description: String {
        return "Value -> \(value) Next Node -> \(String(describing: next?.description))"
    }
    var next: Node<T>?
    var value: T
    
    init(_ value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

class SingleLinkedList<T: Comparable> {
    var head: Node<T>?
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func delete(_ value: T) -> Bool {
        var currentNode = head
        var isNodeDeleted = false
        while currentNode != nil {
            if let currentValue = currentNode?.value, currentValue == value {
                // Check if head node
                if currentNode === head {
                    head = currentNode?.next
                }
                // Check for tail node
                else if currentNode?.next == nil {
                    
                }
                else if let nextNode = currentNode?.next {
                    currentNode?.value = nextNode.value
                    currentNode?.next = nextNode.next
                }
                isNodeDeleted = true
                break
            }
            currentNode = currentNode?.next
        }
        
        return isNodeDeleted
    }
    
    func insert(_ value: T) {
        
    }
    
    func search(_ value: T) {
        
    }
}
