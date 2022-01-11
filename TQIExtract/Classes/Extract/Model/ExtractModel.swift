//
//  ExtractModel.swift
//  DIOExtract
//
//  Created by Victor Freitas on 10/01/22.
//

import VFNetwork

struct ExtractTransactions: VCodable {
    var transactions: [ExtractTransaction] = []
}

struct ExtractTransaction: VCodable {
    var id: String = ""
    var movementDescription: String = ""
    var value: String = ""
    var movement: ExtractTransactionMovement = .in
    var type: String = ""
    var dateTime: String = ""
}

enum ExtractTransactionMovement: String, Codable {
    case `in` = "IN"
    case out = "OUT"
}
