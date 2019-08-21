//
//  SourceLocationSpecs.swift
//  FregaderoDeCocina
//
//  Created by Shaun Hubbard on 8/20/19.
//

import Foundation
import Quick
import Nimble
import FregaderoDeCocina

final class SourceLocationSpecs: QuickSpec {
  override func spec() {
    describe(".init") {
      it ("should auto capture source information") {
        let sourceLoc = SourceLocation.capture()
        expect(sourceLoc.column).to(equal(47))
        expect(sourceLoc.line).to(equal(17))
        expect(sourceLoc.file).to(contain("SourceLocationSpecs.swift"))
        expect(sourceLoc.function).to(equal("spec()"))
      }
    }
  }
}
