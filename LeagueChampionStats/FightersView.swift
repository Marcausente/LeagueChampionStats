import SwiftUI

struct FightersView: View {
    @State private var fighterRoster: [Fighter] = []

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Lista de los campeones de luchadores
                    ForEach(fighterRoster) { fighter in
                        // Navegar a la vista de detalles al pulsar sobre un luchador
                        NavigationLink(destination: FighterDetailView(fighter: fighter)) {
                            HStack {
                                // Imagen cuadrada del luchador
                                Image(uiImage: fetchFighterPortrait(fighterID: fighter.id))
                                    .resizable()
                                    .frame(width: 50, height: 50) // Asegurarse que la imagen es cuadrada
                                
                                VStack(alignment: .leading) {
                                    // Texto de nombre con color negro
                                    Text(fighter.name)
                                        .font(.headline)
                                        .foregroundColor(.black) // Texto en color negro
                                    
                                    // Texto de designación con color negro
                                    Text(fighter.designation)
                                        .font(.subheadline)
                                        .foregroundColor(.black) // Texto en color negro
                                }
                                
                                Spacer()
                                
                                // Flecha que apunta a la derecha
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray) // Color de la flecha
                                    .imageScale(.medium)
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 0) // Borde rectangular sin redondear
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1) // Borde delgado de color gris
                            )
                            .padding([.leading, .trailing])
                        }
                    }
                }
            }
            .navigationTitle("Fighters")
            .navigationBarTitleDisplayMode(.large)
            .onAppear(perform: fetchFighters)
        }
    }
    
    // Función para obtener los datos de los campeones (API)
    private func fetchFighters() {
        guard let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/11.18.1/data/en_US/champion.json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching fighters: \(error)")
                return
            }

            guard let data = data else {
                print("No fighter data received")
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(FighterData.self, from: data)
                var fighters = [Fighter]()
                
                // Filtramos campeones con rol "Fighter"
                for (_, fighter) in decodedData.data {
                    if fighter.roles.contains("Fighter") {
                        fighters.append(fighter)
                    }
                }
                
                DispatchQueue.main.async {
                    self.fighterRoster = fighters
                }
            } catch {
                print("Error decoding fighter data: \(error)")
            }
        }.resume()
    }
    
    // Función para obtener la imagen del luchador (foto) desde la API
    private func fetchFighterPortrait(fighterID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(fighterID).png")!
        
        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }
        
        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

// Vista de detalles para un luchador
struct FighterDetailView: View {
    let fighter: Fighter
    @State private var isLoreExpanded: Bool = false // Estado para controlar si el lore está expandido o no
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    // Imagen cuadrada del luchador
                    Image(uiImage: fetchFighterPortrait(fighterID: fighter.id))
                        .resizable()
                        .frame(width: 150, height: 150) // Imagen cuadrada
                        .cornerRadius(10) // Un pequeño radio de esquina para suavizar los bordes
                    
                    // Nombre con color negro
                    Text(fighter.name)
                        .font(.title)
                        .bold()
                        .padding(.top)
                        .foregroundColor(.black) // Texto en color negro
                    
                    // Título con color negro
                    Text(fighter.designation)
                        .font(.title3)
                        .foregroundColor(.black) // Texto en color negro
                    
                    // DisclosureGroup para el lore
                    DisclosureGroup(
                        isExpanded: $isLoreExpanded,
                        content: {
                            Text(fighter.story)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(UIColor.secondarySystemBackground))
                                .cornerRadius(10)
                        },
                        label: {
                            Text("Lore")
                                .font(.headline)
                                .foregroundColor(.black) // Texto en color negro
                        }
                    )
                    .padding(.top)
                    
                    // Habilidades del luchador
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Fighter Abilities:")
                            .font(.headline)
                            .foregroundColor(.black) // Texto en color negro
                        
                        if let abilities = fighter.abilities {
                            Text("Ability Power (AP): \(abilities.abilityPower ?? 0)")
                                .foregroundColor(.purple) // Color morado para Ability Power (AP)
                            Text("Attack Damage (AD): \(abilities.attackDamage ?? 0)")
                                .foregroundColor(.orange) // Color naranja para Attack Damage (AD)
                            Text("Armor: \(abilities.armor ?? 0)")
                                .foregroundColor(.green) // Color verde para Armor
                            Text("Magic Resist (MR): \(abilities.magicResist ?? 0)")
                                .foregroundColor(.blue) // Color azul para Magic Resist (MR)
                        } else {
                            Text("No abilities data available")
                                .foregroundColor(.black) // Texto en color negro
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 0) // Borde rectangular sin redondear
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1) // Borde delgado de color gris
                )
                .padding([.leading, .trailing, .top])
            }
        }
        .navigationTitle(fighter.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Función para obtener la imagen del luchador (foto) desde la API
    private func fetchFighterPortrait(fighterID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(fighterID).png")!
        
        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }
        
        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

// Estructuras de datos para la decodificación JSON
struct FighterData: Codable {
    var data: [String: Fighter]
}

struct Fighter: Codable, Identifiable {
    var id: String
    var name: String
    var designation: String
    var story: String
    var roles: [String]
    var abilities: FighterAbilities?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case designation = "title"
        case story = "blurb"
        case roles = "tags"
        case abilities = "stats"
    }
}

struct FighterAbilities: Codable {
    var abilityPower: Double?
    var attackDamage: Double?
    var armor: Double?
    var magicResist: Double?
    
    enum CodingKeys: String, CodingKey {
        case abilityPower = "magic"
        case attackDamage = "attackdamage"
        case armor = "armor"
        case magicResist = "spellblock"
    }
}

#Preview {
    FightersView()
}
