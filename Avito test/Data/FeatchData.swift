//
//  FeatchData.swift
//  Avito test
//
//  Created by Руслан on 4.03.2024.
//

import SwiftUI
import Foundation

class AvitoData: ObservableObject {
    
    @Published var avitoData: [AvitoModel] = load("avito.json")
}

func load(_ filename: String) -> [AvitoModel] {
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        let data = try Data(contentsOf: file)
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode(AvitoModel.self, from: data)
        return [jsonData]
    } catch {
        print("error:\(error)")
    }
    return []
}
