//
//  ItemsView.swift
//  LeagueChampionStats
//
//  Created by Marc Fernández on 2/1/25.
//

import SwiftUI

struct ItemsView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.background
                VStack{
                    Text("Items")
                    }
            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "square.and.pencil") //Esto es para crear items
                    }
                    
                }
            }
            }
        }
    }

#Preview {
    ItemsView()
}
