//
//  Avito_testApp.swift
//  Avito test
//
//  Created by Руслан on 4.03.2024.
//

import SwiftUI

@main
struct Avito_testApp: App {
    var modelData = AvitoData()
    @State private var isToggle = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}

