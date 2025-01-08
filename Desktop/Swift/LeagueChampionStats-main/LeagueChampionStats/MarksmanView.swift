import SwiftUI

struct MarksmanView: View {
    let marksmanChampions = [
        MarksmanChampion(id: 1, name: "Jhin, the Virtuoso", imageName: "JhinIcon", lore: "Jhin, un asesino y artista macabro, usa su pistola para crear obras de muerte."),
        MarksmanChampion(id: 2, name: "Kai'Sa, Daughter of the Void", imageName: "KaiSaIcon", lore: "Kai'Sa, una niña criada por el Vacío, lucha por sobrevivir y proteger a los suyos."),
        MarksmanChampion(id: 3, name: "Miss Fortune, the Bounty Hunter", imageName: "MissFortuneIcon", lore: "Miss Fortune, una cazadora de recompensas, usa su pistola para buscar venganza."),
        MarksmanChampion(id: 4, name: "Ashe, the Frost Archer", imageName: "AsheIcon", lore: "Ashe, la reina de Freljord, empuña su arco de hielo con gran destreza para guiar a su gente."),
        MarksmanChampion(id: 5, name: "Ezreal, the Prodigal Explorer", imageName: "EzrealIcon", lore: "Ezreal, un explorador prodigioso, utiliza su guantelete arcano para disparar proyectiles mágicos."),
        MarksmanChampion(id: 6, name: "Sivir, the Battle Mistress", imageName: "SivirIcon", lore: "Sivir, la maestra de la guerra, lanza su boomerang letal para arrasar con sus enemigos."),
        MarksmanChampion(id: 7, name: "Caitlyn, the Sheriff of Piltover", imageName: "CaitlynIcon", lore: "Caitlyn, la sheriff de Piltover, usa su rifle de precisión para eliminar cualquier amenaza."),
        MarksmanChampion(id: 8, name: "Tristana, the Yordle Gunner", imageName: "TristanaIcon", lore: "Tristana, una yordle explosiva, dispara con su pistola mientras lanza bombas de alto poder."),
        MarksmanChampion(id: 9, name: "Jinx, the Loose Cannon", imageName: "JinxIcon", lore: "Jinx, la caótica y descontrolada criminal, disfruta desatar el caos con su arsenal de armas explosivas."),
        MarksmanChampion(id: 10, name: "Lucian, the Purifier", imageName: "LucianIcon", lore: "Lucian, un cazador de almas, usa dos pistolas para vengar a su esposa y destruir las fuerzas oscuras."),
        MarksmanChampion(id: 11, name: "Zeri, the Spark of Zaun", imageName: "ZeriIcon", lore: "Zeri, una joven electrificada por el poder de Zaun, se mueve con rapidez y usa su electricidad para atacar."),
        MarksmanChampion(id: 12, name: "Samira, the Desert Rose", imageName: "SamiraIcon", lore: "Samira, una combatiente de gran habilidad y valentía, disfruta arrasar con sus enemigos en un estilo elegante y mortífero."),
        MarksmanChampion(id: 13, name: "Vayne, the Night Hunter", imageName: "VayneIcon", lore: "Vayne, una cazadora nocturna, lucha con su ballesta de doble cañón para erradicar la oscuridad y la corrupción."),
        MarksmanChampion(id: 14, name: "Kog'Maw, the Mouth of the Void", imageName: "KogMawIcon", lore: "Kog'Maw, una criatura grotesca del Vacío, escupe ácido mortal desde su boca mientras se mueve rápidamente."),
        MarksmanChampion(id: 15, name: "Draven, the Glorious Executioner", imageName: "DravenIcon", lore: "Draven, el campeón de Noxus, lanza sus hachas con destreza para destruir a sus oponentes con estilo."),
        MarksmanChampion(id: 16, name: "Aphelios, the Weapon of the Faithful", imageName: "ApheliosIcon", lore: "Aphelios, un guerrero de los Lunaris, maneja un arsenal de armas mágicas para enfrentar a sus enemigos."),
        MarksmanChampion(id: 17, name: "Kennen, the Heart of the Tempest", imageName: "KennenIcon", lore: "Kennen, el pequeño ninja eléctrico de Ionia, usa sus shurikens para lanzar rayos y controlar la tormenta."),
        MarksmanChampion(id: 18, name: "Seraphine, the Starry-Eyed Songstress", imageName: "SeraphineIcon", lore: "Seraphine, la cantante prodigio de Piltover, usa su música para sanar y mejorar a sus aliados."),
        MarksmanChampion(id: 19, name: "Varus, the Arrow of Retribution", imageName: "VarusIcon", lore: "Varus, un arquero consumido por la venganza, dispara flechas letales con un poder sobrenatural."),
        MarksmanChampion(id: 20, name: "Viktor, the Machine Herald", imageName: "ViktorIcon", lore: "Viktor, un genio de Zaun, busca transformar el mundo a través de la tecnología y la perfección cibernética."),
        // Añadir más campeones marksman según sea necesario...
    ]
    
    var body: some View {
        NavigationStack {
            List(marksmanChampions) { champion in
                MarksmanChampionRow(champion: champion)
            }
            .navigationTitle("Marksmen")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MarksmanChampionRow: View {
    let champion: MarksmanChampion
    
    var body: some View {
        NavigationLink(destination: MarksmanChampionDetailView(champion: champion)) {
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

struct MarksmanChampion: Identifiable {
    let id: Int
    let name: String
    let imageName: String
    let lore: String
}

struct MarksmanChampionDetailView: View {
    let champion: MarksmanChampion
    
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
    MarksmanView()
}
