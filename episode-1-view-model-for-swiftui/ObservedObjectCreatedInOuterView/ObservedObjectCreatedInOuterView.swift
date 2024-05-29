//
//  ObservedObjectCreatedInOuterView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 10/04/2024.
//

import SwiftUI

struct ObservedObjectCreatedInOuterView: View {
    @ObservedObject private var viewModel: ViewModel
    
    init(
        viewModel: ViewModel
    ) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text("ObservedObject created in outer init")
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
