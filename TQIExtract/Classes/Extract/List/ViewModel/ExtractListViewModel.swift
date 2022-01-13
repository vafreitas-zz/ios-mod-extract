//
//  ExtractViewModel.swift
//  DIOExtract
//
//  Created by Victor Freitas on 10/01/22.
//

import Foundation

open class ExtractListViewModel {
    
    // MARK: Properties
    
    var model: ExtractTransactions
    public let service: ExtractService
    
    // MARK: Initializer
    
    public init(model: ExtractTransactions = .init(), service: ExtractService = .init()) {
        self.model = model
        self.service = service
    }
    
    public func getTransactions(completion: @escaping (Result<ExtractTransactions, Error>) -> Void) {
        service.getTransactions { [weak self] result in
            guard let self = self else { return }
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
