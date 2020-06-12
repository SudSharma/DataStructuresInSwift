//
//  QuickSortTests.swift
//  DataStructuresAndAlgorithmsTests
//
//  Created by Sudarshan Sharma on 6/11/20.
//  Copyright © 2020 Sudarshan Sharma. All rights reserved.
//

@testable import DataStructuresAndAlgorithms
import XCTest

class QuickSortTests: XCTestCase {
    
    func testMiddleElementPivotQuicksort() throws {
        let alreadySortedArray = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]
        let array = QuickSort().middleElementQuickSort([12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8])
        XCTAssertTrue(array == alreadySortedArray)
    }
    
    func testLomutoQuicksort() throws {
        var array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
        let alreadySortedArray = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]
        QuickSort().lomutoQuicksort(&array)
        XCTAssertTrue(array == alreadySortedArray)
    }
    
    func testHoareQuicksort() throws {
        var array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
        let alreadySortedArray = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]
        QuickSort().hoareQuicksort(&array)
        XCTAssertTrue(array == alreadySortedArray)
    }
    
    func testMedianQuicksort() throws {
        var array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
        let alreadySortedArray = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]
        QuickSort().medianQuickSort(&array)
        XCTAssertTrue(array == alreadySortedArray)
    }
    
    func testDutchNationalFlagQuicksort() throws {
        var array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
        let alreadySortedArray = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]
        QuickSort().dutchFlagQuickSort(&array)
        XCTAssertTrue(array == alreadySortedArray)
    }
    
    func testDutchNationalFlagQuicksort1() throws {
        var array = [2,0,2,1,1,0]
        let alreadySortedArray = [0,0,1,1,2,2]
        QuickSort().dutchFlagQuickSort(&array)
        XCTAssertTrue(array == alreadySortedArray)
    }
    
    func testDutchNationalFlagQuicksortNonGeneric() throws {
        var array = [2,0,2,1,1,0]
        let alreadySortedArray = [0,0,1,1,2,2]
        QuickSort<Int>().dutchFlagQuickSortNonGeneric(&array)
        XCTAssertTrue(array == alreadySortedArray)
    }
}
