//
//  GoodServiceError.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 11/3/21.
//

import Foundation

enum GoodServiceError: Error {
    case parsing(description: String)
    case network(description: String)
}
