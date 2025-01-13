//
//  SupportView.swift
//  LeagueChampionStats
//
//  Created by Marc Fernández on 3/1/25.
//

import SwiftUI

struct SupportView: View {
    let supportChampions = [
        SupportCharacter(id: 1, name: "Janna, \n the Storm's Fury", imageName: "JannaIcon", lore: "Janna, un espíritu protector del viento, trae esperanza y ayuda a los necesitados."),
        SupportCharacter(id: 2, name: "Soraka, \n the Starchild", imageName: "SorakaIcon", lore: "Soraka, una entidad celestial, cura y protege a sus aliados con poder divino."),
        SupportCharacter(id: 3, name: "Lulu, \n the Fae Sorceress", imageName: "LuluIcon", lore: "Lulu, una hechicera yordle, distorsiona la realidad para proteger a sus amigos."),
        SupportCharacter(id: 4, name: "Yuumi, \n the Magical Cat", imageName: "YuumiIcon", lore: "Yuumi, una gata mágica, viaja junto a su libro para ayudar a sus aliados."),
        SupportCharacter(id: 5, name: "Nami, \n the Tidecaller", imageName: "NamiIcon", lore: "Nami, una valiente vastaya, usa la magia del agua para defender a su pueblo."),
        SupportCharacter(id: 6, name: "Thresh, \n the Chain Warden", imageName: "ThreshIcon", lore: "Thresh, un carcelero fantasmagórico, atrapa a las almas de sus víctimas."),
        SupportCharacter(id: 7, name: "Morgana, \n the Fallen", imageName: "MorganaIcon", lore: "Morgana, una figura trágica, lucha entre su humanidad y su oscuridad."),
        SupportCharacter(id: 8, name: "Braum, \n the Heart of the Freljord", imageName: "BraumIcon", lore: "Braum, un héroe amable, usa su escudo indestructible para proteger a los inocentes."),
        SupportCharacter(id: 9, name: "Taric, \n the Shield of Valoran", imageName: "TaricIcon", lore: "Taric, un protector cósmico, usa el poder de las estrellas para salvaguardar la vida."),
        SupportCharacter(id: 10, name: "Karma, \n the Enlightened One", imageName: "KarmaIcon", lore: "Karma, una líder espiritual, canaliza el poder de su alma ancestral para traer equilibrio."),
        SupportCharacter(id: 11, name: "Senna, \n the Redeemer", imageName: "SennaIcon", lore: "Senna, una guerrera maldita, usa las sombras para proteger a los vivos."),
        SupportCharacter(id: 12, name: "Seraphine, \n the Starry-Eyed Songstress", imageName: "SeraphineIcon", lore: "Seraphine, una cantante inspiradora, utiliza la magia del sonido para unir y sanar."),
        SupportCharacter(id: 13, name: "Rakan, \n the Charmer", imageName: "RakanIcon", lore: "Rakan, un bailarín vastaya, combina encanto y habilidad para proteger a los que ama."),
        SupportCharacter(id: 14, name: "Pyke, \n the Bloodharbor Ripper", imageName: "PykeIcon", lore: "Pyke, un espíritu vengativo, cumple su misión como soporte letal en la Grieta."),
        SupportCharacter(id: 15, name: "Zilean, \n the Chronokeeper", imageName: "ZileanIcon", lore: "Zilean, un maestro del tiempo, manipula el destino para cambiar el curso de las batallas."),
        SupportCharacter(id: 16, name: "Blitzcrank, \n the Great Steam Golem", imageName: "BlitzcrankIcon", lore: "Blitzcrank, un golem de vapor, usa su fuerza para proteger y ayudar."),
        SupportCharacter(id: 17, name: "Renata Glasc, \n the Chem-Baroness", imageName: "RenataglascIcon", lore: "Renata, una baronesa química, controla la batalla con su intelecto y manipulación.")
    ]
    
    var body: some View {
        NavigationStack {
            List(supportChampions) { supportCharacter in
                NavigationLink(destination: SupportDetailView(supportCharacter: supportCharacter)) {
                    HStack {
                        Image(supportCharacter.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Spacer()
                            .frame(width: 15)
                        Text(supportCharacter.name)
                            .font(.headline)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Supports")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct SupportCharacter: Identifiable {
    let id: Int
    let name: String
    let imageName: String
    let lore: String
}

struct SupportDetailView: View {
    let supportCharacter: SupportCharacter
    
    var body: some View {
        VStack(spacing: 20) {
            Image(supportCharacter.imageName)
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
            
            Text(supportCharacter.name)
                .font(.largeTitle)
                .bold()
            
            Text(supportCharacter.lore)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle(supportCharacter.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SupportView()
}
