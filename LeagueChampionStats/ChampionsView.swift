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
                // Fondo gris suave
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    Text("Champions Categories")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 20) {
                        ForEach(ChampionCategory.allCases, id: \.self) { category in
                            NavigationLink(destination: destination(for: category)) {
                                ZStack {
                                    Color.white
                                        .cornerRadius(16)
                                        .frame(height: 160) // Hacer las tarjetas más grandes
                                    
                                    VStack {
                                        // Uso de iconos más representativos para cada categoría
                                        switch category {
                                        case .Mages:
                                            Image(systemName: "book.closed.fill")
                                                .foregroundColor(.purple)
                                                .font(.title2)
                                        case .Fighters:
                                            Image(systemName: "figure.fencing")
                                                .foregroundColor(.orange)
                                                .font(.title2)
                                        case .Tanks:
                                            Image(systemName: "shield.fill")
                                                .foregroundColor(.green)
                                                .font(.title2)
                                        case .Assassins:
                                            Image(systemName: "figure.hunting")
                                                .foregroundColor(.red)
                                                .font(.title2)
                                        case .Support:
                                            Image(systemName: "heart.fill")
                                                .foregroundColor(.pink)
                                                .font(.title2)
                                        case .Marksman:
                                            Image(systemName: "figure.archery")
                                                .foregroundColor(.blue)
                                                .font(.title2)
                                        }
                                        
                                        Text(category.rawValue)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            .padding(.top, 8)
                                    }
                                    .padding(16)
                                }
                                .scaleEffect(0.98) // Escala sutil para el efecto de interacción
                                .animation(.spring(), value: category)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Champions")
                        .font(.headline)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.black)
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
            AssasinsView()
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
