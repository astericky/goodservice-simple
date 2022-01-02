//
//  GoodServiceIO_SimpleApp.swift
//  Shared
//
//  Created by Christopher Sanders on 10/30/21.
//

import SwiftUI

@main
struct GoodServiceIO_SimpleApp: App {
    @StateObject private var vm = GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher())

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
