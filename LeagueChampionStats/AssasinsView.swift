import SwiftUI

struct AssassinsView: View {
    @State private var assassinRoster: [Assassin] = []

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Lista de los campeones de asesinos
                    ForEach(assassinRoster) { assassin in
                        // Navegar a la vista de detalles al pulsar sobre un asesino
                        NavigationLink(destination: AssassinDetailView(assassin: assassin)) {
                            HStack {
                                // Imagen cuadrada del asesino
                                Image(uiImage: fetchAssassinPortrait(assassinID: assassin.id))
                                    .resizable()
                                    .frame(width: 50, height: 50) // Asegurarse que la imagen es cuadrada
                                
                                VStack(alignment: .leading) {
                                    // Texto de nombre con color negro
                                    Text(assassin.name)
                                        .font(.headline)
                                        .foregroundColor(.black) // Texto en color negro
                                    
                                    // Texto de designación con color negro
                                    Text(assassin.designation)
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
            .navigationTitle("Assassins")
            .navigationBarTitleDisplayMode(.large)
            .onAppear(perform: fetchAssassins)
        }
    }
    
    // Función para obtener los datos de los campeones (API)
    private func fetchAssassins() {
        guard let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/11.18.1/data/en_US/champion.json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching assassins: \(error)")
                return
            }

            guard let data = data else {
                print("No assassin data received")
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(AssassinData.self, from: data)
                var assassins = [Assassin]()
                
                // Filtramos campeones con rol "Assassin"
                for (_, assassin) in decodedData.data {
                    if assassin.roles.contains("Assassin") {
                        assassins.append(assassin)
                    }
                }
                
                DispatchQueue.main.async {
                    self.assassinRoster = assassins
                }
            } catch {
                print("Error decoding assassin data: \(error)")
            }
        }.resume()
    }
    
    // Función para obtener la imagen del asesino (foto) desde la API
    private func fetchAssassinPortrait(assassinID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(assassinID).png")!
        
        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }
        
        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

// Vista de detalles para un asesino
struct AssassinDetailView: View {
    let assassin: Assassin
    @State private var isLoreExpanded = false // Estado para controlar la expansión del lore
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    // Imagen cuadrada del asesino
                    Image(uiImage: fetchAssassinPortrait(assassinID: assassin.id))
                        .resizable()
                        .frame(width: 150, height: 150) // Imagen cuadrada
                        .cornerRadius(10) // Un pequeño radio de esquina para suavizar los bordes
                    
                    // Nombre con color negro
                    Text(assassin.name)
                        .font(.title)
                        .bold()
                        .padding(.top)
                        .foregroundColor(.black) // Texto en color negro
                    
                    // Título con color negro
                    Text(assassin.designation)
                        .font(.title3)
                        .foregroundColor(.black) // Texto en color negro
                    
                    // Historia (lore) plegable
                    DisclosureGroup(isExpanded: $isLoreExpanded) {
                        Text(assassin.story)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                    } label: {
                        Text("Lore")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 5)
                    }
                    .padding(.horizontal)
                    .animation(.easeInOut, value: isLoreExpanded) // Animación para el toggle
                    
                    // Habilidades del asesino
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Assassin Abilities:")
                            .font(.headline)
                            .foregroundColor(.black) // Texto en color negro
                        
                        if let abilities = assassin.abilities {
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
        .navigationTitle(assassin.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Función para obtener la imagen del asesino (foto) desde la API
    private func fetchAssassinPortrait(assassinID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(assassinID).png")!
        
        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }
        
        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

// Estructuras de datos para la decodificación JSON
struct AssassinData: Codable {
    var data: [String: Assassin]
}

struct Assassin: Codable, Identifiable {
    var id: String
    var name: String
    var designation: String
    var story: String
    var roles: [String]
    var abilities: AssassinAbilities?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case designation = "title"
        case story = "blurb"
        case roles = "tags"
        case abilities = "stats"
    }
}

struct AssassinAbilities: Codable {
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
    AssassinsView()
}
