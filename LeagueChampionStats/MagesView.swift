import SwiftUI

struct MagesView: View {
    // Lista de personajes ficticios
    let characters = [
        Character(id: 1, name: "Juan", imageName: "placeholder_image"),
        Character(id: 2, name: "María", imageName: "placeholder_image"),
        Character(id: 3, name: "Gonzalo", imageName: "placeholder_image"),
        Character(id: 4, name: "Lucía", imageName: "placeholder_image"),
        Character(id: 5, name: "Carlos", imageName: "placeholder_image"),
        Character(id: 6, name: "Ana", imageName: "placeholder_image"),
        Character(id: 7, name: "Miguel", imageName: "placeholder_image"),
        Character(id: 8, name: "Sofía", imageName: "placeholder_image"),
        Character(id: 9, name: "Javier", imageName: "placeholder_image"),
        Character(id: 10, name: "Laura", imageName: "placeholder_image"),
        Character(id: 11, name: "Pablo", imageName: "placeholder_image"),
        Character(id: 12, name: "Clara", imageName: "placeholder_image"),
        Character(id: 13, name: "Andrés", imageName: "placeholder_image"),
        Character(id: 14, name: "Marta", imageName: "placeholder_image"),
        Character(id: 15, name: "Raúl", imageName: "placeholder_image"),
        Character(id: 16, name: "Paula", imageName: "placeholder_image"),
        Character(id: 17, name: "Fernando", imageName: "placeholder_image"),
        Character(id: 18, name: "Elena", imageName: "placeholder_image"),
        Character(id: 19, name: "Adrián", imageName: "placeholder_image"),
        Character(id: 20, name: "Natalia", imageName: "placeholder_image"),
        Character(id: 21, name: "Héctor", imageName: "placeholder_image"),
        Character(id: 22, name: "Inés", imageName: "placeholder_image"),
        Character(id: 23, name: "Rubén", imageName: "placeholder_image"),
        Character(id: 24, name: "Carmen", imageName: "placeholder_image"),
        Character(id: 25, name: "David", imageName: "placeholder_image")
    ]
    
    var body: some View {
        NavigationStack {
            List(characters) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                        Text(character.name)
                            .font(.headline)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Mages")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Modelo de datos para un personaje
struct Character: Identifiable {
    let id: Int
    let name: String
    let imageName: String
}

// Vista de detalles del personaje
struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
            
            Text(character.name)
                .font(.largeTitle)
                .bold()
            
            Text("Detalles sobre \(character.name) estarán aquí.")
                .font(.body)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MagesView()
}
