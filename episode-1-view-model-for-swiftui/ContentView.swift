//
//  ContentView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 07/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            StateObjectView()
                .tabItem {
                    Label("StateObject", systemImage: "list.dash")
                }
        }
    }
}

#Preview {
    ContentView()
}
