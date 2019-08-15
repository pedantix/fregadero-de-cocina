//
//  String+FDCTests.swift
//  fregadero-de-cocinaTests
//
//  Created by Shaun Hubbard on 8/15/19.
//

import Foundation
import XCTest
import Quick
import Nimble
import fregadero_de_cocina

final class StringTests: QuickSpec {
  override func spec() {
    describe("isBlank") {
      it ("should not be blank for 'a'") {
        expect("a".isBlank).to(equal(false))
      }

      ["", " ", "\n", "\t"].forEach { str in
        it ("should be blank for '\(str)'") {
          expect(str.isBlank).to(equal(true))
        }
      }
    }
  }
}
