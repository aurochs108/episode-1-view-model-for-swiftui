//
//  RoundedStrokedRectangle.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 19/05/2024.
//

import SwiftUI

struct RoundedStrokedRectangle<Label: View>: View {
    let label: () -> Label
    
    init(@ViewBuilder label: @escaping () -> Label) {
        self.label = label
    }

    var body: some View {
        label()
            .padding(8)
            .overlay {
                RoundedRectangle(cornerRadius: 24)
                    .stroke(.black, lineWidth: 1)
            }
    }
}

#Preview {
    RoundedStrokedRectangle {
        Text("Text")
    }
}
