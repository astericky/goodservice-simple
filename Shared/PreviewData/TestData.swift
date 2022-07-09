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
    "south": ["Wakefield - 241 St-bound trains are skipping Eastern Pkwy"],
]
let serviceIrregularitySummaries = [
    "north": "Wakefield - 241 St-bound trains are having longer wait times between Flatbush Av - Brooklyn College and Gun Hill Rd (up to 18 mins, normally every 8 mins). Sunny did this and now he's doing it again.",
    "south": "Flatbush Av - Brooklyn College/South Ferry-bound trains are having longer wait times between Chambers St and South Ferry (up to 19 mins, normally every 17 mins)."
]
let acutalRoutings = [
    "south": [
        [
            "A02",
            "A03",
            "A05",
            "A06",
            "A07",
            "A09",
            "A10",
            "A11",
            "A12",
            "A15",
            "A24",
            "A25",
            "A27",
            "A28",
            "A30",
            "A31",
            "A32",
            "D21",
            "F14",
            "F15",
            "F16",
            "F18",
            "A41",
            "A42",
            "A46",
            "A48",
            "A51",
            "A55",
            "A57",
            "A59",
            "A60",
            "A61",
            "H02",
            "H03",
            "H04",
            "H06",
            "H07",
            "H08",
            "H09",
            "H10",
            "H11"
        ],
        [
            "A02",
            "A03",
            "A05",
            "A06",
            "A07",
            "A09",
            "A10",
            "A11",
            "A12",
            "A15",
            "A24",
            "A25",
            "A27",
            "A28",
            "A30",
            "A31",
            "A32",
            "D21",
            "F14",
            "F15",
            "F16",
            "F18",
            "A41",
            "A42",
            "A46",
            "A48",
            "A51",
            "A55",
            "A57",
            "A59",
            "A60",
            "A61",
            "A63",
            "A64",
            "A65"
        ]
    ],
    "north": [
        [
            "H11",
            "H10",
            "H09",
            "H08",
            "H07",
            "H06",
            "H04",
            "H03",
            "H02",
            "H01",
            "A61",
            "A60",
            "A59",
            "A57",
            "A55",
            "A51",
            "A48",
            "A46",
            "A42",
            "A41",
            "A40",
            "A38",
            "A36",
            "A34",
            "A33",
            "A32",
            "A31",
            "A30",
            "A28",
            "A27",
            "A25",
            "A24",
            "A15",
            "A12",
            "A09",
            "A07",
            "A06",
            "A05",
            "A03",
            "A02"
        ],
        [
            "A65",
            "A64",
            "A63",
            "A61",
            "A60",
            "A59",
            "A57",
            "A55",
            "A51",
            "A48",
            "A46",
            "A42",
            "A41",
            "A40",
            "A38",
            "A36",
            "A34",
            "A33",
            "A32",
            "A31",
            "A30",
            "A28",
            "A27",
            "A25",
            "A24",
            "A15",
            "A12",
            "A09",
            "A07",
            "A06",
            "A05",
            "A03",
            "A02"
        ]
    ]
]
let route1 = Route(id: "A", name: "A", color: "#0000FF", textColor: "#FFFFFF", alternateName: "Leftert's Blvd", status: "Good Service", visible: true, scheduled: true)
let routeF = Route(id: "F", name: "F", color: "#0000FF", textColor: "#FFFFFF", alternateName: "Leftert's Blvd", status: "Good Service", visible: true, scheduled: true)
let routeSIR = Route(id: "SIR", name: "SIR", color: "#0000FF", textColor: "#FFFFFF", alternateName: "Leftert's Blvd", status: "Good Service", visible: true, scheduled: true)
let routeA = Route(id: "1", name: "1", color: "#FF0000", textColor: "#FFFFFF", alternateName: nil, status: "Not Good Service", visible: true, scheduled: true)
let routeN = Route(id: "N", name: "N", color: "#fbbd08", textColor: "#000000", alternateName: nil, status: "Delayed Service", visible: true, scheduled: true)
let routeS = Route(id: "GS", name: "S", color: "#767676", textColor: "#FFFFFF", alternateName: "42 St Shuttle", status: "Service Change", visible: true, scheduled: true)

let route1Detail = RouteDetailResponse(id: "A", name: "A", color: "#0000FF", textColor: "#FFFFFF", alternateName: "Leftert's Blvd", status: "Good Service", visible: true, scheduled: true, serviceChangeSummaries: serviceChangeSummaryObject, serviceIrregularitySummaries: serviceIrregularitySummaries, actualRoutings: acutalRoutings)
let routeADetail = RouteDetailResponse(id: "1", name: "1", color: "#FF0000", textColor: "#FFFFFF", alternateName: nil, status: "Not Good Service", visible: true, scheduled: true, serviceChangeSummaries: serviceChangeSummaryObject, serviceIrregularitySummaries: serviceIrregularitySummaries, actualRoutings: acutalRoutings)
let routeNDetail = RouteDetailResponse(id: "N", name: "N", color: "#fbbd08", textColor: "#000000", alternateName: nil, status: "Delayed Service", visible: true, scheduled: true,serviceChangeSummaries: serviceChangeSummaryObject, serviceIrregularitySummaries: serviceIrregularitySummaries, actualRoutings: acutalRoutings)
let routeSDetail = RouteDetailResponse(id: "GS", name: "S", color: "#767676", textColor: "#FFFFFF", alternateName: "42 St Shuttle", status: "Service Change", visible: true, scheduled: true, serviceChangeSummaries: serviceChangeSummaryObject, serviceIrregularitySummaries: serviceIrregularitySummaries, actualRoutings: acutalRoutings)

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
