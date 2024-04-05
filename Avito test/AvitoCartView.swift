//
//  CartView.swift
//  Avito test
//
//  Created by Руслан on 4.03.2024.
//

import SwiftUI

struct CartView: View {
    
    let title: String
    let image: String
    let price: String
    let description: String
    @Environment (\.colorScheme) var colorScheme
    @Binding var selectedSection: String?
    
    var body: some View {
        ZStack(alignment: .center) {
            HStack(alignment: .top, spacing: 15 ) {
                AsyncImage(url: URL(string: image))
                    .frame(width: 52, height: 52)
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(.system(size: 24) .bold())
                    Text(description)
                        .font(.body)
                    Text(price)
                        .font(.headline)
                }
                Image(systemName: title == selectedSection ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue .opacity(0.8))
            }
            .padding()

        }
        .background(colorScheme == .light ? .gray .opacity(0.1) : .gray .opacity(0.2))
        .cornerRadius(10)
        .onTapGesture {
            self.changeSelection(index: title)
        }
    }
    func changeSelection(index: String){
        if selectedSection != title {
            selectedSection = title
        } else {
            selectedSection = nil
        }
    }
}


