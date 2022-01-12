//
//  ExtractModel.swift
//  DIOExtract
//
//  Created by Victor Freitas on 10/01/22.
//

import VFNetwork

// MARK: Structs

public struct ExtractTransactions: VCodable {
    public init() {
        transactions = []
    }
    
    public var transactions: [ExtractTransaction] = []
}

public struct ExtractTransaction: VCodable {
    public var id: String = ""
    public var movementDescription: String = ""
    public var value: String = ""
    public var movement: ExtractTransactionMovement = .in
    public var type: ExtractTransactionType = .payment
    public var dateTime: String = ""
}

// MARK: Enums

public enum ExtractTransactionMovement: String, Codable {
    case `in` = "IN"
    case out = "OUT"
}

public enum ExtractTransactionType: String, Codable {
    case tedReceive = "TED_RECEIVE"
    case payment = "PAYMENT_BILL"
    case recharge = "RECHARGE"
    case pixSent = "PIX_SENT"
}
