//
//  GoodServiceFetcher.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 10/31/21.
//

import Foundation
import Combine

protocol GoodServiceFetchable {
    func getRoutesFromLocalData() -> AnyPublisher<RoutesResponse, GoodServiceError>
    func getRoutesFromAPI() -> AnyPublisher<RoutesResponse, GoodServiceError>
    func getStopsFromLocalData() -> StopsResponse
    func getStopsFromAPI() -> AnyPublisher<StopsResponse, GoodServiceError>
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
    
    func getRoutesFromLocalData() -> AnyPublisher<RoutesResponse, GoodServiceError> {
        let routes: RoutesResponse = load("routes.json")
        return Just<RoutesResponse>(routes)
            .setFailureType(to: GoodServiceError.self)
            .eraseToAnyPublisher()
    }
    
    func getRoutesFromAPI() -> AnyPublisher<RoutesResponse, GoodServiceError> {
        guard let url = URL(string: GoodServiceFetcher.routesURL) else {
            let error = GoodServiceError.network(description: "Couldn't create url.")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .map { $0.data }
            .decode(type: RoutesResponse.self, decoder: JSONDecoder())
            .mapError { error in
                print(error)
                return .network(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
    
    func getRouteFromLocalData() -> AnyPublisher<RouteDetailResponse, GoodServiceError> {
        let routes: RouteDetailResponse = load("route.json")
        return Just<RouteDetailResponse>(routes)
            .setFailureType(to: GoodServiceError.self)
            .eraseToAnyPublisher()
    }
    
    func getRouteFromAPI(route: String) -> AnyPublisher<RouteDetailResponse, GoodServiceError> {
        guard let url = URL(string: GoodServiceFetcher.routesURL + "/\(route)") else {
            let error = GoodServiceError.network(description: "Couldn't create url.")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .map { $0.data }
            .decode(type: RouteDetailResponse.self, decoder: JSONDecoder())
            .mapError { error in
                print(error)
                return .network(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
    
    func getStopsFromLocalData() -> StopsResponse {
        return load("stops.json")
    }
    
    func getStopsFromAPI() -> AnyPublisher<StopsResponse, GoodServiceError> {
        guard let url = URL(string: GoodServiceFetcher.stopsURL) else {
            let error = GoodServiceError.network(description: "Couldn't create url.")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .map { $0.data }
            .decode(type: StopsResponse.self, decoder: JSONDecoder())
            .mapError { error in
                print(error)
                return .network(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()

    }
    
    func getStops() -> StopsResponse {
        let stops: StopsResponse = load("stops.json")
        return stops
    }
}
