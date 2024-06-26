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
        secretDataProvider: SecretDataProviderProtocol,
        parentViewId: String
    ) {
        self.viewModel = ViewModel(
            secretDataProvider: secretDataProvider,
            parentViewId: parentViewId
        )
    }

    var body: some View {
        VStack {
            Text("ObservedObject created in init")
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
}
