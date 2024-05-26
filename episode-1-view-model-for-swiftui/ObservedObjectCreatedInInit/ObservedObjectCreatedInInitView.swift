//
//  ObservedObjectCreatedInInitView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 10/04/2024.
//

import SwiftUI

struct ObservedObjectCreatedInInitView: View {
    @ObservedObject private var viewModel: ViewModel
    
    init(
        secretDataProvider: SecretDataProviderProtocol
    ) {
        self.viewModel = ViewModel(
            secretDataProvider: secretDataProvider
        )
    }

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
    let secretDataProvider = SecretDataProvider()

    return ObservedObjectCreatedInInitView(
        secretDataProvider: secretDataProvider
    )
}
