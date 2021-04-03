//
//  String+FDCTests.swift
//  fregadero-de-cocinaTests
//
//  Created by Shaun Hubbard on 8/15/19.
//

import Foundation
import XCTest
import FregaderoDeCocina


final class StringTests: XCTestCase {
    func testIsBlankIsFalse() {
        XCTAssertFalse("a".isBlank)
    }

    func testIsBlankIsTrue() {
        ["", " ", "\n", "\t"].forEach { str in
            XCTAssertTrue(str.isBlank)
        }
    }

    func testTrimmedNoopCase() {
        let expected = "dog and cat"
        XCTAssertEqual(expected.trimmed, expected)
    }

    func testTrimmedTrailingCase() {
        let expected = "dog and cat"
        let sample = "dog and cat "
        XCTAssertEqual(sample.trimmed, expected)
    }

    func testTrimmedLeadingCase() {
        let expected = "dog and cat"
        let sample = " dog and cat"
        XCTAssertEqual(sample.trimmed, expected)
    }
}
