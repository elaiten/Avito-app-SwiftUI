//
//  ActionButtonView.swift
//  Avito test
//
//  Created by Руслан on 5.03.2024.
//

import SwiftUI

struct ActionButtonView: View {
    let buttonName: String
    let width: CGFloat
    let textId: String
    
    @Binding var showingAlert: Bool
    
    var body: some View {
        HStack {
            Button {
                showingAlert = true
            } label: {
                ZStack {
                    Text(buttonName)
                        .foregroundColor(.white)
                }
                .frame(width: width, height: 70)
                .background(.blue)
                .cornerRadius(10)
            }.alert("\(textId)", isPresented: $showingAlert) {
                Button("Хорошо", role: .cancel) {}
            }
        }
    }
}


