//
//  GoodServiceFetcher.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 10/31/21.
//

import Foundation
import Combine

protocol GoodServiceFetchable {
  func getInfo() -> AnyPublisher<InfoResponse, GoodServiceError>
  func getMaps() -> AnyPublisher<RouteMapsResponse, GoodServiceError>
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
}
