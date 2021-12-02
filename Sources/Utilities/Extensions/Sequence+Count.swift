//
//  Sequence+Count.swift
//  Utilities
//
//  Created by Craig Siemens on 2019-01-01.
//

import Foundation

extension Sequence {
    public func countElements<T: Equatable>(by keyPath: KeyPath<Element, T>) -> [T: Int] {
        return reduce(into: [:]) { (result, element) in
            result[element[keyPath: keyPath], default: 0] += 1
        }
    }
    
    public func debug(file: StaticString = #file, line: Int = #line) -> Self {
        let fileName = "\(file)".split(separator: "/").last ?? ""
        let prefix = "\(fileName):\(line)"
        debugPrint(prefix, self)
        return self
    }
}

extension Sequence where Element: Hashable {
    public func countElements() -> [Element: Int] {
        return reduce(into: [:]) { (result, element) in
            result[element, default: 0] += 1
        }
    }
}

