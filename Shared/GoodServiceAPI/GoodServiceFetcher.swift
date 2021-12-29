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
    func getStopsFromLocalData() -> AnyPublisher<StopsResponse, GoodServiceError>
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
    
    func getRouteFromAPI(using route: String) -> AnyPublisher<RouteDetailResponse, GoodServiceError> {
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
    
    func getStopsFromLocalData() -> AnyPublisher<StopsResponse, GoodServiceError> {
        let stops: StopsResponse = load("stops.json")
        return Just<StopsResponse>(stops)
            .setFailureType(to: GoodServiceError.self)
            .eraseToAnyPublisher()
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
    
    func getStopFromLocalData() -> AnyPublisher<StopDetailResponse, GoodServiceError> {
        let stops: StopDetailResponse = load("stop.json")
        return Just<StopDetailResponse>(stops)
            .setFailureType(to: GoodServiceError.self)
            .eraseToAnyPublisher()
    }
    
    func getStopFromAPI(using station: String) -> AnyPublisher<StopDetailResponse, GoodServiceError> {
            guard let url = URL(string: GoodServiceFetcher.stopsURL + "/\(station)") else {
                let error = GoodServiceError.network(description: "Couldn't create url.")
                return Fail(error: error).eraseToAnyPublisher()
            }
            
            return session.dataTaskPublisher(for: URLRequest(url: url))
                .map { $0.data }
                .decode(type: StopDetailResponse.self, decoder: JSONDecoder())
                .mapError { error in
                    print(error)
                    return .network(description: error.localizedDescription)
                }
                .eraseToAnyPublisher()
    }
}
