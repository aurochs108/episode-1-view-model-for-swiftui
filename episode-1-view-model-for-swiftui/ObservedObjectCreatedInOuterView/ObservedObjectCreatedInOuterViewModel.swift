//
//  ObservedObjectCreatedInOuterViewModel.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 23/04/2024.
//

import Combine
import Foundation

class ObservedObjectCreatedInOuterViewModel: ObservableObject {
    private(set) var id: Int
    @Published private(set) var text = UUID().uuidString
    @Published private(set) var date = Date()
    let secretDataProvider: SecretDataProviderProtocol
    private var cancellable = Set<AnyCancellable>()
    
    init(secretDataProvider: SecretDataProviderProtocol) {
        self.id = Int.random(in: 0...999)
        self.secretDataProvider = secretDataProvider
        
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
