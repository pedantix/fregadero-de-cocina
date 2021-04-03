//
//  String+FDC.swift
//  fregadero-de-cocina
//
//  Created by Shaun Hubbard on 8/15/19.
//

import Foundation

extension String {
    /// Checks if a string is empty or only contains whitespace.
    public var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    public var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
