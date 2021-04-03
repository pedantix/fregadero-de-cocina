//
//  SourceLocationSpecs.swift
//  FregaderoDeCocina
//
//  Created by Shaun Hubbard on 8/20/19.
//

import Foundation
import FregaderoDeCocina
import XCTest

final class SourceLocationSpecs: XCTestCase {
    func testInit() {
        let sourceLoc = SourceLocation.capture()
        XCTAssertEqual(sourceLoc.column, 47)
        XCTAssertEqual(sourceLoc.line, 14)
        XCTAssertTrue(sourceLoc.file.contains("SourceLocationSpecs.swift"))
        XCTAssertEqual(sourceLoc.function, "testInit()")
    }
}
