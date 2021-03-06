//
//  StationViewModel.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/29/21.
//

import Combine
import SwiftUI

final class StationViewModel: ObservableObject, Identifiable {
    @Published public var station: Stop
    @Published public var stationDetail: StationDetailViewModel?
    
    private var timer: Timer?
    private var goodServiceFetcher = GoodServiceFetcher()
    private var disposables = Set<AnyCancellable>()
    
    var id: String {
        station.id
    }
    
    var name: String {
        station.name
    }
    
    var secondaryName: String {
        station.secondaryName ?? ""
    }
    
    var routes: [String] {
        Array<String>(station.routes.keys)
    }
    
    init(station: Stop) {
        self.station = station
    }
    
    init(station: Stop, stationDetail: StationDetailViewModel) {
        self.station = station
        self.stationDetail = stationDetail
    }
    
    func refreshStationData() {
        timer = Timer.scheduledTimer(withTimeInterval: 15, repeats: true, block: { _ in
            //#if DEBUG
            //        station.fetchStationFromLocalData()
            //#else
                    self.fetchStationFromAPI()
            //#endif
        })
    }
    
    func fetchStationFromLocalData() {
        goodServiceFetcher
            .getStopFromLocalData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.stationDetail = StationDetailViewModel(station: data)
            })
            .store(in: &disposables)
    }
    
    func fetchStationFromAPI() {
        goodServiceFetcher
            .getStopFromAPI(using: station.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.stationDetail = StationDetailViewModel(station: data)
            })
            .store(in: &disposables)
    }
}

// Used to conform to the protocal Hashable with gives one the ability to
// differentiate between one item compared to another item
extension StationViewModel: Hashable {
  static func == (lhs: StationViewModel, rhs: StationViewModel) -> Bool {
    return lhs.id == rhs.id
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(self.name)
  }
}
