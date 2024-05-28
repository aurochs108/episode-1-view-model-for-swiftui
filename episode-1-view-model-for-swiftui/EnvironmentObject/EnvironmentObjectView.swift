//
//  EnvironmentObjectView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 28/05/2024.
//

import Foundation
import SwiftUI

struct EnvironmentObjectView: View {
    @EnvironmentObject private var viewModel: ViewModel

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
