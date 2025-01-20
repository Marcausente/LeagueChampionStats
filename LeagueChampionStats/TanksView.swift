import SwiftUI

struct TanksView: View {
    @State private var tankRoster: [Tank] = []

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Lista de los campeones de tanques
                    ForEach(tankRoster) { tank in
                        // Navegar a la vista de detalles al pulsar sobre un tanque
                        NavigationLink(destination: TankDetailView(tank: tank)) {
                            HStack {
                                // Imagen cuadrada del tanque
                                Image(uiImage: fetchTankPortrait(tankID: tank.id))
                                    .resizable()
                                    .frame(width: 50, height: 50) // Asegurarse que la imagen es cuadrada
                                
                                VStack(alignment: .leading) {
                                    // Texto de nombre con color negro
                                    Text(tank.name)
                                        .font(.headline)
                                        .foregroundColor(.black) // Texto en color negro
                                    
                                    // Texto de designación con color negro
                                    Text(tank.designation)
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
            .navigationTitle("Tanks")
            .navigationBarTitleDisplayMode(.large)
            .onAppear(perform: fetchTanks)
        }
    }
    
    // Función para obtener los datos de los campeones (API)
    private func fetchTanks() {
        guard let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/11.18.1/data/en_US/champion.json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching tanks: \(error)")
                return
            }

            guard let data = data else {
                print("No tank data received")
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(TankData.self, from: data)
                var tanks = [Tank]()
                
                // Filtramos campeones con rol "Tank"
                for (_, tank) in decodedData.data {
                    if tank.roles.contains("Tank") {
                        tanks.append(tank)
                    }
                }
                
                DispatchQueue.main.async {
                    self.tankRoster = tanks
                }
            } catch {
                print("Error decoding tank data: \(error)")
            }
        }.resume()
    }
    
    // Función para obtener la imagen del tanque (foto) desde la API
    private func fetchTankPortrait(tankID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(tankID).png")!
        
        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }
        
        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

// Vista de detalles para un tanque
struct TankDetailView: View {
    let tank: Tank
    @State private var isLoreExpanded = false // Estado para controlar la expansión del lore
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    // Imagen cuadrada del tanque
                    Image(uiImage: fetchTankPortrait(tankID: tank.id))
                        .resizable()
                        .frame(width: 150, height: 150) // Imagen cuadrada
                        .cornerRadius(10) // Un pequeño radio de esquina para suavizar los bordes
                    
                    // Nombre con color negro
                    Text(tank.name)
                        .font(.title)
                        .bold()
                        .padding(.top)
                        .foregroundColor(.black) // Texto en color negro
                    
                    // Título con color negro
                    Text(tank.designation)
                        .font(.title3)
                        .foregroundColor(.black) // Texto en color negro
                    
                    // Pestaña para plegar y desplegar el Lore
                    DisclosureGroup(isExpanded: $isLoreExpanded) {
                        Text(tank.story)
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
                    
                    // Habilidades del tanque
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Tank Abilities:")
                            .font(.headline)
                            .foregroundColor(.black) // Texto en color negro
                        
                        if let abilities = tank.abilities {
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
        .navigationTitle(tank.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Función para obtener la imagen del tanque (foto) desde la API
    private func fetchTankPortrait(tankID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(tankID).png")!
        
        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }
        
        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

// Estructuras de datos para la decodificación JSON
struct TankData: Codable {
    var data: [String: Tank]
}

struct Tank: Codable, Identifiable {
    var id: String
    var name: String
    var designation: String
    var story: String
    var roles: [String]
    var abilities: TankAbilities?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case designation = "title"
        case story = "blurb"
        case roles = "tags"
        case abilities = "stats"
    }
}

struct TankAbilities: Codable {
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
    TanksView()
}
