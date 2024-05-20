//
//  ObservedObjectCreatedInInitView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 10/04/2024.
//

import SwiftUI

struct ObservedObjectCreatedInInitView: View {
    @ObservedObject private var viewModel: ObservedObjectCreatedInInitViewModel
    
    init(
        secretDataProvider: SecretDataProviderProtocol
    ) {
        self.viewModel = ObservedObjectCreatedInInitViewModel(
            secretDataProvider: secretDataProvider
        )
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

    return ObservedObjectCreatedInInitView(
        secretDataProvider: secretDataProvider
    )
}
