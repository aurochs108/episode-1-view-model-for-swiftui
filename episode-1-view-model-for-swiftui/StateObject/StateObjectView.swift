//
//  StateObjectView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 07/04/2024.
//

import SwiftUI

struct StateObjectView: View {
    @StateObject private var viewModel = ViewModel(secretDataProvider: SecretDataProvider())

    var body: some View {
        SecretView(
            id: viewModel.id,
            isSecretRevealed: $viewModel.isSecretRevealed,
            isButtonDisabled: $viewModel.isButtonDisabled,
            buttonColor: $viewModel.buttonColor,
            secret: viewModel.secretDataProvider.secretData,
            onButtonSelected: viewModel.onButtonSelected
        )
    }
}

#Preview {
    StateObjectView()
}
