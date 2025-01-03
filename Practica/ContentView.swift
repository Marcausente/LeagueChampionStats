import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView { // Solo envolvemos en NavigationView aquí
            VStack {
                // Barra superior con icono y enlace para añadir items
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    
                    Text("LCS - Items")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.leading, 5)
                    
                    Spacer()
                    
                    NavigationLink(destination: AddNewItems()) {
                        Image(systemName: "plus")
                            .font(.title2)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .background(Color.gray)
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                // Navegación hacia otras pantallas
                HStack(spacing: 0) {
                    NavigationLink(destination: PrimeraPantalla()) {
                        Text("Champions")
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    
                    NavigationLink(destination: SegundaPantalla()) {
                        Text("Items")
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            .navigationBarTitle("ItemViews", displayMode: .inline)
        }
    }
}

struct PrimeraPantalla: View {
    var body: some View {
        VStack {
            // Barra superior con icono y enlace para añadir items
            HStack {
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                Text("LCS - Champions")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading, 5)
                
                Spacer()
            

            }
            .padding()
            .background(Color.gray)
            .frame(maxWidth: .infinity)
            
            Spacer()
            
        
            HStack(spacing: 0) {
                NavigationLink(destination: PrimeraPantalla()) {
                    Text("Champions")
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .overlay(
                            Rectangle()
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
                
                NavigationLink(destination: SegundaPantalla()) {
                    Text("Items")
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .overlay(
                            Rectangle()
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .navigationBarTitle("Primera Pantalla", displayMode: .inline)
    }
}

struct SegundaPantalla: View {
    var body: some View {
        VStack {
            // Barra superior con icono y enlace para añadir items
            HStack {
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                Text("LCS - Items")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading, 5)
                
                Spacer()
                
                NavigationLink(destination: AddNewItems()) {
                    Image(systemName: "plus")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.gray)
            .frame(maxWidth: .infinity)
            
            Spacer()
            
            // Barra inferior con enlaces a otras pantallas
            HStack(spacing: 0) {
                NavigationLink(destination: PrimeraPantalla()) {
                    Text("Champions")
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .overlay(
                            Rectangle()
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
                
                NavigationLink(destination: SegundaPantalla()) {
                    Text("Items")
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .overlay(
                            Rectangle()
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .navigationBarTitle("Segunda Pantalla", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
