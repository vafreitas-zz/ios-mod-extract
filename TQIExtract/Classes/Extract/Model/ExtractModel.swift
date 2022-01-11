//
//  ExtractModel.swift
//  DIOExtract
//
//  Created by Victor Freitas on 10/01/22.
//

import VFNetwork

// MARK: Structs

struct ExtractTransactions: VCodable {
    var transactions: [ExtractTransaction] = []
}

struct ExtractTransaction: VCodable {
    var id: String = ""
    var movementDescription: String = ""
    var value: String = ""
    var movement: ExtractTransactionMovement = .in
    var type: ExtractTransactionType = .payment
    var dateTime: String = ""
}

// MARK: Enums

enum ExtractTransactionMovement: String, Codable {
    case `in` = "IN"
    case out = "OUT"
}

enum ExtractTransactionType: String, Codable {
    case tedReceive = "TED_RECEIVE"
    case payment = "PAYMENT_BILL"
    case recharge = "RECHARGE"
    case pixSent = "PIX_SENT"
}
