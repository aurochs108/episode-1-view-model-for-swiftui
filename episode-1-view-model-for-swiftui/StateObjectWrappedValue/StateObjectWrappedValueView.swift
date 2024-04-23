//
//  StateObjectWrappedValueView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 23/04/2024.
//

import SwiftUI

struct StateObjectWrappedValueView: View {
    @StateObject private var viewModel: StateObjectWrappedValueViewModel
    
    init(
        secretDataProvider: SecretDataProviderProtocol
    ) {
        self._viewModel = StateObject(
            wrappedValue: StateObjectWrappedValueViewModel(
                secretDataProvider: secretDataProvider
            )
        )
    }

    var body: some View {
        VStack {
            Text("\(viewModel.id)")
            Text("Secret data: \(viewModel.secretDataProvider.secretData.data)")
            Text(viewModel.text)
            Text("\(viewModel.date)")
        }
    }
}

#Preview {
    let secretDataProvider = SecretDataProvider(
        secretData: SecretDataModel(
            data: UUID().uuidString
        )
    )

    return StateObjectWrappedValueView(secretDataProvider: secretDataProvider)
}
