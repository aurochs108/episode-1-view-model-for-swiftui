//
//  ContentViewModel.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 10/04/2024.
//

import Combine
import Foundation

final class ContentViewModel: ObservableObject {
    let id = ["🐕", "🐈", "👮‍♂️", "🎃", "👀"].randomElement() ?? "-"
    @Published var date: Date
    let secretData: SecretDataProviderProtocol
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        self.secretData = SecretDataProvider()
        self.date = Date()
        
        bind()
    }
    
    private func bind() {
        Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                guard let self else { return }
                date = Date()
            })
            .store(in: &cancellable)
    }
}
