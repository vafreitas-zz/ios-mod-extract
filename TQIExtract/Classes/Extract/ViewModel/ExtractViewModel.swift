//
//  ExtractViewModel.swift
//  DIOExtract
//
//  Created by Victor Freitas on 10/01/22.
//

import Foundation

class ExtractViewModel {
    
    // MARK: Properties
    
    var model: ExtractTransactions
    let service: ExtractService
    
    // MARK: Initializer
    
    init(model: ExtractTransactions = .init(), service: ExtractService = .init()) {
        self.model = model
        self.service = service
    }
    
    func getTransactions(completion: @escaping (Result<ExtractTransactions, Error>) -> Void) {
        service.getTransactions { result in
            switch result {
            case let .success(model):
                self.model = model
                completion(.success(model))
            case let .failure(error):
                debugPrint(error)
                completion(.failure(error))
            }
        }
    }
}
