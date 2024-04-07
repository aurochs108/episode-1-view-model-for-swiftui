//
//  StateObjectView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 07/04/2024.
//

import SwiftUI

struct StateObjectView: View {
    @StateObject private var viewModel = StateObjectViewModel()

    var body: some View {
        VStack {
            Text(viewModel.text)
            Text("\(viewModel.date)")
        }
    }
}

#Preview {
    StateObjectView()
}
