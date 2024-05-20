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
    @Binding private var buttonColor: Color
    private let secret: String
    private let onButtonSelected: () -> Void
    
    init(
        id: Int,
        isSecretRevealed: Binding<Bool>,
        buttonColor: Binding<Color>,
        secret: String,
        onButtonSelected: @escaping () -> Void
    ) {
        self.id = id
        self._isSecretRevealed = isSecretRevealed
        self._buttonColor = buttonColor
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
                    RoundedStrokedRectangle(buttonColor: $buttonColor) {
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
