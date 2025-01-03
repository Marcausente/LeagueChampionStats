import SwiftUI

class ItemsModel: ObservableObject {
    @Published var items: [String] = [] // Lista de nombres de ítems
}
