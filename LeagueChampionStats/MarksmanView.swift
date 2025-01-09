import SwiftUI

struct MarksmanView: View {
    let MarksmanChampions = [
        MarksmanCharacter(id: 1, name: "Ashe,\n the Frost Archer", imageName: "AsheIcon", lore: "Ashe, una arquera de hielo, lidera a su tribu con precisión y una voluntad inquebrantable."),
        MarksmanCharacter(id: 2, name: "Caitlyn,\n the Sheriff of Piltover", imageName: "CaitlynIcon", lore: "Caitlyn, la sheriff de Piltover, utiliza su rifle hextech para mantener el orden en la ciudad."),
        MarksmanCharacter(id: 3, name: "Draven,\n the Glorious Executioner", imageName: "DravenIcon", lore: "Draven, un gladiador noxiano, domina el campo de batalla con sus hachas giratorias."),
        MarksmanCharacter(id: 4, name: "Ezreal,\n the Prodigal Explorer", imageName: "EzrealIcon", lore: "Ezreal, un aventurero de Piltover, utiliza su guante mágico para superar cualquier desafío."),
        MarksmanCharacter(id: 5, name: "Jhin,\n the Virtuoso", imageName: "JhinIcon", lore: "Jhin, un asesino obsesionado con el arte, ejecuta a sus enemigos con precisión letal."),
        MarksmanCharacter(id: 6, name: "Jinx,\n the Loose Cannon", imageName: "JinxIcon", lore: "Jinx, una criminal de Zaun, siembra el caos con su arsenal explosivo."),
        MarksmanCharacter(id: 7, name: "Kai'Sa,\n Daughter of the Void", imageName: "KaisaIcon", lore: "Kai'Sa, una guerrera marcada por el Vacío, lucha con una armadura simbiótica."),
        MarksmanCharacter(id: 8, name: "Kalista,\n the Spear of Vengeance", imageName: "KalistaIcon", lore: "Kalista, el espíritu de la venganza, busca justicia para aquellos que han sido traicionados."),
        MarksmanCharacter(id: 9, name: "Kog'Maw,\n the Mouth of the Abyss", imageName: "KogmawIcon", lore: "Kog'Maw, una criatura del Vacío, ataca a sus enemigos con ácido corrosivo."),
        MarksmanCharacter(id: 10, name: "Lucian,\n the Purifier", imageName: "LucianIcon", lore: "Lucian, un cazador de espectros, lucha por vengar a su esposa con pistolas relicarias."),
        MarksmanCharacter(id: 11, name: "Miss Fortune,\n the Bounty Hunter", imageName: "MissFortuneIcon", lore: "Miss Fortune, una temible cazarrecompensas, domina los mares con su pistolería experta."),
        MarksmanCharacter(id: 12, name: "Samira,\n the Desert Rose", imageName: "SamiraIcon", lore: "Samira, una tiradora de Shurima, combina estilo y letalidad en cada combate."),
        MarksmanCharacter(id: 13, name: "Senna,\n the Redeemer", imageName: "SennaIcon", lore: "Senna, una portadora de luz, lucha con su reliquia para proteger a los vivos y a los muertos."),
        MarksmanCharacter(id: 14, name: "Sivir,\n the Battle Mistress", imageName: "SivirIcon", lore: "Sivir, una mercenaria de Shurima, lucha con su hoja en forma de cruz."),
        MarksmanCharacter(id: 15, name: "Tristana,\n the Yordle Gunner", imageName: "TristanaIcon", lore: "Tristana, una tiradora yordle, utiliza su cañón para proteger a sus aliados."),
        MarksmanCharacter(id: 16, name: "Twitch,\n the Plague Rat", imageName: "TwitchIcon", lore: "Twitch, una rata mutada de Zaun, dispara desde las sombras con su ballesta."),
        MarksmanCharacter(id: 17, name: "Varus,\n the Arrow of Retribution", imageName: "VarusIcon", lore: "Varus, un espíritu vengativo atrapado en un arco, busca justicia a cualquier precio."),
        MarksmanCharacter(id: 18, name: "Vayne,\n the Night Hunter", imageName: "VayneIcon", lore: "Vayne, una cazadora de monstruos, persigue a sus enemigos con ballestas precisas."),
        MarksmanCharacter(id: 19, name: "Xayah,\n the Rebel", imageName: "XayahIcon", lore: "Xayah, una rebelde vastaya, lucha junto a Rakan para proteger a su pueblo."),
        MarksmanCharacter(id: 20, name: "Zeri,\n the Spark of Zaun", imageName: "ZeriIcon", lore: "Zeri, una joven de Zaun, utiliza su energía eléctrica para combatir la opresión."),
        MarksmanCharacter(id: 21, name: "Akshan,\n the Rogue Sentinel", imageName: "AkshanIcon", lore: "Akshan, un vigilante rebelde, lucha por la justicia con su arma de gancho y revólver."),
        MarksmanCharacter(id: 22, name: "Aphelios,\n the Weapon of the Faithful", imageName: "ApheliosIcon", lore: "Aphelios, un asesino silencioso, utiliza su arsenal de armas lunares para cumplir su misión."),
        MarksmanCharacter(id: 23, name: "Corki,\n the Daring Bombardier", imageName: "CorkiIcon", lore: "Corki, un yordle piloto, recorre los cielos en su máquina voladora bombardeando a sus enemigos."),
        MarksmanCharacter(id: 24, name: "Quinn,\n Demacia's Wings", imageName: "QuinnIcon", lore: "Quinn, una exploradora de élite de Demacia, lucha junto a su fiel águila, Valor.")
    ]
    
    var body: some View {
        NavigationStack {
            List(MarksmanChampions) { champion in
                NavigationLink(destination: MarksmanDetailView(character: champion)) {
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
            .navigationTitle("Marksmen")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct MarksmanCharacter: Identifiable {
    let id: Int
    let name: String
    let imageName: String
    let lore: String
}

struct MarksmanDetailView: View {
    let character: MarksmanCharacter
    
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
    MarksmanView()
}
