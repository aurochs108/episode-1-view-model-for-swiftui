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
        viewModel: ObservedObjectCreatedInInitViewModel
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

    return ObservedObjectCreatedInInitView(
        viewModel: ObservedObjectCreatedInInitViewModel(
            secretDataProvider: secretDataProvider
        )
    )
}
