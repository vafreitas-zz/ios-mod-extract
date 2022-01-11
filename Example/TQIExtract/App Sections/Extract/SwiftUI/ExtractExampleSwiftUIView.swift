//
//  ExtractExampleSwiftUIView.swift
//  DIOExtract_Example
//
//  Created by Victor Freitas on 11/01/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI
import TQIExtract
//
//struct ExtractTransactionRow: View {
//    
//    var body: some View {
//        HStack {
//            Image(systemName: "arrow.turn.up.forward.iphone")
//                .resizable()
//                .frame(width: 40, height: 30)
//                .scaledToFill()
//            VStack(alignment: .leading) {
//                Text("Title")
//                    .foregroundColor(.init(white: 0.4))
//                    .font(.system(size: 18, weight: .semibold))
//                Text("Subtitle")
//                    .foregroundColor(.init(white: 0.6))
//            }
//            .padding()
//            
//            Spacer()
//            Text("22,90 R$")
//                .foregroundColor(Color.green)
//                .font(.system(size: 18, weight: .semibold))
//            
//            Image(systemName: "chevron.right")
//                .foregroundColor(Color.gray)
//        }
//    }
//}
//
//struct ExtractExampleSwiftUIView: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                List(0..<10) { item in
//                    ExtractTransactionRow()
//                }
//                .listStyle(.plain)
//                
//                .navigationTitle("Extrato")
//            }
//        }
//    }
//}

struct ExtractExampleSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSwiftUIView()
    }
}
