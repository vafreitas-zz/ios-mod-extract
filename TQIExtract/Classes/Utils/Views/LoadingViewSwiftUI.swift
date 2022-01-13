//
//  LoadingView.swift
//  Pods-TQIExtract_Example
//
//  Created by Victor Freitas on 11/01/22.
//

import SwiftUI

struct LoadingViewSwiftUI: View {
    
    @State var isDark = false
    
    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .scaleEffect(2)
        }
        .environment(\.colorScheme, isDark ? .dark : .light)
        
    }
}
