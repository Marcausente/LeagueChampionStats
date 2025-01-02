//
//  CampionsView.swift
//  LeagueChampionStats
//
//  Created by Marc Fernández on 2/1/25.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView{
            
            ChampionsView()
                .tabItem {
                    Image(systemName: "figure.wave") //Icono puesto para los campeones
                    Text("Champions")
                }
                .edgesIgnoringSafeArea(.top) //Esto es para que la vista se pinte arriba tambien
            
            ItemsView()
                .tabItem {
                    Image(systemName: "handbag")
                    Text("Items")
                }
                .edgesIgnoringSafeArea(.top)
        }
    }
}


#Preview {
    MyTabView()
}
