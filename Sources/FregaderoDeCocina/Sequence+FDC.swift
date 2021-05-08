//
//  Sequence+FDC.swift
//  FregaderoDeCocina
//
//  Created by shaun on 5/8/21.
//

import Foundation


public extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
