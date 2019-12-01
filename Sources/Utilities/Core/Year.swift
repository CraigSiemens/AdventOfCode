//
//  File.swift
//  
//
//  Created by Craig Siemens on 2019-12-01.
//

import Foundation

public protocol Year {
    var number: Int { get }
    var days: [SolvableDay] { get }
}
