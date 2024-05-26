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
        NavigationStack {
            VStack {
                Text("\(viewModel.date.ISO8601Format())")
                    .padding(.bottom, 16)
                
                navigationButton(title: "StateObject initialised in standard way") {
                    StateObjectView()
                }

                navigationButton(title: "ObservedObject created in init") {
                    ObservedObjectCreatedInInitView(
                        secretDataProvider: viewModel.secretData
                    )
                }

                navigationButton(title: "ObservedObject created in outer init") {
                    ObservedObjectCreatedInOuterView(
                        viewModel: ViewModel(
                            secretDataProvider: viewModel.secretData
                        )
                    )
                }

                navigationButton(title: "StateObject created by wrapped value") {
                    StateObjectWrappedValueView(
                        secretDataProvider: viewModel.secretData
                    )
                }
            }
        }
    }
    
    @ViewBuilder
    private func navigationButton<Content: View>(
        title: String,
        @ViewBuilder navigationTarget: () -> Content
    ) -> some View {
        NavigationLink {
            navigationTarget()
        } label: {
            RoundedStrokedRectangle {
                Text(title)
            }
        }
    }
}

#Preview {
    ContentView()
}
