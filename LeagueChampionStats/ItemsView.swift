import SwiftUI

struct ItemsView: View {
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
                    Text("Items")
                        .font(.title)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(ItemCategory.allCases, id: \.self) { category in
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
                    Text("Items")
                        .font(.headline)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
                // Botón "Add" en la barra de herramientas
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddNewItems()) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func destination(for category: ItemCategory) -> some View {
        switch category {
        case .Starter:
            StarterView()  // Vínculo a la vista externa StarterView
        case .Basic:
            BasicView()    // Vínculo a la vista externa BasicView
        case .Epic:
            EpicView()     // Vínculo a la vista externa EpicView
        case .Legendary:
            LegendaryView() // Vínculo a la vista externa LegendaryView
        case .Utility:
            UtilityView()   // Vínculo a la vista externa UtilityView
        case .Boots:
            BootsView()     // Vínculo a la vista externa BootsView
        }
    }
}

enum ItemCategory: String, CaseIterable {
    case Starter = "Starter"
    case Basic = "Basic"
    case Epic = "Epic"
    case Legendary = "Legendary"
    case Utility = "Utility"
    case Boots = "Boots"
}

struct AddNewItems: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var itemName: String = ""
    @State private var selectedCategory: ItemCategory = .Starter
    @State private var attackDamage: Double = 0
    @State private var abilityPower: Double = 0
    @State private var armor: Double = 0
    @State private var magicResist: Double = 0
    @State private var showAlert: Bool = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Campo de texto para el nombre del ítem
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Item Name")
                            .font(.headline)
                        TextField("Enter item name", text: $itemName)
                            .padding()
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                    }

                    // Selector de categoría
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Category")
                            .font(.headline)
                        Picker("Category", selection: $selectedCategory) {
                            ForEach(ItemCategory.allCases, id: \.self) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    // Atributos con sliders
                    VStack(alignment: .leading, spacing: 16) {
                        SliderInputView(title: "Attack Damage (AD)", value: $attackDamage)
                        SliderInputView(title: "Ability Power (AP)", value: $abilityPower)
                        SliderInputView(title: "Armor (AR)", value: $armor)
                        SliderInputView(title: "Magic Resist (MR)", value: $magicResist)
                    }
                }
                .padding()
            }
            .navigationTitle("Add New Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Botón "Add" en la barra de herramientas
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
                    message: Text("Item '\(itemName)' added to \(selectedCategory.rawValue)!"),
                    dismissButton: .default(Text("OK")) {
                        presentationMode.wrappedValue.dismiss()
                    }
                )
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Forzar comportamiento de pantalla completa
    }

    private func createNewItem() {
        guard !itemName.isEmpty else {
            // Manejo de error si el nombre está vacío
            showAlert = true
            return
        }
        // Aquí puedes añadir la lógica para guardar el ítem en la categoría seleccionada
        showAlert = true
    }
}
    
    struct SliderInputView: View {
        var title: String
        @Binding var value: Double

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(title): \(Int(value))")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Slider(value: $value, in: 0...100, step: 1)
                    .accentColor(.blue)
            }
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
        }
    }


#Preview {
    ItemsView()
}
