import SwiftUI

struct MagesView: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1)
                .ignoresSafeArea()
            VStack {
                Text("Mages")
                    .font(.largeTitle)
                    .padding()
                Spacer()
                // Aquí puedes añadir más contenido relacionado con Mages
                Text("Esta es la página de Mages.")
                    .font(.body)
                    .padding()
                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Mages")
                    .font(.headline)
            }
        }
    }
}

#Preview {
    MagesView()
}
