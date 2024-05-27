//
//  StateObjectWrappedValueView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 23/04/2024.
//

import SwiftUI

struct StateObjectWrappedValueView: View {
    @StateObject private var viewModel: ViewModel
    
    init(
        secretDataProvider: SecretDataProviderProtocol,
        parentViewId: Int
    ) {
        self._viewModel = StateObject(
            wrappedValue: ViewModel(
                secretDataProvider: secretDataProvider,
                parentViewId: parentViewId
            )
        )
    }

    var body: some View {
        SecretView(
            id: viewModel.id,
            isSecretRevealed: $viewModel.isSecretRevealed,
            isButtonDisabled: $viewModel.isButtonDisabled,
            buttonColor: $viewModel.buttonColor,
            secret: viewModel.secretDataProvider.secretData,
            parentViewId: viewModel.parentViewId,
            onButtonSelected: viewModel.onButtonSelected
        )
    }
}
