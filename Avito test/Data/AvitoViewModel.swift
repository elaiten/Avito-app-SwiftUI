//
//  ViewModel.swift
//  Avito test
//
//  Created by Руслан on 4.03.2024.
//

import SwiftUI
import Foundation


struct AvitoModel: Codable, Hashable {
    let status: String 
    let result: Result
}


struct Result: Codable, Hashable {
    let title: String
    let actionTitle: String
    let selectedActionTitle: String
    let list: [List]
}


struct List: Codable, Identifiable, Hashable {
    
    let id: String
    let title: String
    let description: String?
    let icon: Icon
    let price: String
    let isSelected: Bool
}


struct Icon: Codable, Hashable {
    let the52X52: String

    enum CodingKeys: String, CodingKey {
        case the52X52 = "52x52"
    }
}



