//
//  ObservedObjectCreatedInOuterView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 10/04/2024.
//

import SwiftUI

struct ObservedObjectCreatedInOuterView: View {
    @ObservedObject private var viewModel: ObservedObjectCreatedInOuterViewModel
    
    init(
        viewModel: ObservedObjectCreatedInOuterViewModel
    ) {
        self.viewModel = viewModel
    }

    var body: some View {
        SecretView(
            id: viewModel.id,
            isSecretRevealed: $viewModel.isSecretRevealed,
            buttonColor: $viewModel.buttonColor,
            secret: "Secret",
            onButtonSelected: viewModel.onButtonSelected
        )
    }
}

#Preview {
    let secretDataProvider = SecretDataProvider()

    return ObservedObjectCreatedInOuterView(
        viewModel: ObservedObjectCreatedInOuterViewModel(
            secretDataProvider: secretDataProvider
        )
    )
}

