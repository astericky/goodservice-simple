//
//  ContentView.swift
//  Shared
//
//  Created by Christopher Sanders on 10/30/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var viewModel = GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher())
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            TabView {
                RouteListTab(viewModel: viewModel)
                    .tabItem {
                        Image("subway")
                        Text("Trains")
                    }
                StationListTab(viewModel: viewModel)
                    .tabItem {
                        Image("railway")
                        Text("Stations")
                    }
            }
        }
    }
    
}

extension ContentView {
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
