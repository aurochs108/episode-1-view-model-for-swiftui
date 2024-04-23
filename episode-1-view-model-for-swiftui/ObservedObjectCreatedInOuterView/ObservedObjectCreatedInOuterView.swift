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
        VStack {
            Text("\(viewModel.id)")
            Text("Secret data: \(viewModel.secretDataProvider.secretData.data)")
            Text(viewModel.text)
            Text("\(viewModel.date)")
        }
    }
}

#Preview {
    let secretDataProvider = SecretDataProvider(
        secretData: SecretDataModel(
            data: UUID().uuidString
        )
    )

    return ObservedObjectCreatedInOuterView(
        viewModel: ObservedObjectCreatedInOuterViewModel(
            secretDataProvider: secretDataProvider
        )
    )
}

