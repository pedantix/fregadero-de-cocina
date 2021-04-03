//
//  DebuggableSpecs.swift
//  fregadero-de-cocinaTests
//
//  Created by Shaun Hubbard on 8/20/19.
//

import XCTest
import FregaderoDeCocina

final class DebuggableExample: Debuggable {
  /// See `Debuggable`
  var identifier: String

  /// See `Debuggable`
  var reason: String

  /// See `Debuggable`
  var sourceLocation: FregaderoDeCocina.SourceLocation

  /// See `Debuggable`
  var stackTrace: [String]?

  /// See `Debuggable`
  let suggestedFixes: [String]

  init(
    identifier: String,
    reason: String,
    suggestedFixes: [String] = [],
    sourceLocation: FregaderoDeCocina.SourceLocation = .capture(),
    stackTrace: [String] = DebuggableExample.makeStackTrace()
  ) {
    self.identifier = identifier
    self.reason = reason
    self.sourceLocation = sourceLocation
    self.stackTrace = stackTrace
    self.suggestedFixes = suggestedFixes
  }
}

final class DebuggableSpecs: XCTestCase {
    func testInit() {
        let debug = DebuggableExample(identifier: "my ident", reason: "because", suggestedFixes: ["Try something"])
        XCTAssertEqual(debug.identifier, "my ident")
        XCTAssertEqual(debug.reason, "because")
        XCTAssertFalse(debug.description.isEmpty)
        XCTAssertFalse(debug.debugDescription.isEmpty)
        XCTAssertFalse(debug.failureReason?.isEmpty ?? false)
        XCTAssertFalse(debug.errorDescription?.isEmpty ?? false)
    }
}
