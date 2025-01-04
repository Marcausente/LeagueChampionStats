import SwiftUI

struct FightersView: View {
    let fighterChampions = [
        FighterChampion(id: 1, name: "Aatrox,\n the Darkin Blade", imageName: "AatroxIcon"),
        FighterChampion(id: 2, name: "Camille,\n the Steel Shadow", imageName: "CamilleIcon"),
        FighterChampion(id: 3, name: "Darius,\n the Hand of Noxus", imageName: "DariusIcon"),
        FighterChampion(id: 4, name: "Fiora,\n the Grand Duelist", imageName: "FioraIcon"),
        FighterChampion(id: 5, name: "Gangplank,\n the Saltwater Scourge", imageName: "GangplankIcon"),
        FighterChampion(id: 6, name: "Garen,\n the Might of Demacia", imageName: "GarenIcon"),
        FighterChampion(id: 7, name: "Gwen,\n the Hallowed Seamstress", imageName: "GwenIcon"),
        FighterChampion(id: 8, name: "Hecarim,\n the Shadow of War", imageName: "HecarimIcon"),
        FighterChampion(id: 9, name: "Illaoi,\n the Kraken Priestess", imageName: "IllaoiIcon"),
        FighterChampion(id: 10, name: "Irelia,\n the Blade Dancer", imageName: "IreliaIcon"),
        FighterChampion(id: 11, name: "Jax,\n Grandmaster at Arms", imageName: "JaxIcon"),
        FighterChampion(id: 12, name: "Jarvan IV,\n the Exemplar of Demacia", imageName: "JarvanIcon"),
        FighterChampion(id: 13, name: "Kled,\n the Cantankerous Cavalier", imageName: "KledIcon"),
        FighterChampion(id: 14, name: "Lee Sin,\n the Blind Monk", imageName: "LeeSinIcon"),
        FighterChampion(id: 15, name: "Mordekaiser,\n the Iron Revenant", imageName: "MordekaiserIcon"),
        FighterChampion(id: 16, name: "Nasus,\n the Curator of the Sands", imageName: "NasusIcon"),
        FighterChampion(id: 17, name: "Olaf,\n the Berserker", imageName: "OlafIcon"),
        FighterChampion(id: 18, name: "Pantheon,\n the Unbreakable Spear", imageName: "PantheonIcon"),
        FighterChampion(id: 19, name: "Rek'Sai,\n the Void Burrower", imageName: "RekSaiIcon"),
        FighterChampion(id: 20, name: "Renekton,\n the Butcher of the Sands", imageName: "RenektonIcon"),
        FighterChampion(id: 21, name: "Riven,\n the Exile", imageName: "RivenIcon"),
        FighterChampion(id: 22, name: "Sett,\n the Boss", imageName: "SettIcon"),
        FighterChampion(id: 23, name: "Shyvana,\n the Half-Dragon", imageName: "ShyvanaIcon"),
        FighterChampion(id: 24, name: "Sylas,\n the Unshackled", imageName: "SylasIcon"),
        FighterChampion(id: 25, name: "Trundle,\n the Troll King", imageName: "TrundleIcon"),
        FighterChampion(id: 26, name: "Tryndamere,\n the Barbarian King", imageName: "TryndamereIcon"),
        FighterChampion(id: 27, name: "Udyr,\n the Spirit Walker", imageName: "UdyrIcon"),
        FighterChampion(id: 28, name: "Urgot,\n the Dreadnought", imageName: "UrgotIcon"),
        FighterChampion(id: 29, name: "Vi,\n the Piltover Enforcer", imageName: "ViIcon"),
        FighterChampion(id: 30, name: "Wukong,\n the Monkey King", imageName: "WukongIcon"),
        FighterChampion(id: 31, name: "Xin Zhao,\n the Seneschal of Demacia", imageName: "XinZhaoIcon"),
        FighterChampion(id: 32, name: "Yasuo,\n the Unforgiven", imageName: "YasuoIcon"),
        FighterChampion(id: 33, name: "Yone,\n the Unforgotten", imageName: "YoneIcon"),
        FighterChampion(id: 34, name: "Yorick,\n Shepherd of Souls", imageName: "YorickIcon"),
        FighterChampion(id: 35, name: "Warwick,\n the Uncaged Wrath of Zaun", imageName: "WarwickIcon"),
        FighterChampion(id: 36, name: "Volibear,\n the Relentless Storm", imageName: "VolibearIcon")
    ]
    
    var body: some View {
        NavigationStack {
            List(fighterChampions) { champion in
                FighterChampionRow(champion: champion)
            }
            .navigationTitle("Fighters")
            .navigationBarTitleDisplayMode(.inline)
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
            
            Text("Detalles sobre \(champion.name) estarán aquí.")
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
