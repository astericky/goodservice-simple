//
//  RouteDetailResponse.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/19/21.
//

import Foundation

struct RouteDetailResponse: Codable {

    var id: String
    var name: String
    var color: String
    var textColor: String?
    var alternateName: String?
    var status: String
    var visible: Bool
    var scheduled: Bool
    var serviceChangeSummaries: [String: [String]]?
    var serviceIrregularitySummaries: [String: String?]?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        color = try values.decode(String.self, forKey: .color)
        textColor = try values.decodeIfPresent(String.self, forKey: .textColor)
        alternateName = try values.decodeIfPresent(String.self, forKey: .alternateName)
        status = try values.decode(String.self, forKey: .status)
        visible = try values.decode(Bool.self, forKey: .visible)
        scheduled = try values.decode(Bool.self, forKey: .scheduled)
        serviceChangeSummaries = try values.decodeIfPresent([String: [String]].self, forKey: .serviceChangeSummaries) ?? nil
        serviceIrregularitySummaries = try values.decodeIfPresent([String: String?].self, forKey: .serviceIrregularitySummaries) ?? nil
    }
    
    init(id: String, name: String, color: String, textColor: String?, alternateName: String?, status: String, visible: Bool, scheduled: Bool, serviceChangeSummaries: [String: [String]]?, serviceIrregularitySummaries: [String: String?]?) {
        self.id = id
        self.name = name
        self.color = color
        self.textColor = textColor
        self.alternateName = alternateName
        self.status = status
        self.visible = visible
        self.scheduled = scheduled
        self.serviceChangeSummaries = serviceChangeSummaries
        self.serviceIrregularitySummaries = serviceIrregularitySummaries
    }
    
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
    
    enum Status : String, Decodable { case success, error }
}
