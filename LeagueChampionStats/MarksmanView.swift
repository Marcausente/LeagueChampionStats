import SwiftUI

struct MarksmanView: View {
    @State private var marksmanRoster: [Marksman] = []
    @State private var isLoading: Bool = true 

    var body: some View {
        NavigationStack {
            ZStack {
                if isLoading {
                    VStack {
                        ProgressView("Loading Marksmen...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .foregroundColor(.blue)
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(UIColor.systemBackground))
                } else {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(marksmanRoster) { marksman in
                                NavigationLink(destination: MarksmanDetailView(marksmanCharacter: marksman)) {
                                    HStack {
                                        Image(uiImage: fetchMarksmanPortrait(marksmanID: marksman.id))
                                            .resizable()
                                            .frame(width: 50, height: 50)

                                        VStack(alignment: .leading) {
                                            Text(marksman.name)
                                                .font(.headline)
                                                .foregroundColor(.black)

                                            Text(marksman.designation)
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
            .navigationTitle("Marksmen")
            .navigationBarTitleDisplayMode(.large)
            .onAppear(perform: fetchMarksmen)
        }
    }

    private func fetchMarksmen() {
        guard let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/11.18.1/data/en_US/champion.json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching marksmen: \(error)")
                DispatchQueue.main.async {
                    isLoading = false
                }
                return
            }

            guard let data = data else {
                print("No marksman data received")
                DispatchQueue.main.async {
                    isLoading = false
                }
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(MarksmanData.self, from: data)
                var marksmen = [Marksman]()

                // Filtrar campeones con rol "Marksman"
                for (_, marksman) in decodedData.data {
                    if marksman.roles.contains("Marksman") {
                        marksmen.append(marksman)
                    }
                }

                DispatchQueue.main.async {
                    self.marksmanRoster = marksmen
                    self.isLoading = false 
                }
            } catch {
                print("Error decoding marksman data: \(error)")
                DispatchQueue.main.async {
                    isLoading = false
                }
            }
        }.resume()
    }

    private func fetchMarksmanPortrait(marksmanID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(marksmanID).png")!

        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }

        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

struct MarksmanDetailView: View {
    let marksmanCharacter: Marksman
    @State private var isLoreExpanded = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Image(uiImage: fetchMarksmanPortrait(marksmanID: marksmanCharacter.id))
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                    
                    Text(marksmanCharacter.name)
                        .font(.title)
                        .bold()
                        .padding(.top)
                        .foregroundColor(.black)
                    
                    Text(marksmanCharacter.designation)
                        .font(.title3)
                        .foregroundColor(.black)
                    
                    DisclosureGroup(isExpanded: $isLoreExpanded) {
                        Text(marksmanCharacter.story)
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
                        Text("Marksman Abilities:")
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        if let abilities = marksmanCharacter.abilities {
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
        .navigationTitle(marksmanCharacter.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    //Esto saca la imagen de la API
    private func fetchMarksmanPortrait(marksmanID: String) -> UIImage {
        let baseURL = "https://ddragon.leagueoflegends.com/cdn/11.18.1/img/champion/"
        let portraitURL = URL(string: "\(baseURL)\(marksmanID).png")!
        
        if let data = try? Data(contentsOf: portraitURL), let portrait = UIImage(data: data) {
            return portrait
        }
        
        return UIImage(systemName: "cross.case.fill") ?? UIImage()
    }
}

struct MarksmanData: Codable {
    var data: [String: Marksman]
}

struct Marksman: Codable, Identifiable {
    var id: String
    var name: String
    var designation: String
    var story: String
    var roles: [String]
    var abilities: MarksmanAbilities?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case designation = "title"
        case story = "blurb"
        case roles = "tags"
        case abilities = "stats"
    }
}

struct MarksmanAbilities: Codable {
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
