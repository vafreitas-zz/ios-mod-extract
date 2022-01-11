//
//  ExtractSwiftUIViewModel.swift
//  TQIExtract
//
//  Created by Victor Freitas on 11/01/22.
//

import SwiftUI

final class ExtractSwiftUIViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var model: ExtractTransactions = .init()
    @Published var isLoading = false
    
    var service = ExtractService()
    
    // MARK: API Methods
    
    func getTransactions() {
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
