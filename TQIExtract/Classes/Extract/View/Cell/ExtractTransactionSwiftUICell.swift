//
//  ExtractTransactionSwiftUICell.swift
//  TQIExtract
//
//  Created by Victor Freitas on 11/01/22.
//

import SwiftUI

struct ExtractTransactionRow: View {
    
    // MARK: Properties
    
    let transaction: ExtractTransaction
    var iconName: String  {
        switch self.transaction.type {
        case .payment:
            return "payment-icon"
        case .pixSent:
            return "pix-sent-icon"
        case .recharge:
            return "recharge-icon"
        case .tedReceive:
            return "ted-receive-icon"
        }
    }
    
    // MARK: View
    
    var body: some View {
        HStack (spacing: 2) {
            
            // Icone da transação
            Image(uiImage: .init(named: iconName) ?? UIImage())
                .resizable()
                .frame(width: 56, height: 44)
                .scaledToFill()
                .opacity(40)
            
            // Descrição da transação
            // Recarga
            // 05.08.2022 às 15:32
            VStack(alignment: .leading, spacing: 2) {
                Text(transaction.movementDescription)
                    .foregroundColor(.init(white: 0.3))
                    .font(.system(size: 18, weight: .semibold))
                Text(transaction.dateTime)
                    .foregroundColor(.init(white: 0.6))
                    .font(.system(size: 13, weight: .medium))
            }
            .padding([.trailing, .leading], 4)
            .padding([.top, .bottom], 20)
            
            // Espaço entre Descrição da transação e valor
            Spacer()
            
            // Valor
            // R$ 250 || -R$ 2600
            Text(transaction.movement == .in ? transaction.value : "-\(transaction.value)")
                .foregroundColor(transaction.movement == .in ? Color.green : Color.red)
                .font(.system(size: 16, weight: .semibold))
                .opacity(40)
                .padding(.trailing, 8)
            
            // Icone
            // >
            Image(systemName: "chevron.right")
                .foregroundColor(Color.gray)
        }
    }
}
