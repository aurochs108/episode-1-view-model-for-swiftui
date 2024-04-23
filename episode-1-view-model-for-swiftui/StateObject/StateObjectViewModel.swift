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
    @Published private(set) var text = UUID().uuidString
    @Published private(set) var date = Date()
    private let secretDataProvider: SecretDataProviderProtocol
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        self.id = Int.random(in: 0...999)
        self.secretDataProvider = StaticSecretDataProvider.shared
        
        bind()
    }
    
    private func bind() {
        Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                guard let self else { return }
                text = UUID().uuidString
                date = Date()
            })
            .store(in: &cancellable)
    }
}
