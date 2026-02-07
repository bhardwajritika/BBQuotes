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
                MainView(show: Constants.bbName )
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            Tab(Constants.bcsName, systemImage: "briefcase") {
                MainView(show: Constants.bcsName)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            Tab(Constants.ecName, systemImage: "car") {
                MainView(show: Constants.ecName)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }

        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
