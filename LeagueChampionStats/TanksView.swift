//
//  TanksView.swift
//  LeagueChampionStats
//
//  Created by Marc Fernández on 3/1/25.
//

import SwiftUI

struct TanksView: View {
    let characters = [
        Character(id: 1, name: "Malphite,\n the Shard of the Monolith", imageName: "MalphiteIcon", lore: "Malphite, un fragmento vivo del Monolito, lucha por mantener el orden en un mundo caótico."),
        Character(id: 2, name: "Maokai,\n the Twisted Treant", imageName: "MaokaiIcon", lore: "Maokai, un espíritu vengativo de la naturaleza, busca restaurar la vida en las Islas de la Sombra."),
        Character(id: 3, name: "Nautilus,\n the Titan of the Depths", imageName: "NautilusIcon", lore: "Nautilus, un coloso de las profundidades, protege el océano y castiga a los que lo traicionan."),
        Character(id: 4, name: "Rammus, \n the Armordillo", imageName: "RammusIcon", lore: "Rammus, una criatura enigmática, avanza imparable con su caparazón blindado."),
        Character(id: 5, name: "Sion,\n the Undead Juggernaut", imageName: "SionIcon", lore: "Sion, un guerrero noxiano resucitado, destruye todo a su paso con una furia incontrolable."),
        Character(id: 6, name: "Cho'Gath, \n the Terror of the Void", imageName: "ChoGathIcon", lore: "Cho'Gath, una abominación del Vacío, crece devorando todo lo que encuentra."),
        Character(id: 7, name: "Ornn, \n the Fire Below the Mountain", imageName: "OrnnIcon", lore: "Ornn, un semidiós Freljordiano, forja armas legendarias y protege a los suyos."),
        Character(id: 8, name: "Sejuani, \n Fury of the North", imageName: "SejuaniIcon", lore: "Sejuani, una líder feroz de Freljord, lucha incansablemente por la supervivencia de su tribu."),
        Character(id: 9, name: "Leona, \n the Radiant Dawn", imageName: "LeonaIcon", lore: "Leona, una guerrera de los Solari, blande el poder del sol para proteger a los inocentes."),
        Character(id: 10, name: "Shen, \n the Eye of Twilight", imageName: "ShenIcon", lore: "Shen, el líder del Kinkou, equilibra las fuerzas del mundo espiritual y físico."),
        Character(id: 11, name: "Zac, \n the Secret Weapon", imageName: "ZacIcon", lore: "Zac, un ser de materia química, utiliza su elasticidad para proteger a los demás."),
        Character(id: 12, name: "Dr. Mundo, \n the Madman of Zaun", imageName: "DrMundoIcon", lore: "Dr. Mundo, un loco imparable, causa caos en las calles de Zaun con su fuerza bruta."),
        Character(id: 13, name: "Poppy, \n Keeper of the Hammer", imageName: "PoppyIcon", lore: "Poppy, una heroína determinada, lleva un martillo místico para proteger la justicia en Runaterra."),
        Character(id: 14, name: "Galio, \n the Colossus", imageName: "GalioIcon", lore: "Galio, una gigantesca estatua viviente, se despierta para enfrentarse a la magia amenazante."),
        Character(id: 15, name: "Amumu, \n the Sad Mummy", imageName: "AmumuIcon", lore: "Amumu, una momia maldita, busca compañía mientras vaga por el desierto eterno."),
        Character(id: 16, name: "Alistar, \n the Minotaur", imageName: "AlistarIcon", lore: "Alistar, un guerrero imponente, usa su fuerza para proteger a los inocentes de la tiranía."),
        Character(id: 17, name: "Tahm Kench, \n the River King", imageName: "TahmKenchIcon", lore: "Tahm Kench, un demonio embaucador, ofrece pactos peligrosos a los desesperados."),
        Character(id: 18, name: "Gragas, \n the Rabble Rouser", imageName: "GragasIcon", lore: "Gragas, un amante de la cerveza y el caos, causa estragos en sus aventuras impredecibles."),
    ]
    
    var body: some View {
        NavigationStack {
            List(characters) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    HStack {
                        Image(character.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Spacer()
                                .frame(width: 15)
                        Text(character.name)
                            .font(.headline)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Tanks")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Character: Identifiable {
    let id: Int
    let name: String
    let imageName: String
    let lore: String
}

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        VStack(spacing: 20) {
            Image(character.imageName)
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
            
            Text(character.name)
                .font(.largeTitle)
                .bold()
            
            Text(character.lore)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    TanksView()
}
