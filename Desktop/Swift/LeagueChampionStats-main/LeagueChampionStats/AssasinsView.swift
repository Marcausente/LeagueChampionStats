import SwiftUI

struct AssassinView: View {
    let assassinChampions = [
        AssassinChampion(id: 1, name: "Zed, the Master of Shadows", imageName: "ZedIcon", lore: "Zed, un ninja sombrío, utiliza las sombras para atacar con rapidez y precisión letal."),
        AssassinChampion(id: 2, name: "Akali, the Rogue Assassin", imageName: "AkaliIcon", lore: "Akali, una asesina rebelde, se desliza entre las sombras para eliminar a sus enemigos."),
        AssassinChampion(id: 3, name: "Kha'Zix, the Voidreaver", imageName: "KhaZixIcon", lore: "Kha'Zix, una criatura del Vacío, caza y evoluciona con cada enemigo que derrota."),
        AssassinChampion(id: 4, name: "Talon, the Blade's Shadow", imageName: "TalonIcon", lore: "Talon, un asesino implacable de Noxus, utiliza cuchillas mortales para acabar con sus objetivos."),
        AssassinChampion(id: 5, name: "Katarina, the Sinister Blade", imageName: "KatarinaIcon", lore: "Katarina, una asesina noxiana, utiliza su velocidad y dagas para causar estragos en la batalla."),
        AssassinChampion(id: 6, name: "Evelynn, Agony's Embrace", imageName: "EvelynnIcon", lore: "Evelynn, una súcubo letal, atrae a sus víctimas antes de acabar con ellas brutalmente."),
        AssassinChampion(id: 7, name: "Rengar, the Pridestalker", imageName: "RengarIcon", lore: "Rengar, un cazador feroz, acecha a sus presas antes de lanzarse con un ataque devastador."),
        AssassinChampion(id: 8, name: "Shaco, the Demon Jester", imageName: "ShacoIcon", lore: "Shaco, un bufón diabólico, engaña y asesina con una sonrisa siniestra."),
        AssassinChampion(id: 9, name: "Fizz, the Tidal Trickster", imageName: "FizzIcon", lore: "Fizz, un astuto habitante del océano, utiliza su agilidad para emboscar a sus enemigos."),
        AssassinChampion(id: 10, name: "Ekko, the Boy Who Shattered Time", imageName: "EkkoIcon", lore: "Ekko, un prodigio de Zaun, manipula el tiempo para esquivar ataques y lanzar contragolpes letales."),
        AssassinChampion(id: 11, name: "Nocturne, the Eternal Nightmare", imageName: "NocturneIcon", lore: "Nocturne, una pesadilla viviente, se lanza a la oscuridad para atacar a sus enemigos."),
        AssassinChampion(id: 12, name: "Qiyana, Empress of the Elements", imageName: "QiyanaIcon", lore: "Qiyana, una guerrera arrogante, utiliza el poder de los elementos para derrotar a sus oponentes."),
        AssassinChampion(id: 13, name: "Viego, the Ruined King", imageName: "ViegoIcon", lore: "Viego, un rey caído, busca recuperar a su amor perdido a través de la destrucción."),
        AssassinChampion(id: 14, name: "Lee Sin, the Blind Monk", imageName: "LeeSinIcon", lore: "Lee Sin, un maestro de las artes marciales, utiliza su fuerza y velocidad para atacar de manera devastadora."),
        AssassinChampion(id: 15, name: "Diana, Scorn of the Moon", imageName: "DianaIcon", lore: "Diana, una guerrera de Lunari, utiliza su poder lunar para acabar con sus enemigos."),
     
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(assassinChampions) { champion in
                        AssassinChampionRow(champion: champion)
                            .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Assassins")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AssassinChampionRow: View {
    let champion: AssassinChampion
    
    var body: some View {
        NavigationLink(destination: AssassinChampionDetailView(champion: champion)) {
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

struct AssassinChampion: Identifiable {
    let id: Int
    let name: String
    let imageName: String
    let lore: String
}

struct AssassinChampionDetailView: View {
    let champion: AssassinChampion
    
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
    AssassinView()
}
