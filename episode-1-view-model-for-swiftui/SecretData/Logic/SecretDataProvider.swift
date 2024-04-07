//
//  SecretDataProvider.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 07/04/2024.
//

import Foundation

final class SecretDataProvider: SecretDataProviderProtocol {
    static let shared = SecretDataProvider()
    
    let secretData: SecretDataModel
    
    private init() {
        self.secretData = SecretDataModel(data: UUID().uuidString)
    }
}
