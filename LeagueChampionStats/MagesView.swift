import SwiftUI

struct MagesView: View {
    @State private var mageRoster: [Mage] = []

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Lista de los campeones de magos
                    ForEach(mageRoster) { mage in
                        // Navegar a la vista de detalles al pulsar sobre un mago
                        NavigationLink(destination: MageDetailView(mage: mage)) {
                            HStack {
                                // Imagen cuadrada del mago
                                Image(uiImage: fetchMagePortrait(mageID: mage.id))
                                    .resizable()
                                    .frame(width: 50, height: 50) // Asegurarse que la imagen es cuadrada
                                
                                VStack(alignment: .leading) {
                                    // Texto de nombre con color negro
                                    Text(mage.name)
                                        .font(.headline)
                                        .foregroundColor(.black) // Texto en color negro
                                    
                                    // Texto de designación con color negro
                                    Text(mage.designation)
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
            .navigationTitle("Mages")
            .navigationBarTitleDisplayMode(.large)
            .onAppear(perform: fetchMages)
        }
    }
    
    // Función para obtener los datos de los campeones (API)
    private func fetchMages() {
        guard let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/11.18.1/data/en_US/champion.json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching mages: \(error)")
                return
            }

            guard let data = data else {
                print("No mage data received")
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(MageData.self, from: data)
                var mages = [Mage]()
                
                // Filtramos campeones con rol "Mage"
                for (_, mage) in decodedData.data {
                    if mage.roles.contains("Mage") {
                        mages.append(mage)
                    }
                }
                
                DispatchQueue.main.async {
                    self.mageRoster = mages
                }
            } catch {
                print("Error decoding mage data: \(error)")
            }
        }.resume()
    }
    
    // Función para obtener la imagen del mago (foto) desde la API
    private func fetchMagePortrait(mageID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(mageID).png")!
        
        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }
        
        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

// Vista de detalles para un mago
struct MageDetailView: View {
    let mage: Mage
    @State private var isLoreExpanded: Bool = false // Estado para controlar si el lore está expandido o colapsado

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    // Imagen cuadrada del mago
                    Image(uiImage: fetchMagePortrait(mageID: mage.id))
                        .resizable()
                        .frame(width: 150, height: 150) // Imagen cuadrada
                        .cornerRadius(10) // Un pequeño radio de esquina para suavizar los bordes
                    
                    // Nombre con color negro
                    Text(mage.name)
                        .font(.title)
                        .bold()
                        .padding(.top)
                        .foregroundColor(.black) // Texto en color negro
                    
                    // Título con color negro
                    Text(mage.designation)
                        .font(.title3)
                        .foregroundColor(.black) // Texto en color negro
                    
                    // Pestaña plegable para el lore
                    DisclosureGroup(isExpanded: $isLoreExpanded) {
                        // Historia
                        Text(mage.story)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                    } label: {
                        Text("Lore")
                            .font(.headline)
                            .foregroundColor(.black) // Título "Lore" en color negro
                    }
                    .padding(.top, 10)
                    
                    // Habilidades del mago
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Mage Abilities:")
                            .font(.headline)
                            .foregroundColor(.black) // Texto en color negro
                        
                        if let abilities = mage.abilities {
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
        .navigationTitle(mage.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Función para obtener la imagen del mago (foto) desde la API
    private func fetchMagePortrait(mageID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(mageID).png")!
        
        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }
        
        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

// Estructuras de datos para la decodificación JSON
struct MageData: Codable {
    var data: [String: Mage]
}

struct Mage: Codable, Identifiable {
    var id: String
    var name: String
    var designation: String
    var story: String
    var roles: [String]
    var abilities: MageAbilities?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case designation = "title"
        case story = "blurb"
        case roles = "tags"
        case abilities = "stats"
    }
}

struct MageAbilities: Codable {
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
    MagesView()
}
