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
        NavigationView {
            VStack {
                Text("\(viewModel.date.ISO8601Format())")
                    .padding(.bottom, 16)
                
                NavigationLink {
                    StateObjectView()
                } label: {
                    RoundedStrokedRectangle {
                        Text("StateObjectView initialised in standard way")
                    }
                }
                
                NavigationLink {
                    ObservedObjectCreatedInInitView(
                        secretDataProvider: viewModel.secretData
                    )
                } label: {
                    RoundedStrokedRectangle {
                        Text("ObservedObject created in init")
                    }
                }
                
                NavigationLink {
                    ObservedObjectCreatedInOuterView(
                        viewModel: ObservedObjectCreatedInOuterViewModel(
                            secretDataProvider: viewModel.secretData
                        )
                    )
                } label: {
                    RoundedStrokedRectangle {
                        Text("ObservedObject created in outer init")
                    }
                }
                
                NavigationLink {
                    StateObjectWrappedValueView(
                        secretDataProvider: viewModel.secretData
                    )
                } label: {
                    RoundedStrokedRectangle {
                        Text("State object created by wrapped value")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
