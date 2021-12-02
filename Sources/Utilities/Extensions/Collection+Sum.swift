//
//  Collection+Sum.swift
//  Utilities
//
//  Created by Craig Siemens on 2018-12-09.
//

import Foundation

extension Collection where Element: Numeric {
    public func sum() -> Element {
        return reduce(0, +)
    }
}
