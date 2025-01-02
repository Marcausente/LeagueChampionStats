//
//  ChampionsView.swift
//  LeagueChampionStats
//
//  Created by Marc Fernández on 2/1/25.
//

import SwiftUI

struct ChampionsView: View {
    init() {
        // Configurar la apariencia de la barra de navegación
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white // Fondo blanco
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
                Color.gray.opacity(0.2) // Fondo claro de la vista
                    .ignoresSafeArea()
                VStack {
                    Text("Champions")
                        .font(.title) // Título principal del contenido
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Champions")
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
