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
            Tab ( "Breaking Bad", systemImage: "tortoise") {
                Text("Breaking Bad")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            Tab("Better Call Saul", systemImage: "briefcase") {
                Text("Better Call Saul")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
