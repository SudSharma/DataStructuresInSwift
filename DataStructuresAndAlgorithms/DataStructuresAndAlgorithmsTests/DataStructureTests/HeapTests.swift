//
//  HeapTests.swift
//  DataStructuresAndAlgorithmsTests
//
//  Created by Sudarshan Sharma on 6/12/20.
//  Copyright © 2020 Sudarshan Sharma. All rights reserved.
//

@testable import DataStructuresAndAlgorithms
import XCTest

class HeapTests: XCTestCase {
    
    func test1() throws {
        let initialArray = [1,12,3,4,1,6,8,7]
        let heap = Heap<Int>()
        for item in initialArray {
            heap.insert(item)
        }
        
        XCTAssertTrue(heap.storage == [1,1,3,7,4,6,8,12])
        
        try heap.remove()
        XCTAssertTrue(heap.storage == [1,4,3,7,12,6,8])
        
        try heap.remove()
        XCTAssertTrue(heap.storage == [3,4,6,7,12,8])
    }
}
