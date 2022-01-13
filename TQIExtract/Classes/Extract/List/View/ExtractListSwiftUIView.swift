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
    @State private var isDark = false
    
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
                .toolbar {
                    Button {
                        isDark.toggle()
                    } label: {
                        isDark ? Image(systemName: "sun.max") : Image(systemName: "moon.fill")
                    }
                }
                
            }
            .onAppear { viewModel.getTransactions() }
            .environment(\.colorScheme, isDark == false ? .light : .dark)
            
            if viewModel.isLoading { LoadingViewSwiftUI() }
        }
    }
}
