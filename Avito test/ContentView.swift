//
//  ContentView.swift
//  Avito test
//
//  Created by Руслан on 4.03.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: AvitoData
    @State private var selectionSection: String? = nil
    @State private var showingAlert: Bool = false
    
    var body: some View {
        NavigationStack{
            GeometryReader { geo in
                ZStack(alignment: .topTrailing) {
                    VStack(alignment: .leading) {
                        VStack {
                            Text(modelData.avitoData[0].result.title)
                                .font(.system(size: 27) .bold())
                                .lineLimit(2)
                        }
                        .padding()
                            if modelData.avitoData[0].status == "ok" {
                                ScrollView(showsIndicators: false) {
                                    ForEach(modelData.avitoData, id: \.self) { model in
                                        ForEach(model.result.list) { model in
                                            CartView(title: model.title,
                                                     image: model.icon.the52X52,
                                                     price: model.price,
                                                     description: model.description ?? " ",
                                                     selectedSection: self.$selectionSection
                                            )
                                            
                                        }
                                    }
                                }
                            } else {
                                Text("Ошибка подключения")
                            }
                        ZStack (alignment: .bottom) {
                            ActionButtonView(buttonName: modelData.avitoData[0].result.selectedActionTitle,
                                             width: geo.size.width - 30,
                                             textId: selectionSection ?? "Выберите тариф",
                                             showingAlert: $showingAlert
                            )
                                .padding()
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem (placement: .cancellationAction) {
                    Image(systemName: "xmark")
                }
            }
        }
    }
}


