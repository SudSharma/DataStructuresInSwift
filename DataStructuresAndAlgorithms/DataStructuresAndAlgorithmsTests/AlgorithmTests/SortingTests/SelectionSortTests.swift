//
//  SelectionSortTests.swift
//  DataStructuresAndAlgorithmsTests
//
//  Created by Sudarshan Sharma on 6/14/20.
//  Copyright © 2020 Sudarshan Sharma. All rights reserved.
//

@testable import DataStructuresAndAlgorithms
import XCTest

class SelectionSortTests: XCTestCase {
    func test1() throws {
        let alreadySortedArray = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]
        var array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
        SelectionSort().sort(&array)
        XCTAssertTrue(array == alreadySortedArray)
    }
    
    func test2() throws {
        var array = [2,0,2,1,1,0]
        let alreadySortedArray = [0,0,1,1,2,2]
        SelectionSort().sort(&array)
        XCTAssertTrue(array == alreadySortedArray)
    }
}
