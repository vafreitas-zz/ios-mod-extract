//
//  ExtractSwiftUIView.swift
//  DIOExtract
//
//  Created by Victor Freitas on 11/01/22.
//

import SwiftUI
import Foundation

struct ExtractTransactionRow: View {
    
    let transaction: ExtractTransaction
    
    var body: some View {
        HStack {
            Image(uiImage: .init(named: "recharge-icon") ?? UIImage())
                .resizable()
                .frame(width: 40, height: 30)
                .scaledToFill()
            VStack(alignment: .leading) {
                Text(transaction.movementDescription)
                    .foregroundColor(.init(white: 0.4))
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.bottom, 2)
                Text(transaction.dateTime)
                    .foregroundColor(.init(white: 0.6))
                    .font(.system(size: 12))
            }
            .padding()
            
            Spacer()
            Text(transaction.movement == .in ? transaction.value : "-\(transaction.value)")
                .foregroundColor(transaction.movement == .in ? Color.green : Color.red)
                .font(.system(size: 18, weight: .semibold))
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color.gray)
        }
    }
}

public struct ExtractSwiftUIView: View {
    
    @StateObject private var viewModel = ExtractSwiftUIViewModel()
    
    public init() {}
    
    public var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.model.transactions, id: \.id) { transaction in
                    ExtractTransactionRow(transaction: transaction)
                }
                .refreshable {
                    viewModel.getTransactions()
                }
                .listStyle(.plain)
                .navigationTitle("Extrato")
                
            }
            .onAppear { viewModel.getTransactions() }
            
            if viewModel.isLoading { LoadingView() }
        }
    }
}
