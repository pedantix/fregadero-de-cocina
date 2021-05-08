//
//  Sequence+FDCTests.swift
//  fregadero-de-cocinaTests
//
//  Created by shaun on 5/8/21.
//

import XCTest
import FregaderoDeCocina

class Sequence_FDCTests: XCTestCase {
    func testUnique() {
        XCTAssertEqual([1, 1, 1].unique(), [1])
        XCTAssertEqual([1, 2, 2, 1, 3].unique(), [1, 2, 3])
    }
}
