import SwiftUI

// Modelo de un ítem
struct Item: Identifiable {
    let id = UUID()
    let name: String
    let category: ItemCategory
    let attackDamage: Double
    let abilityPower: Double
    let armor: Double
    let magicResist: Double
}

// Clase para manejar ítems en diferentes categorías
class ItemStore: ObservableObject {
    @Published var starterItems: [Item] = []
    @Published var basicItems: [Item] = []
    @Published var epicItems: [Item] = []
    @Published var utilityItems: [Item] = []
    @Published var legendaryItems: [Item] = []
    @Published var bootsItems: [Item] = []
    
    init() {
        // Agregar los ítems predefinidos de Starter al iniciar
        starterItems = [
            Item(name: "Lanza Negra", category: .Starter, attackDamage: 10, abilityPower: 0, armor: 5, magicResist: 0),
            Item(name: "Guadaña", category: .Starter, attackDamage: 15, abilityPower: 0, armor: 10, magicResist: 0),
            Item(name: "Sello Oscuro", category: .Starter, attackDamage: 5, abilityPower: 10, armor: 0, magicResist: 5),
            Item(name: "Espada de Doran", category: .Starter, attackDamage: 15, abilityPower: 0, armor: 5, magicResist: 0),
            Item(name: "Anillo de Doran", category: .Starter, attackDamage: 0, abilityPower: 20, armor: 0, magicResist: 5),
            Item(name: "Escudo de Doran", category: .Starter, attackDamage: 0, abilityPower: 0, armor: 20, magicResist: 0),
            Item(name: "Amuleto del Guardián", category: .Starter, attackDamage: 5, abilityPower: 5, armor: 5, magicResist: 5),
            Item(name: "Espada del Guardián", category: .Starter, attackDamage: 20, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Daga del Guardián", category: .Starter, attackDamage: 10, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Martillo del Guardián", category: .Starter, attackDamage: 15, abilityPower: 0, armor: 10, magicResist: 0),
            Item(name: "Cuerno del Guardián", category: .Starter, attackDamage: 5, abilityPower: 5, armor: 0, magicResist: 10),
            Item(name: "Orbe del Guardián", category: .Starter, attackDamage: 0, abilityPower: 10, armor: 5, magicResist: 5),
            Item(name: "Sudario del Guardián", category: .Starter, attackDamage: 0, abilityPower: 0, armor: 10, magicResist: 15),
            Item(name: "Cría Caminaviento", category: .Starter, attackDamage: 0, abilityPower: 10, armor: 0, magicResist: 0),
            Item(name: "Brotes de Mosstomper", category: .Starter, attackDamage: 0, abilityPower: 0, armor: 10, magicResist: 0),
            Item(name: "Cachorro Escamador", category: .Starter, attackDamage: 5, abilityPower: 0, armor: 0, magicResist: 5),
            Item(name: "Lágrima de la Diosa", category: .Starter, attackDamage: 0, abilityPower: 20, armor: 0, magicResist: 0),
            Item(name: "Atlas Mundial", category: .Starter, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0)
        ]
        
        basicItems = [
                    Item(name: "Amplifying Tome", category: .Basic, attackDamage: 0, abilityPower: 20, armor: 0, magicResist: 0),
                    Item(name: "B. F. Sword", category: .Basic, attackDamage: 45, abilityPower: 0, armor: 0, magicResist: 0),
                    Item(name: "Blasting Wand", category: .Basic, attackDamage: 0, abilityPower: 40, armor: 0, magicResist: 0),
                    Item(name: "Cloak of Agility", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 20),
                    Item(name: "Cloth Armor", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 10, magicResist: 0),
                    Item(name: "Dagger", category: .Basic, attackDamage: 12, abilityPower: 0, armor: 0, magicResist: 0),
                    Item(name: "Faerie Charm", category: .Basic, attackDamage: 0, abilityPower: 9, armor: 0, magicResist: 0),
                    Item(name: "Glowing Mote", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 30),
                    Item(name: "Long Sword", category: .Basic, attackDamage: 10, abilityPower: 0, armor: 0, magicResist: 0),
                    Item(name: "Needlessly Large Rod", category: .Basic, attackDamage: 0, abilityPower: 60, armor: 0, magicResist: 0),
                    Item(name: "Null-Magic Mantle", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 25),
                    Item(name: "Pickaxe", category: .Basic, attackDamage: 25, abilityPower: 0, armor: 0, magicResist: 0),
                    Item(name: "Rejuvenation Bead", category: .Basic, attackDamage: 0, abilityPower: 10, armor: 0, magicResist: 0),
                    Item(name: "Ruby Crystal", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 50),
                    Item(name: "Sapphire Crystal", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 50)
                ]
    }
    
