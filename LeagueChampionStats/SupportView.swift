import SwiftUI

struct SupportView: View {
    @State private var supportRoster: [Healer] = []
    @State private var isLoading: Bool = true 

    var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    VStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                        Text("Loading Support...")
                            .foregroundColor(.blue)
                            .padding(.top, 8)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(supportRoster) { healer in
                                NavigationLink(destination: SupportDetailView(supportCharacter: healer)) {
                                    HStack {
                                        Image(uiImage: fetchHealerPortrait(healerID: healer.id))
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                        
                                        VStack(alignment: .leading) {
                                            Text(healer.name)
                                                .font(.headline)
                                                .foregroundColor(.black)
                                            
                                            Text(healer.designation)
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
                }
            }
            .navigationTitle("Supports")
            .navigationBarTitleDisplayMode(.large)
            .onAppear(perform: fetchSupporters)
        }
    }

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
                
                for (_, healer) in decodedData.data {
                    if healer.roles.contains("Support") {
                        supporters.append(healer)
                    }
                }
                
                DispatchQueue.main.async {
                    self.supportRoster = supporters
                    self.isLoading = false
                }
            } catch {
                print("Error decoding support data: \(error)")
            }
        }.resume()
    }

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
    @State private var isLoreExpanded = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Image(uiImage: fetchHealerPortrait(healerID: supportCharacter.id))
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                    
                    Text(supportCharacter.name)
                        .font(.title)
                        .bold()
                        .padding(.top)
                        .foregroundColor(.black)
                    
                    Text(supportCharacter.designation)
                        .font(.title3)
                        .foregroundColor(.black)
                    
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
                            .foregroundColor(.blue)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Support Abilities:")
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        if let abilities = supportCharacter.abilities {
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
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .padding([.leading, .trailing, .top])
            }
        }
        .navigationTitle(supportCharacter.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func fetchHealerPortrait(healerID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(healerID).png")!
        
        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }
        
        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

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
