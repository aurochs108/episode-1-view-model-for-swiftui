//
//  ObservedObjectCreatedInOuterViewModel.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 23/04/2024.
//

import Combine
import Foundation

class ObservedObjectCreatedInOuterViewModel: ObservableObject {
    let id: Int
    let secretDataProvider: SecretDataProviderProtocol
    @Published var isSecretRevealed = false
    var timer: Timer? = nil
    
    init(
        secretDataProvider: SecretDataProviderProtocol
    ) {
        self.id = Int.random(in: 0...999)
        self.secretDataProvider = secretDataProvider
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
