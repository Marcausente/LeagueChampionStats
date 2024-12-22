import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Encabezado gris con imagen y texto
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    
                    Text("Header")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.leading, 5) 
                    
                    Spacer()
                    
                    NavigationLink(destination: NuevaPantalla()) {
                        Image(systemName: "plus")
                            .font(.title2)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .background(Color.gray) // Fondo gris completo
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                // Botones cuadrados en la parte inferior
                HStack(spacing: 0) { // Botones pegados
                    NavigationLink(destination: PrimeraPantalla()) {
                        Text("Champions")
                            .frame(width: 100, height: 100) // Tamaño cuadrado
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .overlay( // Borde negro fino
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    
                    NavigationLink(destination: SegundaPantalla()) {
                        Text("Items")
                            .frame(width: 100, height: 100) // Tamaño cuadrado
                            .background(Color.green)
                            .foregroundColor(.white)
                            .overlay( // Borde negro fino
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                }
                .padding()
            }
            .navigationBarTitle("ItemViews", displayMode: .inline)
        }
    }
}

struct PrimeraPantalla: View {
    var body: some View {
        VStack {
            Text("Bienvenido a la Primera Pantalla")
                .font(.largeTitle)
                .padding()
        }
        .navigationBarTitle("Primera Pantalla", displayMode: .inline)
    }
}

struct SegundaPantalla: View {
    var body: some View {
        VStack {
            Text("Bienvenido a la Segunda Pantalla")
                .font(.largeTitle)
                .padding()
        }
        .navigationBarTitle("Segunda Pantalla", displayMode: .inline)
    }
}

struct NuevaPantalla: View {
    var body: some View {
        VStack {
            Text("Nueva Pantalla")
                .font(.largeTitle)
                .padding()
        }
        .navigationBarTitle("Nueva Pantalla", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
