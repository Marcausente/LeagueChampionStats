import SwiftUI

struct FightersView: View {
    @State private var fighterRoster: [Fighter] = []
    @State private var isLoading: Bool = true

    var body: some View {
        NavigationStack {
            ZStack {
                if isLoading {
                    VStack {
                        ProgressView("Loading Fighters...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .foregroundColor(.blue)
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(UIColor.systemBackground))
                } else {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(fighterRoster) { fighter in
                                NavigationLink(destination: FighterDetailView(fighter: fighter)) {
                                    HStack {
                                        Image(uiImage: fetchFighterPortrait(fighterID: fighter.id))
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                        
                                        VStack(alignment: .leading) {
                                            Text(fighter.name)
                                                .font(.headline)
                                                .foregroundColor(.black)
                                            
                                            Text(fighter.designation)
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
            .navigationTitle("Fighters")
            .navigationBarTitleDisplayMode(.large)
            .onAppear(perform: fetchFighters)
        }
    }
    
    private func fetchFighters() {
        guard let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/11.18.1/data/en_US/champion.json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching fighters: \(error)")
                DispatchQueue.main.async {
                    isLoading = false
                }
                return
            }

            guard let data = data else {
                print("No fighter data received")
                DispatchQueue.main.async {
                    isLoading = false
                }
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(FighterData.self, from: data)
                var fighters = [Fighter]()
                
                for (_, fighter) in decodedData.data {
                    if fighter.roles.contains("Fighter") {
                        fighters.append(fighter)
                    }
                }
                
                DispatchQueue.main.async {
                    self.fighterRoster = fighters
                    self.isLoading = false
                }
            } catch {
                print("Error decoding fighter data: \(error)")
                DispatchQueue.main.async {
                    isLoading = false
                }
            }
        }.resume()
    }
    

    private func fetchFighterPortrait(fighterID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(fighterID).png")!
        
        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }
        
        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

struct FighterDetailView: View {
    let fighter: Fighter
    @State private var isLoreExpanded: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Image(uiImage: fetchFighterPortrait(fighterID: fighter.id))
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                    
                    Text(fighter.name)
                        .font(.title)
                        .bold()
                        .padding(.top)
                        .foregroundColor(.black) 
                    
                    Text(fighter.designation)
                        .font(.title3)
                        .foregroundColor(.black)
                    
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
                                .foregroundColor(.black)
                        }
                    )
                    .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Fighter Abilities:")
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        if let abilities = fighter.abilities {
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
        .navigationTitle(fighter.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    

    private func fetchFighterPortrait(fighterID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(fighterID).png")!
        
        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }
        
        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

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
