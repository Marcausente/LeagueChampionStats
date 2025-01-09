//
//  TanksView.swift
//  LeagueChampionStats
//
//  Created by Marc Fernández on 3/1/25.
//

import SwiftUI

struct TanksView: View {
    let TankChampions = [
        TankCharacter(id: 1, name: "Malphite,\n the Shard of the Monolith", imageName: "MalphiteIcon", lore: "Malphite, un fragmento vivo del Monolito, lucha por mantener el orden en un mundo caótico."),
        TankCharacter(id: 2, name: "Maokai,\n the Twisted Treant", imageName: "MaokaiIcon", lore: "Maokai, un espíritu vengativo de la naturaleza, busca restaurar la vida en las Islas de la Sombra."),
        TankCharacter(id: 3, name: "Nautilus,\n the Titan of the Depths", imageName: "NautilusIcon", lore: "Nautilus, un coloso de las profundidades, protege el océano y castiga a los que lo traicionan."),
        TankCharacter(id: 4, name: "Rammus, \n the Armordillo", imageName: "RammusIcon", lore: "Rammus, una criatura enigmática, avanza imparable con su caparazón blindado."),
        TankCharacter(id: 5, name: "Sion,\n the Undead Juggernaut", imageName: "SionIcon", lore: "Sion, un guerrero noxiano resucitado, destruye todo a su paso con una furia incontrolable."),
        TankCharacter(id: 6, name: "Cho'Gath, \n the Terror of the Void", imageName: "ChogathIcon", lore: "Cho'Gath, una abominación del Vacío, crece devorando todo lo que encuentra."),
        TankCharacter(id: 7, name: "Ornn, \n the Fire Below the Mountain", imageName: "OrnnIcon", lore: "Ornn, un semidiós Freljordiano, forja armas legendarias y protege a los suyos."),
        TankCharacter(id: 8, name: "Sejuani, \n Fury of the North", imageName: "SejuaniIcon", lore: "Sejuani, una líder feroz de Freljord, lucha incansablemente por la supervivencia de su tribu."),
        TankCharacter(id: 9, name: "Leona, \n the Radiant Dawn", imageName: "LeonaIcon", lore: "Leona, una guerrera de los Solari, blande el poder del sol para proteger a los inocentes."),
        TankCharacter(id: 10, name: "Shen, \n the Eye of Twilight", imageName: "ShenIcon", lore: "Shen, el líder del Kinkou, equilibra las fuerzas del mundo espiritual y físico."),
        TankCharacter(id: 11, name: "Zac, \n the Secret Weapon", imageName: "ZacIcon", lore: "Zac, un ser de materia química, utiliza su elasticidad para proteger a los demás."),
        TankCharacter(id: 12, name: "Dr. Mundo, \n the Madman of Zaun", imageName: "DrMundoIcon", lore: "Dr. Mundo, un loco imparable, causa caos en las calles de Zaun con su fuerza bruta."),
        TankCharacter(id: 13, name: "Poppy, \n Keeper of the Hammer", imageName: "PoppyIcon", lore: "Poppy, una heroína determinada, lleva un martillo místico para proteger la justicia en Runaterra."),
        TankCharacter(id: 14, name: "Galio, \n the Colossus", imageName: "GalioIcon", lore: "Galio, una gigantesca estatua viviente, se despierta para enfrentarse a la magia amenazante."),
        TankCharacter(id: 15, name: "Amumu, \n the Sad Mummy", imageName: "AmmumuIcon", lore: "Amumu, una momia maldita, busca compañía mientras vaga por el desierto eterno."),
        TankCharacter(id: 16, name: "Alistar, \n the Minotaur", imageName: "AlistarIcon", lore: "Alistar, un guerrero imponente, usa su fuerza para proteger a los inocentes de la tiranía."),
        TankCharacter(id: 17, name: "Tahm Kench, \n the River King", imageName: "TahmIcon", lore: "Tahm Kench, un demonio embaucador, ofrece pactos peligrosos a los desesperados."),
        TankCharacter(id: 18, name: "Gragas, \n the Rabble Rouser", imageName: "GragasIcon", lore: "Gragas, un amante de la cerveza y el caos, causa estragos en sus aventuras impredecibles."),
    ]
    
    var body: some View {
        NavigationStack {
            List(TankChampions) { tankcharacter in
                NavigationLink(destination: TankCharacterDetailView(tankcharacter: tankcharacter)) {
                    HStack {
                        Image(tankcharacter.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Spacer()
                                .frame(width: 15)
                        Text(tankcharacter.name)
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

struct TankCharacter: Identifiable {
    let id: Int
    let name: String
    let imageName: String
    let lore: String
}

struct TankCharacterDetailView: View {
    let tankcharacter: TankCharacter
    
    var body: some View {
        VStack(spacing: 20) {
            Image(tankcharacter.imageName)
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
            
            Text(tankcharacter.name)
                .font(.largeTitle)
                .bold()
            
            Text(tankcharacter.lore)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle(tankcharacter.name)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    TanksView()
}
