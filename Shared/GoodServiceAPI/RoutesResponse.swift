//
//  RoutesResponse.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 11/3/21.
//

import Foundation

struct Route: Codable {
    let id: String
    let name: String
    let color: String
    let textColor: String?
    let alternateName: String?
    let status: String
    let visible: Bool
    let scheduled: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case color
        case textColor = "text_color"
        case alternateName = "alternate_name"
        case status
        case visible
        case scheduled
    }
}

struct BlogPost: Codable {
    let link: String
    let title: String
}

struct RoutesResponse: Codable {
    let routes: [String: Route]
    let timestamp: Int
    let blogPost: BlogPost
    
    enum CodingKeys: String, CodingKey {
        case routes
        case timestamp
        case blogPost = "blog_post"
    }
}
