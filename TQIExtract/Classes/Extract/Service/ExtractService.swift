//
//  ExtractService.swift
//  DIOExtract
//
//  Created by Victor Freitas on 10/01/22.
//

import VFNetwork

class ExtractService: RequestService<ExtractAPI> {
    func getTransactions(completion: @escaping (Result<ExtractTransactions, Error>) -> Void) {
        execute(.transactions, responseType: ExtractTransactions.self, completion: completion)
    }
}

