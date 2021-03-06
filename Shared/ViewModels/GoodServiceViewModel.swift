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
    
    private var timer: Timer?
    
    private var goodServiceFetcher: GoodServiceFetcher
    private var disposables = Set<AnyCancellable>()
    
    @Published var routes = [RouteViewModel]()
    @Published var routesByStatus = [String: [RouteViewModel]]()
    @Published var routesDictionary = [String: RouteViewModel]()
    
    @Published var stations = [StationViewModel]()
    @Published var stationsDictionary = [String: StationViewModel]()
    
    init(goodServiceFetcher: GoodServiceFetcher,
         scheduler: DispatchQueue = DispatchQueue(label: "GoodServiceViewModel")) {
        self.goodServiceFetcher = goodServiceFetcher
        self.refreshData()
        timer = Timer.scheduledTimer(withTimeInterval: 15, repeats: true, block: { _ in
            self.refreshData()
        })

    }
    
    func refreshData() {
        //#if DEBUG
        //        fetchRoutesFromLocalData()
        //        fetchStationsFromLocalData()
        //#else
        self.fetchRoutesFromAPI()
        self.fetchStationsFromAPI()
        //#endif
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
                    self.routesByStatus = self.getRoutesByStatus()
                    self.routes.forEach {
                        self.routesDictionary[$0.name] = $0
                    }
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
                    self.routesByStatus = self.getRoutesByStatus()
                    self.routes.forEach {
                        self.routesDictionary[$0.name] = $0
                    }
                })
            .store(in: &disposables)
    }
    
    func getRoutesByStatus() -> [String: [RouteViewModel]] {
        let accumulator = [String: [RouteViewModel]]()
        return self.routes.reduce(accumulator, { currentResult, currentItem in
            var routesByStatus = currentResult
            if routesByStatus[currentItem.status] != nil {
                routesByStatus[currentItem.status]!.append(currentItem)
            } else {
                routesByStatus[currentItem.status] = [currentItem]
            }
            return routesByStatus
        })
    }
    
    func fetchStationsFromAPI() {
        goodServiceFetcher
            .getStopsFromAPI()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] data in
                guard let self = self else { return }
                let newStations = data.stops.map(StationViewModel.init)
                self.stations = newStations
                self.stations.forEach {
                    self.stationsDictionary[$0.name] = $0
                }
            })
            .store(in: &disposables)
    }
    
    func fetchStationsFromLocalData() {
        goodServiceFetcher
            .getStopsFromLocalData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] data in
                guard let self = self else { return }
                let newStations = data.stops.map(StationViewModel.init)
                self.stations = newStations
            })
            .store(in: &disposables)
    }
    
    func getRoute(by name: String) -> RouteViewModel? {
        routesDictionary[name]
    }
}
