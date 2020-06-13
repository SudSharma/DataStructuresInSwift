//
//  MergeSortTests.swift
//  DataStructuresAndAlgorithmsTests
//
//  Created by Sudarshan Sharma on 6/12/20.
//  Copyright © 2020 Sudarshan Sharma. All rights reserved.
//

@testable import DataStructuresAndAlgorithms
import XCTest

class MergeSortTests: XCTestCase {
    func testMergeSort() throws {
        let alreadySortedArray = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]
        let array = MergeSort().mergeSort([12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8])
        print(array)
        XCTAssertTrue(array == alreadySortedArray)
    }
}
