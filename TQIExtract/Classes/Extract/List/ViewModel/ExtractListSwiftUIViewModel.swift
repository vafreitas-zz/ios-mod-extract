//
//  ExtractSwiftUIViewModel.swift
//  TQIExtract
//
//  Created by Victor Freitas on 11/01/22.
//

import SwiftUI

open class ExtractListSwiftUIViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var model: ExtractTransactions = .init()
    @Published var isLoading = false
    
    public var service = ExtractService()
    
    // MARK: API Methods
    
    public func getTransactions() {
        isLoading = true
        service.getTransactions { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false
                switch result {
                case let .success(model):
                    self.model = model
                case let .failure(error):
                    debugPrint(error)
                }
            }
        }
    }
}
