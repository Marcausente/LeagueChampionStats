import SwiftUI

struct StarterItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
}

struct StarterView: View {
    let starterItems = [
        StarterItem(name: "Lanza Negra", description: "Un arma mística utilizada para convocar aliados.", imageName: "BlackSpear"),
        StarterItem(name: "Guadaña", description: "Herramienta para recolectar almas y oro adicional.", imageName: "Cull"),
        StarterItem(name: "Sello Oscuro", description: "Potencia el poder de habilidades y acumula gloria.", imageName: "DarkSeal"),
        StarterItem(name: "Espada de Doran", description: "Otorga daño de ataque y robo de vida básico.", imageName: "DoransBlade"),
        StarterItem(name: "Anillo de Doran", description: "Aumenta el poder de las habilidades mágicas.", imageName: "DoransRing"),
        StarterItem(name: "Escudo de Doran", description: "Ofrece regeneración de vida y resistencia en línea.", imageName: "DoransShield"),
        StarterItem(name: "Amuleto del Guardián", description: "Proporciona defensa básica para aliados cercanos.", imageName: "GuardiansAmulet"),
        StarterItem(name: "Espada del Guardián", description: "Un arma que aumenta la ofensiva inicial.", imageName: "GuardiansBlade"),
        StarterItem(name: "Daga del Guardián", description: "Una pequeña arma para ataques rápidos y precisos.", imageName: "GuardiansDirk"),
        StarterItem(name: "Martillo del Guardián", description: "Incrementa la fuerza física y la vitalidad.", imageName: "GuardiansHammer"),
        StarterItem(name: "Cuerno del Guardián", description: "Emite una señal para reforzar aliados cercanos.", imageName: "GuardiansHorn"),
        StarterItem(name: "Orbe del Guardián", description: "Concentra el poder mágico para iniciadores.", imageName: "GuardiansOrb"),
        StarterItem(name: "Sudario del Guardián", description: "Protege contra ataques iniciales enemigos.", imageName: "GuardiansShroud"),
        StarterItem(name: "Cría Caminaviento", description: "Potencia la movilidad y agilidad en combate.", imageName: "GustwalkerHatchling"),
        StarterItem(name: "Brotes de Mosstomper", description: "Otorga resistencia adicional en entornos peligrosos.", imageName: "MosstomperSeedling"),
        StarterItem(name: "Cachorro Escamador", description: "Aumenta el poder de los ataques mágicos.", imageName: "ScorchclawPup"),
        StarterItem(name: "Lágrima de la Diosa", description: "Incrementa la capacidad de maná para habilidades.", imageName: "TearOfTheGoddess"),
        StarterItem(name: "Atlas Mundial", description: "Una guía para explorar nuevos territorios.", imageName: "WorldAtlas")
    ]

    var body: some View {
        NavigationStack {
            List(starterItems) { item in
                StarterItemRow(item: item)
            }
            .navigationTitle("Objetos Iniciales")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct StarterItemRow: View {
    let item: StarterItem

    var body: some View {
        NavigationLink(destination: StarterItemDetailView(item: item)) {
            HStack {
                Image(item.imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Spacer()
                    .frame(width: 15)
                Text(item.name)
                    .font(.headline)
            }
            .padding(.vertical, 8)
        }
    }
}

struct StarterItemDetailView: View {
    let item: StarterItem

    var body: some View {
        VStack(spacing: 20) {
            Image(item.imageName)
                .resizable()
                .frame(width: 150, height: 150)

            Text(item.name)
                .font(.largeTitle)
                .bold()

            Text(item.description)
                .font(.body)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    StarterView()
}
