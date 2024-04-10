//
//  ContentView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 07/04/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            Text("date: \(viewModel.date)")
            TabView {
                StateObjectView()
                    .tabItem {
                        Label("StateObject", systemImage: "list.dash")
                    }
                
                ObservedObjectCreatedInInitView(
                    viewModel: ObservedObjectCreatedInInitViewModel(
                        secretDataProvider: viewModel.secretData)
                )
                .tabItem {
                    Label("ObservedObject", systemImage: "list.dash")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
