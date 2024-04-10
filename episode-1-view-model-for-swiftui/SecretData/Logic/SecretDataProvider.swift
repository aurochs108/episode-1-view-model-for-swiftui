//
//  SecretDataProviderWithInit.swift
//  episode-1-view-model-for-swiftui
//
//  Created by Dawid on 10/04/2024.
//

import Foundation

final class SecretDataProvider: SecretDataProviderProtocol {
    let secretData: SecretDataModel
    
    init(secretData: SecretDataModel) {
        self.secretData = secretData
    }
}
