//
//  Double.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/31/21.
//

import Foundation

extension Double {
    func format(f: Int) -> String {
        return String(format: "%.\(f)f", self)
    }
}
