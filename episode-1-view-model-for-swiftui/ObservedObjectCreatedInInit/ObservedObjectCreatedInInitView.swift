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
        VStack {
            Text("\(viewModel.id)")
            if !viewModel.isSecretRevealed {
                SecretButtonView {
                    viewModel.onButtonTapped()
                }
            } else {
                Text(viewModel.secretDataProvider.secretData)
            }
        }
    }
}

#Preview {
    let secretDataProvider = SecretDataProvider()

    return ObservedObjectCreatedInInitView(
        secretDataProvider: secretDataProvider
    )
}
