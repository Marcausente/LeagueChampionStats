//
//  AssasinsView.swift
//  LeagueChampionStats
//
//  Created by Marc Fernández on 3/1/25.
//

import SwiftUI

struct AssasinsView: View {
    let assassinChampions = [
        AssassinCharacter(id: 1, name: "Akali, \n the Rogue Assassin", imageName: "AkaliIcon", lore: "Akali, una maestra del sigilo y la letalidad, lucha sola para proteger su hogar."),
        AssassinCharacter(id: 2, name: "Diana, \n Scorn of the Moon", imageName: "DianaIcon", lore: "Diana, una guerrera de los Lunari, blande el poder de la luna para destruir a sus enemigos."),
        AssassinCharacter(id: 3, name: "Ekko, \n the Boy Who Shattered Time", imageName: "EkkoIcon", lore: "Ekko, un joven genio de Zaun, manipula el tiempo para obtener ventaja en combate."),
        AssassinCharacter(id: 4, name: "Evelynn, \n Agony's Embrace", imageName: "EvelynnIcon", lore: "Evelynn, un demonio seductor, atrae a sus víctimas para alimentarse de su sufrimiento."),
        AssassinCharacter(id: 5, name: "Fizz, \n the Tidal Trickster", imageName: "FizzIcon", lore: "Fizz, un espíritu del océano, combina velocidad y astucia para derrotar a sus enemigos."),
        AssassinCharacter(id: 6, name: "Katarina, \n the Sinister Blade", imageName: "KatarinaIcon", lore: "Katarina, una letal asesina noxiana, se mueve con velocidad mortal entre sus enemigos."),
        AssassinCharacter(id: 7, name: "Kha'Zix, \n the Voidreaver", imageName: "KhaZixIcon", lore: "Kha'Zix, una criatura del Vacío, evoluciona adaptándose para cazar y devorar a sus presas."),
        AssassinCharacter(id: 8, name: "LeBlanc, \n the Deceiver", imageName: "LeeBlancIcon", lore: "LeBlanc, una maestra de la magia ilusoria, juega con las mentes de sus enemigos."),
        AssassinCharacter(id: 9, name: "Master Yi, \n the Wuju Bladesman", imageName: "YiIcon", lore: "Master Yi, un espadachín wuju, combina velocidad y precisión en cada ataque."),
        AssassinCharacter(id: 10, name: "Nocturne, \n the Eternal Nightmare", imageName: "NocturneIcon", lore: "Nocturne, una pesadilla viviente, ataca a sus enemigos desde las sombras con terror implacable."),
        AssassinCharacter(id: 11, name: "Pyke, \n the Bloodharbor Ripper", imageName: "PykeIcon", lore: "Pyke, un espíritu vengativo, asesina a los que lo traicionaron en vida."),
        AssassinCharacter(id: 12, name: "Qiyana, \n Empress of the Elements", imageName: "QiyanaIcon", lore: "Qiyana, una maestra de los elementos, utiliza su destreza para eliminar a sus enemigos con estilo."),
        AssassinCharacter(id: 13, name: "Rengar, \n the Pridestalker", imageName: "RengarIcon", lore: "Rengar, un cazador vastaya, busca constantemente superar desafíos y cazar presas más fuertes."),
        AssassinCharacter(id: 14, name: "Shaco, \n the Demon Jester", imageName: "ShacoIcon", lore: "Shaco, un asesino trastornado, utiliza el engaño y las trampas para eliminar a sus víctimas."),
        AssassinCharacter(id: 15, name: "Talon, \n the Blade's Shadow", imageName: "TalonIcon", lore: "Talon, un asesino noxiano, desgarra a sus objetivos con su destreza en el combate cuerpo a cuerpo."),
        AssassinCharacter(id: 16, name: "Viego, \n the Ruined King", imageName: "ViegoIcon", lore: "Viego, un rey trágico, busca desesperadamente reunirse con su amor perdido a cualquier costo."),
        AssassinCharacter(id: 17, name: "Zed, \n the Master of Shadows", imageName: "ZedIcon", lore: "Zed, un ninja oscuro, utiliza las sombras para derrotar a sus enemigos con precisión letal."),
        AssassinCharacter(id: 18, name: "Nidalee, \n the Bestial Huntress", imageName: "NidaleeIcon", lore: "Nidalee, una cazadora feroz, se transforma en puma para acechar y emboscar a sus presas."),
        AssassinCharacter(id: 19, name: "Elise, \n the Spider Queen", imageName: "EliseIcon", lore: "Elise, una reina arácnida, utiliza su magia y ferocidad para atrapar a sus presas."),
        AssassinCharacter(id: 20, name: "Nilah, \n the Joy Unbound", imageName: "NilahIcon", lore: "Nilah, una guerrera de aguas sagradas, elimina el mal con estilo y elegancia."),
    ]
    
    var body: some View {
        NavigationStack {
            List(assassinChampions) { assassinCharacter in
                NavigationLink(destination: AssassinDetailView(assassinCharacter: assassinCharacter)) {
                    HStack {
                        Image(assassinCharacter.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Spacer()
                            .frame(width: 15)
                        Text(assassinCharacter.name)
                            .font(.headline)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Assassins")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct AssassinCharacter: Identifiable {
    let id: Int
    let name: String
    let imageName: String
    let lore: String
}

struct AssassinDetailView: View {
    let assassinCharacter: AssassinCharacter
    
    var body: some View {
        VStack(spacing: 20) {
            Image(assassinCharacter.imageName)
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
            
            Text(assassinCharacter.name)
                .font(.largeTitle)
                .bold()
            
            Text(assassinCharacter.lore)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle(assassinCharacter.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AssasinsView()
}
