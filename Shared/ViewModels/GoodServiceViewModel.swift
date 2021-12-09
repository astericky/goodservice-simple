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
    
}
