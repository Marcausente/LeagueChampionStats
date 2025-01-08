import SwiftUI

struct SupportView: View {
    let supportChampions = [
        SupportChampion(id: 1, name: "Soraka, the Starchild", imageName: "SorakaIcon", lore: "Soraka, una sanadora celestial, dedica su vida a proteger y curar a los necesitados."),
        SupportChampion(id: 2, name: "Janna, the Storm's Fury", imageName: "JannaIcon", lore: "Janna, una protectora mágica de Zaun, invoca los vientos para proteger y apoyar a sus aliados."),
        SupportChampion(id: 3, name: "Nami, the Tidecaller", imageName: "NamiIcon", lore: "Nami, una sirena mística, usa el poder del océano para curar y controlar a sus enemigos."),
        SupportChampion(id: 4, name: "Seraphine, the Starry-Eyed Songstress", imageName: "SeraphineIcon", lore: "Seraphine, una cantante prodigio, utiliza su música para inspirar y apoyar a sus aliados."),
        SupportChampion(id: 5, name: "Karma, the Enlightened One", imageName: "KarmaIcon", lore: "Karma, una sabia iluminada de Ionia, usa su poder para proteger y guiar a su gente."),
        SupportChampion(id: 6, name: "Bard, the Wandering Caretaker", imageName: "BardIcon", lore: "Bard, un espíritu cósmico, guía a los viajeros con su magia y melodías misteriosas."),
        SupportChampion(id: 7, name: "Lulu, the Fae Sorceress", imageName: "LuluIcon", lore: "Lulu, una hechicera mágica, transforma y mejora a sus aliados con sus habilidades caprichosas."),
        SupportChampion(id: 8, name: "Yuumi, the Magical Cat", imageName: "YuumiIcon", lore: "Yuumi, un gato mágico, se une a sus aliados para protegerlos y curarlos con su magia."),
        SupportChampion(id: 9, name: "Renata Glasc, the Chem-Baroness", imageName: "RenataIcon", lore: "Renata Glasc, una empresaria de Zaun, usa su poder químico para manipular y empoderar a sus aliados."),
        SupportChampion(id: 10, name: "Zilean, the Chronokeeper", imageName: "ZileanIcon", lore: "Zilean, un maestro del tiempo, utiliza su poder para revertir el daño y garantizar la supervivencia de sus aliados."),
        SupportChampion(id: 11, name: "Rakan, the Charmer", imageName: "RakanIcon", lore: "Rakan, el galante encantador, utiliza su velocidad y carisma para proteger a sus aliados."),
        SupportChampion(id: 12, name: "Morgana, the Fallen", imageName: "MorganaIcon", lore: "Morgana, una hechicera atormentada, usa magia oscura para proteger y controlar a sus enemigos."),
        SupportChampion(id: 13, name: "Sona, Maven of the Strings", imageName: "SonaIcon", lore: "Sona, una virtuosa de la música, utiliza sus acordes para sanar y fortalecer a su equipo."),
        SupportChampion(id: 14, name: "Pyke, the Bloodharbor Ripper", imageName: "PykeIcon", lore: "Pyke, un asesino que apoya a su equipo, caza a sus enemigos con precisión mortal."),
        SupportChampion(id: 15, name: "Thresh, the Chain Warden", imageName: "ThreshIcon", lore: "Thresh, un espectro torturador, utiliza sus cadenas para atrapar y proteger estratégicamente."),
        SupportChampion(id: 16, name: "Brand, the Burning Vengeance", imageName: "BrandIcon", lore: "Brand, un mago de fuego, inflige daño explosivo mientras apoya desde la retaguardia."),
        SupportChampion(id: 17, name: "Vel'Koz, the Eye of the Void", imageName: "VelkozIcon", lore: "Vel'Koz, una criatura del Vacío, analiza y destruye a sus enemigos desde lejos."),
        SupportChampion(id: 18, name: "Zyra, Rise of the Thorns", imageName: "ZyraIcon", lore: "Zyra, una planta viviente, utiliza espinas y raíces para controlar el campo de batalla."),
        SupportChampion(id: 19, name: "Heimerdinger, the Revered Inventor", imageName: "HeimerdingerIcon", lore: "Heimerdinger, un genio de Piltover, apoya a su equipo con torretas y tecnología avanzada."),
        SupportChampion(id: 20, name: "Fiddlesticks, the Ancient Fear", imageName: "FiddlesticksIcon", lore: "Fiddlesticks, un espantapájaros aterrador, desata su miedo en los enemigos mientras apoya al equipo."),
    ]
    
    var body: some View {
        NavigationStack {
            List(supportChampions) { champion in
                SupportChampionRow(champion: champion)
            }
            .navigationTitle("Supports")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SupportChampionRow: View {
    let champion: SupportChampion
    
    var body: some View {
        NavigationLink(destination: SupportChampionDetailView(champion: champion)) {
            HStack {
                Image(champion.imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Spacer()
                    .frame(width: 15)
                Text(champion.name)
                    .font(.headline)
            }
            .padding(.vertical, 8)
        }
    }
}

struct SupportChampion: Identifiable {
    let id: Int
    let name: String
    let imageName: String
    let lore: String
}

struct SupportChampionDetailView: View {
    let champion: SupportChampion
    
    var body: some View {
        VStack(spacing: 20) {
            Image(champion.imageName)
                .resizable()
                .frame(width: 150, height: 150)
            
            Text(champion.name)
                .font(.largeTitle)
                .bold()
            
            Text(champion.lore)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle(champion.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SupportView()
}
