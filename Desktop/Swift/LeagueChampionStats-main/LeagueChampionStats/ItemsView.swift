//
//  ItemsView.swift
//  LeagueChampionStats
//
//  Created by Marc Fernández on 2/1/25.
//

import SwiftUI

struct ItemsView: View {
    init() {
        // Configuración de la apariencia de la barra de navegación
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 17, weight: .bold)]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                VStack {
                    Text("Items") // Provisional, aquí irá el contenido
                        .font(.title)
                }
            }
            .toolbar {
                // Botón de añadir en la esquina superior derecha
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddNewItems()) {
                        Image(systemName: "square.and.pencil")
                    }
                }
                // Título en la barra superior
                ToolbarItem(placement: .principal) {
                    Text("Items")
                        .font(.headline)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
            }
        }
    }
}

struct AddNewItems: View {
    @Environment(\.presentationMode) var presentationMode // Para regresar a la vista anterior
    @State private var selectedOption1: String = "Option 1"
    @State private var selectedOption2: String = "Option 2"
    @State private var sliderValue1: Double = 50
    @State private var sliderValue2: Double = 50
    @State private var sliderValue3: Double = 50
    @State private var sliderValue4: Double = 50
    @State private var showAlert: Bool = false // Controla la alerta
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("ADD NEW ITEMS")
                .font(.largeTitle)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            
            // Botón de confirmación alineado a la derecha
            HStack {
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20) // Tamaño de la imagen
                    .foregroundColor(.white)
                
                Text("LCS - Items")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading, 5)
                Spacer()
                Button(action: {
                    // Lógica al presionar el botón Add
                    createNewItem()
                }) {
                    Text("Add")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Success"),
                        message: Text("Ítem creado"),
                        dismissButton: .default(Text("OK"), action: {
                            presentationMode.wrappedValue.dismiss() // Regresa a la pantalla principal
                        })
                    )
                }
            }
            
            // Itemname desplegable
            Text("Item Name")
                .font(.headline)
            Picker("Options", selection: $selectedOption1) {
                Text("Option 1").tag("Option 1")
                Text("Option 2").tag("Option 2")
                Text("Option 3").tag("Option 3")
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            // Category desplegable
            Text("Category")
                .font(.headline)
            Picker("Options", selection: $selectedOption2) {
                Text("Option 1").tag("Option 1")
                Text("Option 2").tag("Option 2")
                Text("Option 3").tag("Option 3")
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            VStack(spacing: 10) {
                VStack {
                    Text("Attack Damage \(Int(sliderValue1))")
                        .font(.subheadline)
                    Slider(value: $sliderValue1, in: 0...100, step: 1)
                }
                
                VStack {
                    Text("Ability Power \(Int(sliderValue2))")
                        .font(.subheadline)
                    Slider(value: $sliderValue2, in: 0...100, step: 1)
                }
                
                VStack {
                    Text("Armor \(Int(sliderValue3))")
                        .font(.subheadline)
                    Slider(value: $sliderValue3, in: 0...100, step: 1)
                }
                
                VStack {
                    Text("Magic Resist \(Int(sliderValue4))")
                        .font(.subheadline)
                    Slider(value: $sliderValue4, in: 0...100, step: 1)
                }
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Add New Items", displayMode: .inline)
    }
    
    // Método para manejar la creación del ítem
    private func createNewItem() {
        // Lógica adicional para guardar el ítem si es necesario
        showAlert = true // Muestra la alerta de éxito
    }
}

struct AddNewItems_Previews: PreviewProvider {
    static var previews: some View {
        AddNewItems()
    }
}

#Preview {
    ItemsView()
}
