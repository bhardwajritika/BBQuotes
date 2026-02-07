//
//  ContentView.swift
//  BBQuotes
//
//  Created by Tarun Sharma on 03/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab ( Constants.bbName, systemImage: "tortoise") {
                QuoteView(show: Constants.bbName )
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            Tab(Constants.bcsName, systemImage: "briefcase") {
                QuoteView(show: Constants.bcsName)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            Tab(Constants.ecName, systemImage: "car") {
                QuoteView(show: Constants.ecName)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }

        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
