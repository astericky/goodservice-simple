//
//  Date.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 5/14/22.
//

import Foundation

extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
