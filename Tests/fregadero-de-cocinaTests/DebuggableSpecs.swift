//
//  DebuggableSpecs.swift
//  fregadero-de-cocinaTests
//
//  Created by Shaun Hubbard on 8/20/19.
//

import Quick
import Nimble
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

final class DebuggableSpecs: QuickSpec {
  override func spec() {
    describe(".init") {
      it ("should auto capture most information") {
        let debug = DebuggableExample(identifier: "my ident", reason: "because", suggestedFixes: ["Try something"])
        expect(debug.identifier).to(equal("my ident"))
        expect(debug.reason).to(equal("because"))
        expect(debug.description).notTo(beEmpty())
        expect(debug.debugDescription).notTo(beEmpty())
        expect(debug.failureReason).notTo(beEmpty())
        expect(debug.errorDescription).notTo(beEmpty())
      }
    }
  }
}
