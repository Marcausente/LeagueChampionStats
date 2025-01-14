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
            Item(name: "Tomo de Amplificación", category: .Basic, attackDamage: 0, abilityPower: 20, armor: 0, magicResist: 0),
            Item(name: "Espada B. F.", category: .Basic, attackDamage: 45, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Varita Explosiva", category: .Basic, attackDamage: 0, abilityPower: 40, armor: 0, magicResist: 0),
            Item(name: "Capa de Agilidad", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 20),
            Item(name: "Armadura de Tela", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 10, magicResist: 0),
            Item(name: "Daga", category: .Basic, attackDamage: 12, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Encanto de Hada", category: .Basic, attackDamage: 0, abilityPower: 9, armor: 0, magicResist: 0),
            Item(name: "Motita Resplandeciente", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 30),
            Item(name: "Espada Larga", category: .Basic, attackDamage: 10, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Bastón Grande Innecesario", category: .Basic, attackDamage: 0, abilityPower: 60, armor: 0, magicResist: 0),
            Item(name: "Manto Antimágico", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 25),
            Item(name: "Pico", category: .Basic, attackDamage: 25, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Báculo de Rejuvenecimiento", category: .Basic, attackDamage: 0, abilityPower: 10, armor: 0, magicResist: 0),
            Item(name: "Cristal Rubí", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 50),
            Item(name: "Cristal Zafiro", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 50)
        ]
        
        epicItems = [
            Item(name: "Égida de la Legión", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 30, magicResist: 30),
            Item(name: "Susurro Etéreo", category: .Epic, attackDamage: 0, abilityPower: 30, armor: 0, magicResist: 0),
            Item(name: "Ceniza de Bami", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Espejo de Bandleglass", category: .Epic, attackDamage: 0, abilityPower: 25, armor: 0, magicResist: 0),
            Item(name: "Joya Lacerante", category: .Epic, attackDamage: 0, abilityPower: 25, armor: 0, magicResist: 0),
            Item(name: "Chaleco de Zarzas", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 30, magicResist: 0),
            Item(name: "Catalizador de Eones", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Martillo de Caulfield", category: .Epic, attackDamage: 25, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Cota de Malla", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 40, magicResist: 0),
            Item(name: "Brazalete Cristalino", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 100),
            Item(name: "Llamado del Verdugo", category: .Epic, attackDamage: 15, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Cenizas Fatídicas", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Códice Diabólico", category: .Epic, attackDamage: 0, abilityPower: 30, armor: 0, magicResist: 0),
            Item(name: "Ídolo Prohibido", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Cinturón del Gigante", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Hebilla Glacial", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 20, magicResist: 0),
            Item(name: "Guisa Embrujada", category: .Epic, attackDamage: 0, abilityPower: 25, armor: 0, magicResist: 0),
            Item(name: "Hacha Vínculo Vital", category: .Epic, attackDamage: 20, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Bebedor Hexdrinker", category: .Epic, attackDamage: 25, abilityPower: 0, armor: 0, magicResist: 35),
            Item(name: "Alternador Hextech", category: .Epic, attackDamage: 0, abilityPower: 35, armor: 0, magicResist: 0),
            Item(name: "Gema Ardiente", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 200),
            Item(name: "Último Suspiro", category: .Epic, attackDamage: 20, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Capítulo Perdido", category: .Epic, attackDamage: 0, abilityPower: 40, armor: 0, magicResist: 0),
            Item(name: "Manto Negatron", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 50),
            Item(name: "Vibrador Nocturno", category: .Epic, attackDamage: 40, abilityPower: 0, armor: 0, magicResist: 0),
        ]
    
        legendaryItems = [
            Item(name: "Máscara Abisal", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 30, magicResist: 60),
            Item(name: "Cadenas de Anatema", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 40, magicResist: 0),
            Item(name: "Báculo del Arcángel", category: .Legendary, attackDamage: 0, abilityPower: 70, armor: 0, magicResist: 0),
            Item(name: "Incensario Ardiente", category: .Legendary, attackDamage: 0, abilityPower: 50, armor: 0, magicResist: 0),
            Item(name: "Juicio de Atma", category: .Legendary, attackDamage: 25, abilityPower: 0, armor: 40, magicResist: 0),
            Item(name: "Arco de Axioma", category: .Legendary, attackDamage: 50, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Velo de la Banshee", category: .Legendary, attackDamage: 0, abilityPower: 65, armor: 0, magicResist: 45),
            Item(name: "La Cuchilla Negra", category: .Legendary, attackDamage: 40, abilityPower: 0, armor: 30, magicResist: 0),
            Item(name: "Antorcha de Fuego Negro", category: .Legendary, attackDamage: 0, abilityPower: 75, armor: 0, magicResist: 0),
            Item(name: "Espada del Rey Arruinado", category: .Legendary, attackDamage: 40, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Maldición del Sediento de Sangre", category: .Legendary, attackDamage: 60, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Canto de Sangre", category: .Legendary, attackDamage: 55, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Sed de Sangre", category: .Legendary, attackDamage: 50, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Botín de Mundos", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Oposición Celestial", category: .Legendary, attackDamage: 0, abilityPower: 80, armor: 0, magicResist: 0),
            Item(name: "Espada Química", category: .Legendary, attackDamage: 55, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Putrefactor Quimtech", category: .Legendary, attackDamage: 0, abilityPower: 50, armor: 0, magicResist: 0),
            Item(name: "Impulso Cósmico", category: .Legendary, attackDamage: 0, abilityPower: 75, armor: 0, magicResist: 0),
            Item(name: "Flor de Cristal", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 50),
            Item(name: "Placa del Hombre Muerto", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 50, magicResist: 0),
            Item(name: "Danza de la Muerte", category: .Legendary, attackDamage: 65, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Ecos de Helia", category: .Legendary, attackDamage: 0, abilityPower: 65, armor: 0, magicResist: 0),
            Item(name: "Eclipse", category: .Legendary, attackDamage: 55, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Filo de la Noche", category: .Legendary, attackDamage: 60, abilityPower: 0, armor: 0, magicResist: 40),
            Item(name: "Reina de la Esencia", category: .Legendary, attackDamage: 70, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Corazón de Hielo", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 80, magicResist: 0),
            Item(name: "Ángel Guardián", category: .Legendary, attackDamage: 40, abilityPower: 0, armor: 30, magicResist: 0),
            Item(name: "Rencor de Serylda", category: .Legendary, attackDamage: 50, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Sombrero Mortal de Rabadon", category: .Legendary, attackDamage: 0, abilityPower: 120, armor: 0, magicResist: 0),
            Item(name: "Hidra Titánica", category: .Legendary, attackDamage: 50, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Baluarte de la Eternidad", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 60, magicResist: 60),
            Item(name: "Cetro de Cristal de Rylai", category: .Legendary, attackDamage: 0, abilityPower: 90, armor: 0, magicResist: 0),
            Item(name: "Báculo de las Eras", category: .Legendary, attackDamage: 0, abilityPower: 80, armor: 0, magicResist: 0),
            Item(name: "Huracán de Runaan", category: .Legendary, attackDamage: 40, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Abrazar de Seraph", category: .Legendary, attackDamage: 0, abilityPower: 70, armor: 0, magicResist: 0),
            Item(name: "Colmillo de Serpiente", category: .Legendary, attackDamage: 50, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Sombras Gemelas", category: .Legendary, attackDamage: 0, abilityPower: 65, armor: 0, magicResist: 0),
            Item(name: "Llama Umbría", category: .Legendary, attackDamage: 0, abilityPower: 100, armor: 0, magicResist: 0),
            Item(name: "Canción de Batalla de Shurelya", category: .Legendary, attackDamage: 0, abilityPower: 40, armor: 0, magicResist: 0),
            Item(name: "Rencor de Serylda", category: .Legendary, attackDamage: 45, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Hidra Voraz", category: .Legendary, attackDamage: 65, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Mano de la Justicia", category: .Legendary, attackDamage: 25, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Capucha Ardiente", category: .Legendary, attackDamage: 0, abilityPower: 80, armor: 0, magicResist: 0),
            Item(name: "Promesa Silenciosa", category: .Legendary, attackDamage: 50, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Reloj de Arena de Zhonya", category: .Legendary, attackDamage: 0, abilityPower: 65, armor: 0, magicResist: 0),
            Item(name: "Filo Infinito", category: .Legendary, attackDamage: 80, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Mandato Imperial", category: .Legendary, attackDamage: 0, abilityPower: 60, armor: 0, magicResist: 0),
            Item(name: "Escudo Inmortal", category: .Legendary, attackDamage: 50, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Hidra Voraz", category: .Legendary, attackDamage: 65, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Rompe Cascos", category: .Legendary, attackDamage: 40, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Cañón de Fuego Rápido", category: .Legendary, attackDamage: 40, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Hidra Profana", category: .Legendary, attackDamage: 80, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Arco Escarchado", category: .Legendary, attackDamage: 30, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Luz del Alba", category: .Legendary, attackDamage: 0, abilityPower: 100, armor: 0, magicResist: 0),
            Item(name: "Martillo de la Eternidad", category: .Legendary, attackDamage: 50, abilityPower: 0, armor: 30, magicResist: 0),
            Item(name: "Guja Sombría", category: .Legendary, attackDamage: 55, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Promesa Vigilante", category: .Legendary, attackDamage: 0, abilityPower: 40, armor: 0, magicResist: 0),
            Item(name: "Báculo del Vacío", category: .Legendary, attackDamage: 0, abilityPower: 70, armor: 0, magicResist: 0),
            Item(name: "Espada Ciclónica Voltáica", category: .Legendary, attackDamage: 45, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Armadura de Warmog", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Enfoque del Horizonte", category: .Legendary, attackDamage: 0, abilityPower: 115, armor: 0, magicResist: 0),
            Item(name: "Guantelete de Hielo Perenne", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 65, magicResist: 0),
            Item(name: "Bailarín Fantasma", category: .Legendary, attackDamage: 30, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Mandato Imperial", category: .Legendary, attackDamage: 0, abilityPower: 60, armor: 0, magicResist: 0),
            Item(name: "Cetro Abisal", category: .Legendary, attackDamage: 0, abilityPower: 70, armor: 0, magicResist: 45),
            Item(name: "Cadena de Anathema", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 30, magicResist: 60),
            Item(name: "Báculo Arcángel", category: .Legendary, attackDamage: 0, abilityPower: 60, armor: 0, magicResist: 0),
            Item(name: "Corazón de Acero", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 40, magicResist: 0),
            Item(name: "Ángel Guardián", category: .Legendary, attackDamage: 40, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Filo del Infinito", category: .Legendary, attackDamage: 70, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Beso de la Muerte", category: .Legendary, attackDamage: 40, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Guantelete del Infinito", category: .Legendary, attackDamage: 50, abilityPower: 0, armor: 25, magicResist: 0),
            Item(name: "Runa de Ruina", category: .Legendary, attackDamage: 0, abilityPower: 100, armor: 0, magicResist: 0),
            Item(name: "Espada del Rey Arruinado", category: .Legendary, attackDamage: 40, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Llave del Profano", category: .Legendary, attackDamage: 45, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Cetro Maldito", category: .Legendary, attackDamage: 0, abilityPower: 80, armor: 0, magicResist: 0),
            Item(name: "Guja de Guinsoo", category: .Legendary, attackDamage: 40, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Amanecer Celestial", category: .Legendary, attackDamage: 0, abilityPower: 100, armor: 0, magicResist: 0),
            Item(name: "Hidra Titanica", category: .Legendary, attackDamage: 60, abilityPower: 0, armor: 0, magicResist: 0)
        ]
        
        utilityItems = [
            Item(name: "Jugo Cappa", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Guardián de Control", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Elixir de Avaricia", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Elixir de Fuerza", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Elixir de Hierro", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Elixir de Habilidad", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Elixir de Brujería", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Elixir de Ira", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Ojo del Heraldo", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Poción de Vida", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Poro-Snax", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Poción Reutilizable", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Galleta Total de Voluntad Eterna", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Tu Parte", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0)
        ]
        bootsItems = [
            Item(name: "Grebas del Berserker", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Botas de Rapidez", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Botas Jonias de Lucidez", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Pisadas de Mercurio", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Chaleco de Acero Platinado", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Zapatos del Hechicero", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Suelas Simbióticas", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Botas", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0),
            Item(name: "Botas Ligeramente Mágicas", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0)
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