    func addItem(_ item: Item) {
        switch item.category {
        case .Starter:
            starterItems.append(item)
        case .Basic:
            basicItems.append(item)
        case .Epic:
            epicItems.append(item)
        case .Utility:
            utilityItems.append(item)
        case .Legendary:
            legendaryItems.append(item)
        case .Boots:
            bootsItems.append(item)
        }
    }
}

struct ItemsView: View {
    @StateObject private var itemStore = ItemStore() // Estado compartido
    @State private var showAddItemView = false  // Para controlar la presentación del formulario
    
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
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showAddItemView = true
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                }
            }
            .sheet(isPresented: $showAddItemView) {
                AddNewItems(itemStore: itemStore)
                    .presentationDetents([.large]) // Forzar pantalla completa en iPad
            }
        }
    }
    
    @ViewBuilder
    func destination(for category: ItemCategory) -> some View {
        switch category {
        case .Starter:
            ItemListView(title: "Starter Items", items: itemStore.starterItems)
        case .Basic:
            ItemListView(title: "Basic Items", items: itemStore.basicItems)
        case .Epic:
            ItemListView(title: "Epic Items", items: itemStore.epicItems)
        case .Legendary:
            ItemListView(title: "Legendary Items", items: itemStore.legendaryItems)
        case .Utility:
            ItemListView(title: "Utility Items", items: itemStore.utilityItems)
        case .Boots:
            ItemListView(title: "Boots Items", items: itemStore.bootsItems)
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
    @ObservedObject var itemStore: ItemStore // Observado para actualizar el estado compartido
    
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
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Item Name")
                            .font(.headline)
                        TextField("Enter item name", text: $itemName)
                            .padding()
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                    }

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

                    VStack(spacing: 16) {
                        SliderInputView(title: "Attack Damage (AD)", value: $attackDamage)
                        SliderInputView(title: "Ability Power (AP)", value: $abilityPower)
                        SliderInputView(title: "Armor (AR)", value: $armor)
                        SliderInputView(title: "Magic Resist (MR)", value: $magicResist)
                    }
                }
                .padding()
            }
            .navigationTitle("Add New Item")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        addItem()
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Item Added"),
                    message: Text("Item '\(itemName)' added to \(selectedCategory.rawValue)"),
                    dismissButton: .default(Text("OK")) {
                        presentationMode.wrappedValue.dismiss()
                    }
                )
            }
        }
    }

    private func addItem() {
        guard !itemName.isEmpty else { return }
        
        let newItem = Item(
            name: itemName,
            category: selectedCategory,
            attackDamage: attackDamage,
            abilityPower: abilityPower,
            armor: armor,
            magicResist: magicResist
        )
        
        itemStore.addItem(newItem)
        showAlert = true
    }
}

struct ItemListView: View {
    let title: String
    let items: [Item]

    var body: some View {
        List(items) { item in
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("Attack Damage: \(item.attackDamage), Ability Power: \(item.abilityPower), Armor: \(item.armor), Magic Resist: \(item.magicResist)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle(title)
    }
}

struct SliderInputView: View {
    var title: String
    @Binding var value: Double

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            Slider(value: $value, in: 0...100, step: 1)
            Text("\(Int(value))")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ItemsView()
}
