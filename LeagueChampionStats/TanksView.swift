import SwiftUI

struct TanksView: View {
    @State private var tankRoster: [Tank] = []
    @State private var isLoading = true // Estado para mostrar el spinner de carga

    var body: some View {
        NavigationStack {
            if isLoading {
                // Spinner centrado en pantalla
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                    Text("Loading Tanks...")
                        .foregroundColor(.blue)
                        .padding(.top, 8)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(tankRoster) { tank in
                            NavigationLink(destination: TankDetailView(tank: tank)) {
                                HStack {
                                    Image(uiImage: fetchTankPortrait(tankID: tank.id))
                                        .resizable()
                                        .frame(width: 50, height: 50)

                                    VStack(alignment: .leading) {
                                        Text(tank.name)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                        Text(tank.designation)
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                    }

                                    Spacer()

                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .imageScale(.medium)
                                }
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 0)
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
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
    }

    private func fetchTanks() {
        guard let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/11.18.1/data/en_US/champion.json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching tanks: \(error)")
                DispatchQueue.main.async {
                    isLoading = false
                }
                return
            }

            guard let data = data else {
                print("No tank data received")
                DispatchQueue.main.async {
                    isLoading = false
                }
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(TankData.self, from: data)
                var tanks = [Tank]()

                for (_, tank) in decodedData.data {
                    if tank.roles.contains("Tank") {
                        tanks.append(tank)
                    }
                }

                DispatchQueue.main.async {
                    self.tankRoster = tanks
                    self.isLoading = false
                }
            } catch {
                print("Error decoding tank data: \(error)")
                DispatchQueue.main.async {
                    isLoading = false
                }
            }
        }.resume()
    }

    private func fetchTankPortrait(tankID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(tankID).png")!

        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }

        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

// Estructuras de datos y TankDetailView se mantienen sin cambios.
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

struct TankDetailView: View {
    let tank: Tank
    @State private var isLoreExpanded = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(uiImage: fetchTankPortrait(tankID: tank.id))
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)

                Text(tank.name)
                    .font(.title)
                    .bold()
                    .padding(.top)
                    .foregroundColor(.black)

                Text(tank.designation)
                    .font(.title3)
                    .foregroundColor(.black)

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
                        .foregroundColor(.blue)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Tank Abilities:")
                        .font(.headline)
                        .foregroundColor(.black)

                    if let abilities = tank.abilities {
                        Text("Ability Power (AP): \(abilities.abilityPower ?? 0)")
                            .foregroundColor(.purple)
                        Text("Attack Damage (AD): \(abilities.attackDamage ?? 0)")
                            .foregroundColor(.orange)
                        Text("Armor: \(abilities.armor ?? 0)")
                            .foregroundColor(.green)
                        Text("Magic Resist (MR): \(abilities.magicResist ?? 0)")
                            .foregroundColor(.blue)
                    } else {
                        Text("No abilities data available")
                            .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle(tank.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func fetchTankPortrait(tankID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(tankID).png")!

        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }

        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

#Preview {
    TanksView()
}
