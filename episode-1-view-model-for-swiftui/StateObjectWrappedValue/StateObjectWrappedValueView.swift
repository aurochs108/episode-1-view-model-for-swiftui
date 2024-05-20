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
        SecretView(
            id: viewModel.id,
            isSecretRevealed: $viewModel.isSecretRevealed,
            secret: "Secret",
            onButtonSelected: viewModel.onButtonSelected
        )
    }
}

#Preview {
    let secretDataProvider = SecretDataProvider()

    return StateObjectWrappedValueView(secretDataProvider: secretDataProvider)
}
