//
//  SecretView.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 19/05/2024.
//

import SwiftUI

struct SecretView: View {
    private var id: Int
    @Binding private var isSecretRevealed: Bool
    private let secret: String
    private let onButtonSelected: () -> Void
    
    init(
        id: Int,
        isSecretRevealed: Binding<Bool>,
        secret: String,
        onButtonSelected: @escaping () -> Void
    ) {
        self.id = id
        self._isSecretRevealed = isSecretRevealed
        self.secret = secret
        self.onButtonSelected = onButtonSelected
    }
    
    var body: some View {
        VStack {
            Text("\(id)")
            if !isSecretRevealed {
                Button {
                    onButtonSelected()
                } label: {
                    RoundedStrokedRectangle {
                        Text("Reveal secret")
                    }
                }
            } else {
                Text(secret)
                    .foregroundStyle(.pink)
            }
        }
    }
}
