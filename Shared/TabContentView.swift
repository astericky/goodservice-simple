//
//  ContentViewNew.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 11/7/21.
//

import SwiftUI

struct TabContentView: View {
    @ObservedObject var viewModel: GoodServiceViewModel
    
    @State private var selection = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                
            }
        }
    }
}

private extension TabContentView {
  var loading: some View {
    Text("Loading...")
      .foregroundColor(.gray)
  }
}


struct TabContentView_Previews: PreviewProvider {
    static var viewModel = GoodServiceViewModel(goodServiceFetcher: GoodServiceFetcher())
    static var previews: some View {
        TabContentView(viewModel: viewModel)
    }
}
