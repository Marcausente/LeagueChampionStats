//
//  ChampionsView.swift
//  LeagueChampionStats
//
//  Created by Marc Fernández on 2/1/25.
//

import SwiftUI

struct ChampionsView: View {
    init() {
        // Esto configura la apariencia de la navbar de arriba
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white 
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 17, weight: .bold) // Texto estándar
        ]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                VStack {
                    Text("Champions") //Puesto provisional aqui ira el contenido
                        .font(.title)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Champions") //Titulo de la pagina en este caso champions
                        .font(.headline)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
            }
        }
    }
}

#Preview {
    ChampionsView()
}
