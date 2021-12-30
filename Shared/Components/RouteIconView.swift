//
//  RouteIconView.swift
//  GoodServiceIO-Simple (iOS)
//
//  Created by Christopher Sanders on 12/19/21.
//

import SwiftUI

struct RouteIconView: View {
    var route: RouteViewModel
    var size: CGFloat = 25
    var fontSize: CGFloat {
        size * 0.50
    }
    var body: some View {
        Text(route.name)
            .font(.system(size: fontSize, weight: .bold))
            .foregroundColor(route.textColor)
            .frame(width: size, height:size)
            .background(
                Circle()
                    .foregroundColor(route.bgColor)
            )
            .padding(.vertical, 4)
    }
}

struct RouteIconView_Previews: PreviewProvider {
    static var testRouteVMA = RouteViewModel(route: routeA)
    static var testRouteVMS = RouteViewModel(route: routeS)
    static var previews: some View {
        Group {
            RouteIconView(route: testRouteVMA)
                .previewLayout(.sizeThatFits)
            RouteIconView(route: testRouteVMS, size: 100)
                .previewLayout(.sizeThatFits)
        }
    }
}
