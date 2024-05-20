//
//  RoundedStrokedRectangle.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 19/05/2024.
//

import SwiftUI

struct RoundedStrokedRectangle<Label: View>: View {
    @Binding var buttonColor: Color
    let label: () -> Label
    
    init(
        buttonColor: Binding<Color> = .constant(.white),
        @ViewBuilder label: @escaping () -> Label
    ) {
        self._buttonColor = buttonColor
        self.label = label
    }

    var body: some View {
        label()
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 24)
                    .stroke(.black, lineWidth: 1)
                    .fill(buttonColor)
                
            }
    }
}
