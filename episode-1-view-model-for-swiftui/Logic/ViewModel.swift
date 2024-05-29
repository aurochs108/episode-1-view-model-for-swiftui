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
    let parentViewId: String
    @Published var isSecretRevealed = false
    @Published var isButtonDisabled = false
    var timer: Timer? = nil
    var runCount = 0
    @Published var buttonColor = Color.white
    private var colors: [Color] = [.red, .yellow, .green]
    
    init(
        secretDataProvider: SecretDataProviderProtocol,
        parentViewId: String
    ) {
        self.id = Int.random(in: 0...999)
        self.secretDataProvider = secretDataProvider
        self.parentViewId = parentViewId
    }
    
    func onButtonSelected() {
        isButtonDisabled = true

        timer = Timer
            .scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    runCount += 1

                    withAnimation { [weak self] in
                        self?.setNextButtonColor()
                    }

                    if runCount == 4 {
                        isSecretRevealed = true
                        timer.invalidate()
                    }
                }
            }
    }

    private func setNextButtonColor() {
        buttonColor = colors.first ?? .clear
        deleteFirstColor()
    }
    
    private func deleteFirstColor() {
        if !colors.isEmpty {
            colors.removeFirst()
        }
    }
}
