import SwiftUI

struct FightersView: View {
    let fighterChampions = [
        FighterChampion(id: 1, name: "Aatrox,\n the Darkin Blade", imageName: "AatroxIcon", lore: "Aatrox, una antigua arma viviente, es un guerrero Darkin que lucha por recuperar su gloria perdida y liberar su furia en Runaterra."),
        FighterChampion(id: 2, name: "Camille,\n the Steel Shadow", imageName: "CamilleIcon", lore: "Camille es una espía élite de Piltover, perfeccionada tanto en mente como en cuerpo para cumplir con su deber."),
        FighterChampion(id: 3, name: "Darius,\n the Hand of Noxus", imageName: "DariusIcon", lore: "Darius, el líder más temido y experimentado de Noxus, es la personificación de la fuerza bruta y la disciplina militar."),
        FighterChampion(id: 4, name: "Fiora,\n the Grand Duelist", imageName: "FioraIcon", lore: "Fiora es la duelista más temida de Valoran, conocida tanto por su destreza como por su estilo inigualable."),
        FighterChampion(id: 5, name: "Gangplank,\n the Saltwater Scourge", imageName: "GangplankIcon", lore: "Gangplank, un despiadado pirata de Aguas Estancadas, reina sobre los mares con terror y caos."),
        FighterChampion(id: 6, name: "Garen,\n the Might of Demacia", imageName: "GarenIcon", lore: "Garen, un noble guerrero de Demacia, lucha con coraje y honor para proteger a su reino."),
        FighterChampion(id: 7, name: "Gwen,\n the Hallowed Seamstress", imageName: "GwenIcon", lore: "Gwen, una muñeca traída a la vida, empuña tijeras mágicas y magia sagrada para proteger lo que ama."),
        FighterChampion(id: 8, name: "Hecarim,\n the Shadow of War", imageName: "HecarimIcon", lore: "Hecarim, un caballero espectral, lidera una legión de muertos en un galope eterno."),
        FighterChampion(id: 9, name: "Illaoi,\n the Kraken Priestess", imageName: "IllaoiIcon", lore: "Illaoi, la sacerdotisa del Gran Kraken, desafía a todos a demostrar su valía ante su deidad."),
        FighterChampion(id: 10, name: "Irelia,\n the Blade Dancer", imageName: "IreliaIcon", lore: "Irelia, una maestra en la danza de las cuchillas, lucha por liberar a Jonia de sus opresores."),
        FighterChampion(id: 11, name: "Jax,\n Grandmaster at Arms", imageName: "JaxIcon", lore: "Jax, el último guardián de Icathia, lucha con una simple lámpara para proteger su tierra de cualquier amenaza."),
        FighterChampion(id: 12, name: "Jarvan IV,\n the Exemplar of Demacia", imageName: "JarvanIcon", lore: "Jarvan IV, príncipe heredero de Demacia, lidera a su gente con valentía y honor."),
        FighterChampion(id: 13, name: "Kled,\n the Cantankerous Cavalier", imageName: "KledIcon", lore: "Kled, un yordle guerrero, es el campeón más temido en las líneas frontales de Noxus."),
        FighterChampion(id: 14, name: "Lee Sin,\n the Blind Monk", imageName: "LeeSinIcon", lore: "Lee Sin, un maestro de las artes marciales jonianas, lucha con precisión mortal y disciplina espiritual."),
        FighterChampion(id: 15, name: "Mordekaiser,\n the Iron Revenant", imageName: "MordekaiserIcon", lore: "Mordekaiser, un señor oscuro inmortal, busca dominar tanto el mundo físico como el espiritual."),
        FighterChampion(id: 16, name: "Nasus,\n the Curator of the Sands", imageName: "NasusIcon", lore: "Nasus, un semidiós de Shurima, es un estratega inmortal que protege la sabiduría ancestral."),
        FighterChampion(id: 17, name: "Olaf,\n the Berserker", imageName: "OlafIcon", lore: "Olaf, un berserker temido de Freljord, busca la gloria eterna enfrentando cualquier batalla mortal."),
        FighterChampion(id: 18, name: "Pantheon,\n the Unbreakable Spear", imageName: "PantheonIcon", lore: "Pantheon, una vez mortal, ahora empuña el poder celestial para proteger a los débiles."),
        FighterChampion(id: 19, name: "Rek'Sai,\n the Void Burrower", imageName: "RekSaiIcon", lore: "Rek'Sai, una depredadora del Vacío, aterroriza las tierras de Shurima con su voraz apetito."),
        FighterChampion(id: 20, name: "Renekton,\n the Butcher of the Sands", imageName: "RenektonIcon", lore: "Renekton, un coloso enfurecido de Shurima, busca venganza por su trágico destino."),
        FighterChampion(id: 21, name: "Riven,\n the Exile", imageName: "RivenIcon", lore: "Riven, una exsoldado de Noxus, lucha por redimirse y encontrar su propósito."),
        FighterChampion(id: 22, name: "Sett,\n the Boss", imageName: "SettIcon", lore: "Sett, un jefe de los bajos fondos de Jonia, pelea con ferocidad para proteger su territorio."),
        FighterChampion(id: 23, name: "Shyvana,\n the Half-Dragon", imageName: "ShyvanaIcon", lore: "Shyvana, una guerrera mitad dragón, lucha para proteger Demacia con su ardiente poder."),
        FighterChampion(id: 24, name: "Sylas,\n the Unshackled", imageName: "SylasIcon", lore: "Sylas, un revolucionario de Demacia, utiliza la magia robada para desafiar el sistema."),
        FighterChampion(id: 25, name: "Trundle,\n the Troll King", imageName: "TrundleIcon", lore: "Trundle, un rey troll de Freljord, empuña un enorme garrote de hielo eterno."),
        FighterChampion(id: 26, name: "Tryndamere,\n the Barbarian King", imageName: "TryndamereIcon", lore: "Tryndamere, un feroz bárbaro, busca venganza por la destrucción de su tribu."),
        FighterChampion(id: 27, name: "Udyr,\n the Spirit Walker", imageName: "UdyrIcon", lore: "Udyr, un chamán de Freljord, canaliza el poder de los espíritus animales."),
        FighterChampion(id: 28, name: "Urgot,\n the Dreadnought", imageName: "UrgotIcon", lore: "Urgot, un verdugo cibernético, busca eliminar la corrupción con su brutal justicia."),
        FighterChampion(id: 29, name: "Vi,\n the Piltover Enforcer", imageName: "ViIcon", lore: "Vi, una antigua criminal de Piltover, ahora usa sus poderosos guanteletes para mantener el orden."),
        FighterChampion(id: 30, name: "Wukong,\n the Monkey King", imageName: "WukongIcon", lore: "Wukong, un maestro simio, lucha con astucia y su bastón encantado."),
        FighterChampion(id: 31, name: "Xin Zhao,\n the Seneschal of Demacia", imageName: "XinZhaoIcon", lore: "Xin Zhao, un guerrero leal de Demacia, empuña su lanza para proteger el reino."),
        FighterChampion(id: 32, name: "Yasuo,\n the Unforgiven", imageName: "YasuoIcon", lore: "Yasuo, un espadachín solitario, busca redimirse por un crimen que no cometió."),
        FighterChampion(id: 33, name: "Yone,\n the Unforgotten", imageName: "YoneIcon", lore: "Yone, el hermano perdido de Yasuo, ahora camina entre los vivos y los muertos."),
        FighterChampion(id: 34, name: "Yorick,\n Shepherd of Souls", imageName: "YorickIcon", lore: "Yorick, un guardián de las Islas de la Sombra, controla las almas para cumplir con su deber."),
        FighterChampion(id: 35, name: "Warwick,\n the Uncaged Wrath of Zaun", imageName: "WarwickIcon", lore: "Warwick, una bestia creada en Zaun, caza sin piedad con un olfato insaciable."),
        FighterChampion(id: 36, name: "Volibear,\n the Relentless Storm", imageName: "VolibearIcon", lore: "Volibear, un semidiós de Freljord, encarna la furia indomable de la tormenta."),
        FighterChampion(id: 37, name: "Briar,\n the Restrained Hunger", imageName: "BriarIcon", lore: "Briar, una criatura de Zaun, lucha contra su hambre insaciable mientras busca controlarse."),
        FighterChampion(id: 38, name: "Skarner,\n the Crystal Vanguard", imageName: "SkarnerIcon", lore: "Skarner, un guerrero cristalino de Shurima, protege su hogar y su pueblo de las amenazas con su fuerza imparable.")
    ]
    
    var body: some View {
        NavigationStack {
            List(fighterChampions) { champion in
                FighterChampionRow(champion: champion)
            }
            .navigationTitle("Fighters")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct FighterChampionRow: View {
    let champion: FighterChampion
    
    var body: some View {
        NavigationLink(destination: FighterChampionDetailView(champion: champion)) {
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

struct FighterChampion: Identifiable {
    let id: Int
    let name: String
    let imageName: String
    let lore: String
}

struct FighterChampionDetailView: View {
    let champion: FighterChampion
    
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
    FightersView()
}
