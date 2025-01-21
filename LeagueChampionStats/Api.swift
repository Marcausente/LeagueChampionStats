import SwiftUI

struct ContentView: View {
    @State private var quoteData: QuoteData?

    var body: some View {
        HStack {
            Spacer()

            VStack(alignment: .trailing) {
                Spacer()

                Text(quoteData?.name ?? "Loading...")
                    .font(.title2)
                
                Text("- \(quoteData?.title ?? "Unknown Title")")
                    .font(.title2)
                    .padding(.top)

                Spacer()

                Button(action: loadData) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
        .multilineTextAlignment(.trailing)
        .padding()
        .onAppear(perform: loadData)
    }

    private func loadData() {
        guard let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/11.18.1/data/en_US/champion.json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }
            if let decodedData = try? JSONDecoder().decode(ChampionData.self, from: data) {
                if let firstChampion = decodedData.data.values.first {
                    DispatchQueue.main.async {
                        self.quoteData = QuoteData(id: firstChampion.id, name: firstChampion.name, title: firstChampion.title, stats: "\(firstChampion.stats?.hp ?? 0)")
                    }
                }
            }
        }.resume()
    }
}

struct ChampionData: Decodable {
    var data: [String: Champion]
}

struct Champion: Decodable {
    var id: String
    var name: String
    var title: String
    var stats: ChampionStats?

    enum CodingKeys: String, CodingKey {
        case id, name, title, stats
    }
}

struct ChampionStats: Decodable {
    var hp: Double
}

struct QuoteData {
    var id: String
    var name: String
    var title: String
    var stats: String
}
