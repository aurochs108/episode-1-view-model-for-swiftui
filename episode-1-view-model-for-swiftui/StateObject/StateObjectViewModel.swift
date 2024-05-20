//
//  StateObjectViewModel.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 07/04/2024.
//

import Combine
import Foundation

final class StateObjectViewModel: ObservableObject {
    let id: Int
    let secretDataProvider: SecretDataProviderProtocol = SecretDataProvider()
    @Published var isSecretRevealed = false
    var timer: Timer? = nil
    
    init() {
        self.id = Int.random(in: 0...999)
    }
    
    func onButtonSelected() {
        timer = Timer
            .scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                DispatchQueue.main.async { [weak self] in
                    self?.isSecretRevealed = true
                }
            }
    }
}
