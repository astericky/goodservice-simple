//
//  TestData.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 10/31/21.
//

import Foundation

// Test Routes: Primarily for testing out SwiftUI Components
let serviceChangeSummaryObject = [
    "both": ["<2> trains are skipping Clark St."],
    "north": ["Wakefield - 241 St-bound trains are skipping Eastern Pkwy - Brooklyn Museum, Grand Army Plaza, and Bergen St."],
    "south": ["Wakefield - 241 St-bound trains are skipping Eastern Pkwy - Brooklyn Museum, Grand Army Plaza, and Bergen St."],
]
let serviceIrregularitySummaries = [
    "north": "Wakefield - 241 St-bound trains are having longer wait times between Flatbush Av - Brooklyn College and Gun Hill Rd (up to 18 mins, normally every 8 mins).",
    "south": "Flatbush Av - Brooklyn College-bound trains are having longer wait times between Wakefield - 241 St and Franklin Av - Medgar Evers College (up to 20 mins, normally every 9 mins)."
]
let route1 = Route(id: "A", name: "A", color: "#0000FF", textColor: "#FFFFFF", alternateName: "Leftert's Blvd", status: "Good Service", visible: true, scheduled: true)
let routeA = Route(id: "1", name: "1", color: "#FF0000", textColor: "#FFFFFF", alternateName: nil, status: "Not Good Service", visible: true, scheduled: true)
let routeN = Route(id: "N", name: "N", color: "#fbbd08", textColor: "#000000", alternateName: nil, status: "Delayed Service", visible: true, scheduled: true)
let routeS = Route(id: "GS", name: "S", color: "#767676", textColor: "#FFFFFF", alternateName: "42 St Shuttle", status: "Service Change", visible: true, scheduled: true)

let route1Detail = RouteDetailResponse(id: "A", name: "A", color: "#0000FF", textColor: "#FFFFFF", alternateName: "Leftert's Blvd", status: "Good Service", visible: true, scheduled: true, serviceChangeSummaries: serviceChangeSummaryObject, serviceIrregularitySummaries: serviceIrregularitySummaries)
let routeADetail = RouteDetailResponse(id: "1", name: "1", color: "#FF0000", textColor: "#FFFFFF", alternateName: nil, status: "Not Good Service", visible: true, scheduled: true, serviceChangeSummaries: serviceChangeSummaryObject, serviceIrregularitySummaries: serviceIrregularitySummaries)
let routeNDetail = RouteDetailResponse(id: "N", name: "N", color: "#fbbd08", textColor: "#000000", alternateName: nil, status: "Delayed Service", visible: true, scheduled: true,serviceChangeSummaries: serviceChangeSummaryObject, serviceIrregularitySummaries: serviceIrregularitySummaries)
let routeSDetail = RouteDetailResponse(id: "GS", name: "S", color: "#767676", textColor: "#FFFFFF", alternateName: "42 St Shuttle", status: "Service Change", visible: true, scheduled: true, serviceChangeSummaries: serviceChangeSummaryObject, serviceIrregularitySummaries: serviceIrregularitySummaries)

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
