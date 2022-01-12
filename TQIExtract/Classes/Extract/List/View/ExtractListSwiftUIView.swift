//
//  ExtractSwiftUIView.swift
//  DIOExtract
//
//  Created by Victor Freitas on 11/01/22.
//

import SwiftUI
import Foundation

public struct ExtractListSwiftUIView: View {
    
    // MARK: Properties
    
    @StateObject private var viewModel = ExtractListSwiftUIViewModel()
    
    // MARK: Initializer
    
    public init() {}
    
    // MARK: View
    
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
