//
//  BubbleSortTests.swift
//  DataStructuresAndAlgorithmsTests
//
//  Created by Sudarshan Sharma on 6/11/20.
//  Copyright © 2020 Sudarshan Sharma. All rights reserved.
//

@testable import DataStructuresAndAlgorithms
import XCTest

class BubbleSortTests: XCTestCase {

    func testBubblesort() throws {
        let alreadySortedArray = [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]
        var array = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
        BubbleSort().bubbleSort(&array)
        XCTAssertTrue(array == alreadySortedArray)
    }
}
