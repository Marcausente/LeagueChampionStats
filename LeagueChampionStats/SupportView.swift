import SwiftUI

struct SupportView: View {
    @State private var supportRoster: [Healer] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Lista de los campeones de soporte
                    ForEach(supportRoster) { healer in
                        // Navegar a la vista de detalles al pulsar sobre un campeón
                        NavigationLink(destination: SupportDetailView(supportCharacter: healer)) {
                            HStack {
                                // Imagen cuadrada
                                Image(uiImage: fetchHealerPortrait(healerID: healer.id))
                                    .resizable()
                                    .frame(width: 50, height: 50) // Asegurarse que la imagen es cuadrada
                                
                                VStack(alignment: .leading) {
                                    // Texto de nombre con color negro
                                    Text(healer.name)
                                        .font(.headline)
                                        .foregroundColor(.black) // Texto en color negro
                                    
                                    // Texto de designación con color negro
                                    Text(healer.designation)
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
            .navigationTitle("Supports")
            .navigationBarTitleDisplayMode(.large)
            .onAppear(perform: fetchSupporters)
        }
    }
    
    // Función para obtener los datos de los campeones (API)
    private func fetchSupporters() {
        guard let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/11.18.1/data/en_US/champion.json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching supporters: \(error)")
                return
            }

            guard let data = data else {
                print("No support data received")
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(SupportData.self, from: data)
                var supporters = [Healer]()
                
                // Filtramos campeones con rol "Support"
                for (_, healer) in decodedData.data {
                    if healer.roles.contains("Support") {
                        supporters.append(healer)
                    }
                }
                
                DispatchQueue.main.async {
                    self.supportRoster = supporters
                }
            } catch {
                print("Error decoding support data: \(error)")
            }
        }.resume()
    }
    
    // Función para obtener la imagen del campeón (foto) desde la API
    private func fetchHealerPortrait(healerID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(healerID).png")!
        
        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }
        
        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

struct SupportDetailView: View {
    let supportCharacter: Healer
    @State private var isLoreExpanded = false // Estado para controlar la expansión del lore
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    // Imagen cuadrada (en vez de circular)
                    Image(uiImage: fetchHealerPortrait(healerID: supportCharacter.id))
                        .resizable()
                        .frame(width: 150, height: 150) // Imagen cuadrada
                        .cornerRadius(10) // Un pequeño radio de esquina para suavizar los bordes si lo deseas
                    
                    // Nombre con color negro
                    Text(supportCharacter.name)
                        .font(.title)
                        .bold()
                        .padding(.top)
                        .foregroundColor(.black) // Texto en color negro
                    
                    // Título con color negro
                    Text(supportCharacter.designation)
                        .font(.title3)
                        .foregroundColor(.black) // Texto en color negro
                    
                    // Pestaña para plegar y desplegar el Lore
                    DisclosureGroup(isExpanded: $isLoreExpanded) {
                        Text(supportCharacter.story)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                    } label: {
                        Text("Lore")
                            .font(.headline)
                            .foregroundColor(.blue) // Texto en color azul
                    }
                    
                    // Habilidades del campeón
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Support Abilities:")
                            .font(.headline)
                            .foregroundColor(.black) // Texto en color negro
                        
                        if let abilities = supportCharacter.abilities {
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
        .navigationTitle(supportCharacter.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Función para obtener la imagen del campeón (foto) desde la API
    private func fetchHealerPortrait(healerID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(healerID).png")!
        
        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }
        
        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

// Estructuras de datos para la decodificación JSON
struct SupportData: Codable {
    var data: [String: Healer]
}

struct Healer: Codable, Identifiable {
    var id: String
    var name: String
    var designation: String
    var story: String
    var roles: [String]
    var abilities: HealerAbilities?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case designation = "title"
        case story = "blurb"
        case roles = "tags"
        case abilities = "stats"
    }
}

struct HealerAbilities: Codable {
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
