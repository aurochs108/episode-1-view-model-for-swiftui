//
//  StateObjectWrappedValueViewModel.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 23/04/2024.
//

import Foundation
import Combine
import SwiftUI

class ViewModel: ObservableObject {
    let id: Int
    let secretDataProvider: SecretDataProviderProtocol
    @Published var isSecretRevealed = false
    var timer: Timer? = nil
    var runCount = 0
    @Published var buttonColor = Color.white
    private let colors: [Color] = [.yellow, .red, .green, .teal, .blue]
    
    init(
        secretDataProvider: SecretDataProviderProtocol
    ) {
        self.id = Int.random(in: 0...999)
        self.secretDataProvider = secretDataProvider
    }
    
    func onButtonSelected() {
        timer = Timer
            .scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    runCount += 1
                    buttonColor = colors.randomElement() ?? .white
                    
                    if runCount == 3 {
                        isSecretRevealed = true
                        timer.invalidate()
                    }
                }
            }
    }
}
