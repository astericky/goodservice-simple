//
//  GoodServiceFetcher.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 10/31/21.
//

import Foundation
import Combine

protocol GoodServiceFetchable {
    func getRoutes() -> AnyPublisher<RoutesResponse, GoodServiceError>
    func getStops() -> AnyPublisher<StopsResponse, GoodServiceError>
}

class GoodServiceFetcher {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension GoodServiceFetcher: GoodServiceFetchable {    
    static let routesURL = "https://goodservice.io/api/routes"
    static let stopsURL = "https://goodservice.io/api/stops"
    
    func getRoutes() -> <AnyPublisher, GoodServiceError> {
#if DEBUG
        let routes: RoutesResponse = load("routes.json")
        return routes
#else
        guard let url = URL(string: GoodServiceFetcher.routesURL) else {
            let error = GoodServiceError.network(description: "Couldn't create url.")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .decode(type: RoutesResponse.self, decoder: JSONDecoder())
            .mapError { error in
                print(error)
                return .network(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
#endif
    }
    
    func getStops() -> <AnyPublisher, GoodServiceError> {
#if DEBUG
        let stops: StopsResponse = load("stops.json")
        return stops
#else
        guard let url = URL(string: GoodServiceFetcher.stopsURL) else {
            let error = GoodServiceError.network(description: "Couldn't create url.")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .decode(type: StopsResponse.self, decoder: JSONDecoder())
            .mapError { error in
                print(error)
                return .network(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
#endif
    }
}
