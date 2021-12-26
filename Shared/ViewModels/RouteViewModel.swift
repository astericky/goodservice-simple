//
//  RouteViewModel.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 11/28/21.
//

import Combine
import SwiftUI

final class RouteViewModel: ObservableObject, Identifiable {
    @Published public var route: Route
    @Published public var routeDetail: RouteDetailViewModel?
    
    private var goodServiceFetcher = GoodServiceFetcher()
    private var disposables = Set<AnyCancellable>()
    
    var id: String {
        route.id
    }
    
    var name: String {
        String(route.name.prefix(1))
    }
    
    var alternateName: String? {
        route.alternateName
    }
    
    var status: String {
        route.status
    }
    
    var bgColor: Color {
        Color.createColor(from: route.color)
    }
    
    var textColor: Color {
        Color.createColor(from: route.textColor ?? "#FFFFFF")
    }
    
    var statusColor: Color {
        Color.getColor(from: route.status)
    }
    
    init(route: Route) {
        self.route = route
    }
    
    func fetchRouteDetailFromLocalData() {
        goodServiceFetcher
            .getRouteFromLocalData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.routeDetail = RouteDetailViewModel(route: data)
            })
            .store(in: &disposables)
    }
    
    func fetchRouteDetailFromAPI() {
        goodServiceFetcher
            .getRouteFromAPI(using: name)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.routeDetail = RouteDetailViewModel(route: data)
            })
            .store(in: &disposables)
    }
}
