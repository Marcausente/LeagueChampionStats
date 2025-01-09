import SwiftUI

struct ChampionsView: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 17, weight: .bold)
        ]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                VStack(spacing: 16) {
                    Text("Champions")
                        .font(.title)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(ChampionCategory.allCases, id: \.self) { category in
                            NavigationLink(destination: destination(for: category)) {
                                ZStack {
                                    Color.white
                                        .cornerRadius(12)
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                                    
                                    Text(category.rawValue)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .padding()
                                }
                                .frame(height: 100)
                            }
                        }
                    }
                    .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Champions")
                        .font(.headline)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
            }
        }
    }
    
    @ViewBuilder
    func destination(for category: ChampionCategory) -> some View {
        switch category {
        case .Mages:
            MagesView()
        case .Fighters:
            FightersView()
        case .Tanks:
            TanksView()
        case .Assassins:
            AssassinView()
        case .Support:
            SupportView()
        case .Marksman:
            MarksmanView()
        }
    }
}

enum ChampionCategory: String, CaseIterable {
    case Mages = "Mages"
    case Fighters = "Fighters"
    case Tanks = "Tanks"
    case Support = "Support"
    case Assassins = "Assassins"
    case Marksman = "Marksman"
}

#Preview {
    ChampionsView()
}
