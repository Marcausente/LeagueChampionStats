import SwiftUI

struct MagesView: View {
    let characters = [
        Character(id: 1, name: "Hwei,\n the Visionary", imageName: "HweiIcon"),
        Character(id: 2, name: "Jayce,\n the Defender of Tomorrow", imageName: "JayceIcon"),
        Character(id: 3, name: "Vel'Koz,\n the Eye of the Void", imageName: "VelkozIcon"),
        Character(id: 4, name: "Xerath, \n the Magus Ascendant", imageName: "XerathIcon"),
        Character(id: 5, name: "Ziggs,\n the Hexposives Expert", imageName: "ZiggsIcon"),
        Character(id: 6, name: "Anivia, \n the Cryophoenix", imageName: "AniviaIcon"),
        Character(id: 7, name: "Aurelion Sol, \n the Star Forger", imageName: "AurelionIcon"),
        Character(id: 8, name: "Cassiopeia, \n the Serpent's Embrace", imageName: "CassioIcon"),
        Character(id: 9, name: "Karthus, \n the Deathsinger", imageName: "KarthusIcon"),
        Character(id: 10, name: "Malzahar, \n the Prophet of Void", imageName: "MalzaIcon"),
        Character(id: 11, name: "Swain, \n the Noxian Grand General", imageName: "SwainIcon"),
        Character(id: 12, name: "Rumble, \n the Mechanized Menace", imageName: "RumbleIcon"),
        Character(id: 13, name: "Ryze, \n the Rune Mage", imageName: "RyzeIcon"),
        Character(id: 14, name: "Taliyah, \n the Stoneweaver", imageName: "TalyIcon"),
        Character(id: 15, name: "Viktor, \n the Arcane Herald", imageName: "ViktorIcon"),
        Character(id: 16, name: "Vladimir, \n the Crimson Reaper", imageName: "VladIcon"),
        Character(id: 17, name: "Ahri, \n the Nine-Tailed Fox", imageName: "AhriIcon"),
        Character(id: 18, name: "Annie, \n the Dark Child", imageName: "AnnieIcon"),
        Character(id: 19, name: "Brand, \n the Burning Vengeance", imageName: "BrandIcon"),
        Character(id: 20, name: "LeBlanc, \n the Deceiver", imageName: "LeeBlancIcon"),
        Character(id: 21, name: "Lissandra, \n the Ice Witch", imageName: "LissIcon"),
        Character(id: 22, name: "Orianna, \n the Lady of Clockwork", imageName: "placeholder_image"),
        Character(id: 23, name: "Syndra, \n the Dark Soverign", imageName: "placeholder_image"),
        Character(id: 24, name: "Twisted Fate, \n the Card Master", imageName: "placeholder_image"),
        Character(id: 25, name: "Veigar, \n the Tiny Master of Evil", imageName: "placeholder_image"),
        Character(id: 26, name: "Vex, \n the Gloomist", imageName: "placeholder_image"),
        Character(id: 27, name: "Zoe, \n the Aspect of Twilight", imageName: "placeholder_image"),
        Character(id: 28, name: "Neeko, \n the Curious Chameleon", imageName: "placeholder_image"),
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
            .navigationTitle("Mages")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Character: Identifiable {
    let id: Int
    let name: String
    let imageName: String
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
            
            Text("Detalles sobre \(character.name) estarán aquí.")
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
    MagesView()
}
