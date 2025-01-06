import SwiftUI

struct MagesView: View {
    let characters = [
        Character(id: 1, name: "Hwei,\n the Visionary", imageName: "HweiIcon", lore: "Hwei, un estratega visionario, utiliza su astucia para liderar a su equipo hacia la victoria."),
        Character(id: 2, name: "Jayce,\n the Defender of Tomorrow", imageName: "JayceIcon", lore: "Jayce, un inventor brillante de Piltover, lucha con su martillo hextech para proteger su hogar."),
        Character(id: 3, name: "Vel'Koz,\n the Eye of the Void", imageName: "VelkozIcon", lore: "Vel'Koz, una criatura del Vacío, busca conocimiento destruyendo todo a su paso."),
        Character(id: 4, name: "Xerath, \n the Magus Ascendant", imageName: "XerathIcon", lore: "Xerath, un mago Shurimano consumido por la magia, busca un poder ilimitado."),
        Character(id: 5, name: "Ziggs,\n the Hexplosives Expert", imageName: "ZiggsIcon", lore: "Ziggs, un yordle amante de las explosiones, trae caos y diversión con su arsenal hexplosivo."),
        Character(id: 6, name: "Anivia, \n the Cryophoenix", imageName: "AniviaIcon", lore: "Anivia, una antigua guardiana de Freljord, protege su tierra con el poder del hielo eterno."),
        Character(id: 7, name: "Aurelion Sol, \n the Star Forger", imageName: "AurelionIcon", lore: "Aurelion Sol, un dragón celestial, crea estrellas mientras busca recuperar su libertad."),
        Character(id: 8, name: "Cassiopeia, \n the Serpent's Embrace", imageName: "CassioIcon", lore: "Cassiopeia, una hechicera maldita de Noxus, utiliza venenos mortales para dominar a sus enemigos."),
        Character(id: 9, name: "Karthus, \n the Deathsinger", imageName: "KarthusIcon", lore: "Karthus, el heraldo de la muerte, celebra la eternidad con una sinfonía de almas."),
        Character(id: 10, name: "Malzahar, \n the Prophet of Void", imageName: "MalzaIcon", lore: "Malzahar, un vidente de Shurima, busca abrir un portal para que el Vacío consuma el mundo."),
        Character(id: 11, name: "Swain, \n the Noxian Grand General", imageName: "SwainIcon", lore: "Swain, el líder de Noxus, manipula las almas y el destino de su nación con una visión implacable."),
        Character(id: 12, name: "Rumble, \n the Mechanized Menace", imageName: "RumbleIcon", lore: "Rumble, un yordle inventor, lucha con un mecha que él mismo creó, desatando caos en sus enemigos con llamas y rayos."),
        Character(id: 13, name: "Ryze, \n the Rune Mage", imageName: "RyzeIcon", lore: "Ryze, un anciano hechicero azul, viaja por el mundo recolectando runas para protegerlo de su poder devastador."),
        Character(id: 14, name: "Taliyah, \n the Stoneweaver", imageName: "TalyIcon", lore: "Taliyah, una joven de Shurima con un talento único, teje la tierra con su magia para proteger a los suyos."),
        Character(id: 15, name: "Viktor, \n the Arcane Herald", imageName: "ViktorIcon", lore: "Viktor, un idealista de Zaun, cree en un futuro glorioso donde la humanidad se perfeccione a través de la tecnología."),
        Character(id: 16, name: "Vladimir, \n the Crimson Reaper", imageName: "VladIcon", lore: "Vladimir, un maestro de la magia hemomántica, manipula la sangre de sus enemigos para prolongar su vida eterna."),
        Character(id: 17, name: "Ahri, \n the Nine-Tailed Fox", imageName: "AhriIcon", lore: "Ahri, una vastaya encantadora, utiliza su magia para absorber la esencia vital de sus enemigos."),
        Character(id: 18, name: "Annie, \n the Dark Child", imageName: "AnnieIcon", lore: "Annie, una niña prodigio con poderes pirocinéticos, controla un oso de fuego llamado Tibbers."),
        Character(id: 19, name: "Brand, \n the Burning Vengeance", imageName: "BrandIcon", lore: "Brand, un espíritu vengativo, desata su ira en un fuego implacable que consume todo a su paso."),
        Character(id: 20, name: "LeBlanc, \n the Deceiver", imageName: "LeeBlancIcon", lore: "LeBlanc, una manipuladora maestra de la magia ilusoria, mueve los hilos de Noxus desde las sombras."),
        Character(id: 21, name: "Lissandra, \n the Ice Witch", imageName: "LissIcon", lore: "Lissandra, una bruja helada, controla un poder oscuro y gélido que amenaza con congelar el mundo."),
        Character(id: 22, name: "Orianna, \n the Lady of Clockwork", imageName: "OriannaIcon", lore: "Orianna, una autómata de Piltover, lucha junto a su esfera mágica en perfecta sincronía."),
        Character(id: 23, name: "Syndra, \n the Dark Soverign", imageName: "SyndraIcon", lore: "Syndra, una maestra de la magia, domina orbes oscuros para demostrar su superioridad."),
        Character(id: 24, name: "Twisted Fate, \n the Card Master", imageName: "TwistedIcon", lore: "Twisted Fate, un hechicero de cartas, apuesta su destino mientras engaña a sus enemigos con sus trucos."),
        Character(id: 25, name: "Veigar, \n the Tiny Master of Evil", imageName: "VeigarIcon", lore: "Veigar, un yordle obsesionado con la magia oscura, aspira a ser el villano más poderoso de Runaterra."),
        Character(id: 26, name: "Vex, \n the Gloomist", imageName: "VexIcon", lore: "Vex, una joven yordle sombría, canaliza su apatía y melancolía para enfrentar a aquellos que la irritan."),
        Character(id: 27, name: "Zoe, \n the Aspect of Twilight", imageName: "ZoeIcon", lore: "Zoe, una traviesa mensajera cósmica, altera el curso de la realidad con su curiosidad despreocupada."),
        Character(id: 28, name: "Neeko, \n the Curious Chameleon", imageName: "NeekoIcon", lore: "Neeko, una vastaya camaleónica, se mezcla con otros para observar y comprender el mundo con inocente curiosidad."),
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
    MagesView()
}
