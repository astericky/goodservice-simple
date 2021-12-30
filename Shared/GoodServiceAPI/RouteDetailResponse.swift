//
//  RouteDetailResponse.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/19/21.
//

import Foundation

struct RouteDetailResponse: Codable {
    let id: String
    let name: String
    let color: String
    let textColor: String?
    let alternateName: String?
    let status: String
    let visible: Bool
    let scheduled: Bool
    let serviceChangeSummaries: [String: [String]]
    let serviceIrregularitySummaries: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case color
        case textColor = "text_color"
        case alternateName = "alternate_name"
        case status
        case visible
        case scheduled
        case serviceChangeSummaries = "service_change_summaries"
        case serviceIrregularitySummaries = "service_irregularity_summaries"
    }
}
