//
//  ContentView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 07/04/2024.
//

import SwiftUI

enum TabItem: Hashable {
    case stateObject
    case observedObject
}

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("date: \(viewModel.date)")
                Spacer()
                    .frame(height: 16)
                
                NavigationLink {
                    StateObjectView()
                } label: {
                    Text("StateObjectView initialised in stadard way")
                }
                
                NavigationLink {
                    ObservedObjectCreatedInInitView(
                        secretDataProvider: viewModel.secretData
                    )
                } label: {
                    Text("ObservedObject created in init")
                }
                
                NavigationLink {
                    ObservedObjectCreatedInOuterView(
                        viewModel: ObservedObjectCreatedInOuterViewModel(
                            secretDataProvider: viewModel.secretData
                        )
                    )
                } label: {
                    Text("ObservedObject created in outer init")
                }
                
                NavigationLink {
                    StateObjectWrappedValueView(
                        secretDataProvider: viewModel.secretData
                    )
                } label: {
                    Text("State object created by wrapped value")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
