//
//  GoodServiceHeaderView.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/12/21.
//

import SwiftUI

struct GoodServiceHeaderView: View {
    var body: some View {
        HStack {
            Text("goodservice.io")
                .foregroundColor(Color("color-good-service"))
        }
    }
}

struct GoodServiceHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        GoodServiceHeaderView()
    }
}
