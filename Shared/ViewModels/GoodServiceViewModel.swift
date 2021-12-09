//
//  GoodServiceViewModel.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 11/22/21.
//

import Combine
import SwiftUI


final class GoodServiceViewModel: ObservableObject, Identifiable {
    private var timestamp = ""
    
//    private var timer: Timer?
    
    private var goodServiceFetcher: GoodServiceFetcher
    private var disposables = Set<AnyCancellable>()
    
    @Published var routes = [RouteViewModel]()
    @Published var routesByStatus = [RouteViewModel]()
    
    init(goodServiceFetcher: GoodServiceFetcher,
        scheduler: DispatchQueue = DispatchQueue(label: "GoodServiceViewModel")) {
        self.goodServiceFetcher = goodServiceFetcher
        #if DEBUG
            fetchRoutesFromLocalData()
        #else
            fetchRoutesFromAPI()
        #endif
    }
    
    func fetchRoutesFromAPI() {
        goodServiceFetcher
            .getRoutesFromAPI()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] data in
                guard let self = self else { return }
                let newRoutes = data.routes.values.map(RouteViewModel.init)
                self.routes = newRoutes
            })
            .store(in: &disposables)
    }
    
    func fetchRoutesFromLocalData() {
        goodServiceFetcher
            .getRoutesFromLocalData()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] data in
                guard let self = self else { return }
                let newRoutes = data.routes.values.map(RouteViewModel.init)
                self.routes = newRoutes
            })
            .store(in: &disposables)
    }
    
    func getRoutesByStatus() -> [String: [RouteViewModel]] {
        var accumulator = [String: [RouteViewModel]]()
        return routes.reduce(accumulator, { currentResult, currentItem in
            if var statusArray = accumulator[currentItem.status] {
                statusArray.append(currentItem)
            } else {
                accumulator[currentItem.status] = [currentItem]
            }
            return accumulator
        })
    }
    
}
