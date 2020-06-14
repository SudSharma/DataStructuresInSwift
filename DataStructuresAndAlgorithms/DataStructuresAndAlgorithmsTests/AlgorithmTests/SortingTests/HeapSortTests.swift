//
//  HeapSortTests.swift
//  DataStructuresAndAlgorithmsTests
//
//  Created by Sudarshan Sharma on 6/13/20.
//  Copyright © 2020 Sudarshan Sharma. All rights reserved.
//

@testable import DataStructuresAndAlgorithms
import XCTest

class HeapSortTests: XCTestCase {
    func test1() throws {
        XCTAssertTrue(Heap([12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8], type:.max).sorted() == [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27])
    }
    
    func test3() throws {
        XCTAssertTrue(Heap([2,0,2,1,1,0], type:.max).sorted() == [0,0,1,1,2,2])
    }
}
