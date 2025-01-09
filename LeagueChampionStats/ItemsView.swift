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
    @Environment(\.presentationMode) var presentationMode
    @State private var itemName: String = ""
    @State private var selectedCategory: String = "Option 1"
    @State private var attackDamage: Double = 50
    @State private var abilityPower: Double = 50
    @State private var armor: Double = 50
    @State private var magicResist: Double = 50
    @State private var showAlert: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Item Details").font(.headline)) {
                    // Campo de texto para Item Name
                    TextField("Enter item name", text: $itemName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical, 5)

                    Picker("Category", selection: $selectedCategory) {
                        Text("Option 1").tag("Option 1")
                        Text("Option 2").tag("Option 2")
                        Text("Option 3").tag("Option 3")
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Section(header: Text("Attributes").font(.headline)) {
                    SliderInputView(title: "Attack Damage", value: $attackDamage)
                    SliderInputView(title: "Ability Power", value: $abilityPower)
                    SliderInputView(title: "Armor", value: $armor)
                    SliderInputView(title: "Magic Resist", value: $magicResist)
                }
            }
            .navigationTitle("Add New Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        createNewItem()
                    }
                    .font(.headline)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Success"),
                    message: Text("Item '\(itemName)' created successfully!"),
                    dismissButton: .default(Text("OK"), action: {
                        presentationMode.wrappedValue.dismiss()
                    })
                )
            }
        }
    }

    private func createNewItem() {
        guard !itemName.isEmpty else {
            // Manejo de error si el nombre está vacío
            showAlert = true
            return
        }
        showAlert = true
    }
}

struct SliderInputView: View {
    var title: String
    @Binding var value: Double

    var body: some View {
        VStack {
            Text("\(title): \(Int(value))")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
            Slider(value: $value, in: 0...100, step: 1)
        }
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
