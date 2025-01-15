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
    let price: Double
    let background: String
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
            Item(name: "Lanza Negra", category: .Starter, attackDamage: 10, abilityPower: 0, armor: 5, magicResist: 0, price: 450, background: "A simple weapon designed for early game combat."),
            Item(name: "Guadaña", category: .Starter, attackDamage: 15, abilityPower: 0, armor: 10, magicResist: 0, price: 800, background: "A weapon made for early combat with a balance of attack and defense."),
            Item(name: "Sello Oscuro", category: .Starter, attackDamage: 5, abilityPower: 10, armor: 0, magicResist: 5, price: 400, background: "A dark relic offering magic power and some resistance."),
            Item(name: "Espada de Doran", category: .Starter, attackDamage: 15, abilityPower: 0, armor: 5, magicResist: 0, price: 450, background: "A standard item for early game damage and sustainability."),
            Item(name: "Anillo de Doran", category: .Starter, attackDamage: 0, abilityPower: 20, armor: 0, magicResist: 5, price: 400, background: "A starting item for mages with magic power and some resistances."),
            Item(name: "Escudo de Doran", category: .Starter, attackDamage: 0, abilityPower: 0, armor: 20, magicResist: 0, price: 450, background: "A defensive item that grants additional durability."),
            Item(name: "Amuleto del Guardián", category: .Starter, attackDamage: 5, abilityPower: 5, armor: 5, magicResist: 5, price: 500, background: "An all-around amulet for both offense and defense."),
            Item(name: "Espada del Guardián", category: .Starter, attackDamage: 20, abilityPower: 0, armor: 0, magicResist: 0, price: 400, background: "A simple sword with a decent amount of attack damage."),
            Item(name: "Daga del Guardián", category: .Starter, attackDamage: 10, abilityPower: 0, armor: 0, magicResist: 0, price: 350, background: "A fast weapon for quick attacks with moderate damage."),
            Item(name: "Martillo del Guardián", category: .Starter, attackDamage: 15, abilityPower: 0, armor: 10, magicResist: 0, price: 500, background: "A hammer offering a mix of attack power and defense."),
            Item(name: "Cuerno del Guardián", category: .Starter, attackDamage: 5, abilityPower: 5, armor: 0, magicResist: 10, price: 450, background: "A horn that increases your magical defenses and offers some offense."),
            Item(name: "Orbe del Guardián", category: .Starter, attackDamage: 0, abilityPower: 10, armor: 5, magicResist: 5, price: 400, background: "An orb offering increased magical damage and some defense."),
            Item(name: "Sudario del Guardián", category: .Starter, attackDamage: 0, abilityPower: 0, armor: 10, magicResist: 15, price: 450, background: "A cloth providing a significant boost to magical resistances."),
            Item(name: "Cría Caminaviento", category: .Starter, attackDamage: 0, abilityPower: 10, armor: 0, magicResist: 0, price: 300, background: "A small creature that gives a little boost to your magical power."),
            Item(name: "Brotes de Mosstomper", category: .Starter, attackDamage: 0, abilityPower: 0, armor: 10, magicResist: 0, price: 300, background: "A starter item that enhances your defense early on."),
            Item(name: "Cachorro Escamador", category: .Starter, attackDamage: 5, abilityPower: 0, armor: 0, magicResist: 5, price: 350, background: "A companion that offers a balance of offense and defense."),
            Item(name: "Lágrima de la Diosa", category: .Starter, attackDamage: 0, abilityPower: 20, armor: 0, magicResist: 0, price: 400, background: "An item for mages that increases mana over time and grants some ability power."),
            Item(name: "Atlas Mundial", category: .Starter, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 0, background: "An unremarkable item with no apparent effect.")
        ]
        
        basicItems = [
            Item(name: "Tomo de Amplificación", category: .Basic, attackDamage: 0, abilityPower: 20, armor: 0, magicResist: 0, price: 400, background: "A book containing magical knowledge that boosts ability power."),
            Item(name: "Espada B. F.", category: .Basic, attackDamage: 45, abilityPower: 0, armor: 0, magicResist: 0, price: 1700, background: "A powerful weapon that significantly boosts attack damage."),
            Item(name: "Varita Explosiva", category: .Basic, attackDamage: 0, abilityPower: 40, armor: 0, magicResist: 0, price: 1250, background: "A magical stick that increases your ability power."),
            Item(name: "Capa de Agilidad", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 20, price: 650, background: "A cape that increases your resistance to magic."),
            Item(name: "Armadura de Tela", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 10, magicResist: 0, price: 200, background: "A basic armor that provides some physical defense."),
            Item(name: "Daga", category: .Basic, attackDamage: 12, abilityPower: 0, armor: 0, magicResist: 0, price: 400, background: "A small dagger designed for fast attacks."),
            Item(name: "Encanto de Hada", category: .Basic, attackDamage: 0, abilityPower: 9, armor: 0, magicResist: 0, price: 400, background: "A charm that boosts your magical power."),
            Item(name: "Motita Resplandeciente", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 30, price: 800, background: "A small glowing object that grants substantial magical resist."),
            Item(name: "Espada Larga", category: .Basic, attackDamage: 10, abilityPower: 0, armor: 0, magicResist: 0, price: 350, background: "A long sword that increases attack damage."),
            Item(name: "Bastón Grande Innecesario", category: .Basic, attackDamage: 0, abilityPower: 60, armor: 0, magicResist: 0, price: 1200, background: "A large stick that grants a significant boost to ability power."),
            Item(name: "Manto Antimágico", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 25, price: 800, background: "A cloak that offers substantial protection against magical attacks."),
            Item(name: "Pico", category: .Basic, attackDamage: 25, abilityPower: 0, armor: 0, magicResist: 0, price: 1000, background: "A sharp object that boosts attack damage."),
            Item(name: "Báculo de Rejuvenecimiento", category: .Basic, attackDamage: 0, abilityPower: 10, armor: 0, magicResist: 0, price: 800, background: "A staff that restores health over time and increases ability power."),
            Item(name: "Cristal Rubí", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 50, price: 1000, background: "A rare crystal that provides strong magical resistance."),
            Item(name: "Cristal Zafiro", category: .Basic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 50, price: 1000, background: "A blue crystal that grants high resistance to magic.")
        ]

        
        epicItems = [
            Item(name: "Égida de la Legión", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 30, magicResist: 30, price: 2900, background: "A legendary shield that provides both armor and magic resist, perfect for tanks in the late game."),
            Item(name: "Susurro Etéreo", category: .Epic, attackDamage: 0, abilityPower: 30, armor: 0, magicResist: 0, price: 2500, background: "An item that grants a large boost in ability power, perfect for mages focused on magic damage."),
            Item(name: "Ceniza de Bami", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 1200, background: "A powerful item for jungle champions, providing health regeneration and area-of-effect damage."),
            Item(name: "Espejo de Bandleglass", category: .Epic, attackDamage: 0, abilityPower: 25, armor: 0, magicResist: 0, price: 2300, background: "An item that grants additional ability power, with a passive effect that increases your damage against enemies with low health."),
            Item(name: "Joya Lacerante", category: .Epic, attackDamage: 0, abilityPower: 25, armor: 0, magicResist: 0, price: 2500, background: "An item providing significant ability power and an increased chance to critically strike with abilities."),
            Item(name: "Chaleco de Zarzas", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 30, magicResist: 0, price: 2700, background: "A vest that grants armor and reflects damage to attackers, perfect for tanky champions."),
            Item(name: "Catalizador de Eones", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 800, background: "An item that provides health regeneration and mana sustain, commonly built into other items for mages."),
            Item(name: "Martillo de Caulfield", category: .Epic, attackDamage: 25, abilityPower: 0, armor: 0, magicResist: 0, price: 1300, background: "A hammer that enhances attack damage, commonly built into other items for AD champions."),
            Item(name: "Cota de Malla", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 40, magicResist: 0, price: 1000, background: "A heavy armor item that provides strong protection against physical attacks."),
            Item(name: "Brazalete Cristalino", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 100, price: 2800, background: "An item that grants massive magic resistance, ideal for countering AP champions."),
            Item(name: "Llamado del Verdugo", category: .Epic, attackDamage: 15, abilityPower: 0, armor: 0, magicResist: 0, price: 1500, background: "A weapon that boosts attack damage and has an additional effect that works against tanky champions."),
            Item(name: "Cenizas Fatídicas", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 500, background: "An item that enhances ability power and grants the wearer additional sustain."),
            Item(name: "Códice Diabólico", category: .Epic, attackDamage: 0, abilityPower: 30, armor: 0, magicResist: 0, price: 2000, background: "A cursed codex that amplifies magic damage and provides a burst of power during fights."),
            Item(name: "Ídolo Prohibido", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 600, background: "An item that provides both health regeneration and magical energy, useful for sustaining in combat."),
            Item(name: "Cinturón del Gigante", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 950, background: "A utility item that increases health and provides an increase in movement speed, making it ideal for tanks."),
            Item(name: "Hebilla Glacial", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 20, magicResist: 0, price: 1200, background: "A belt that grants some armor and slows nearby enemies, ideal for crowd control."),
            Item(name: "Guisa Embrujada", category: .Epic, attackDamage: 0, abilityPower: 25, armor: 0, magicResist: 0, price: 2200, background: "A robe that increases magic power while providing the ability to cause enemy debuffs."),
            Item(name: "Hacha Vínculo Vital", category: .Epic, attackDamage: 20, abilityPower: 0, armor: 0, magicResist: 0, price: 2500, background: "A weapon that grants additional attack damage and life steal, perfect for AD champions."),
            Item(name: "Bebedor Hexdrinker", category: .Epic, attackDamage: 25, abilityPower: 0, armor: 0, magicResist: 35, price: 2700, background: "An item that grants attack damage and a shield against magic, offering a balance of offense and defense."),
            Item(name: "Alternador Hextech", category: .Epic, attackDamage: 0, abilityPower: 35, armor: 0, magicResist: 0, price: 2500, background: "A magical device that enhances ability power and grants the user a powerful active ability."),
            Item(name: "Gema Ardiente", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 200, price: 3000, background: "A rare gem that grants immense magic resist, perfect for surviving against magic-heavy teams."),
            Item(name: "Último Suspiro", category: .Epic, attackDamage: 20, abilityPower: 0, armor: 0, magicResist: 0, price: 2300, background: "A weapon that increases critical strike chance and damage, ideal for assassin and marksman builds."),
            Item(name: "Capítulo Perdido", category: .Epic, attackDamage: 0, abilityPower: 40, armor: 0, magicResist: 0, price: 2800, background: "A powerful book that grants significant ability power, commonly built into mages."),
            Item(name: "Manto Negatron", category: .Epic, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 50, price: 1200, background: "A cloak that grants strong magic resist and is often built into other defensive items."),
            Item(name: "Vibrador Nocturno", category: .Epic, attackDamage: 40, abilityPower: 0, armor: 0, magicResist: 0, price: 2600, background: "A powerful weapon that grants high attack damage and a unique passive to increase attacks' speed.")
        ]
        
        legendaryItems = [
            Item(name: "Máscara Abisal", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 30, magicResist: 60, price: 3200, background: "A mask of great power that absorbs the life essence of enemies."),
            Item(name: "Cadenas de Anatema", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 40, magicResist: 0, price: 2700, background: "Chains that bind the enemy, cursing them with their own suffering."),
            Item(name: "Báculo del Arcángel", category: .Legendary, attackDamage: 0, abilityPower: 70, armor: 0, magicResist: 0, price: 3000, background: "A staff imbued with celestial power that grows in strength with every spell cast."),
            Item(name: "Incensario Ardiente", category: .Legendary, attackDamage: 0, abilityPower: 50, armor: 0, magicResist: 0, price: 2800, background: "A burning incense that fuels the user's magical power, granting immense ability power."),
            Item(name: "Juicio de Atma", category: .Legendary, attackDamage: 25, abilityPower: 0, armor: 40, magicResist: 0, price: 2800, background: "Atma's judgment grants immense strength through armor and raw attack damage."),
            Item(name: "Arco de Axioma", category: .Legendary, attackDamage: 50, abilityPower: 0, armor: 0, magicResist: 0, price: 3400, background: "An arc that amplifies the user's damage, cutting through the battlefield with precision."),
            Item(name: "Velo de la Banshee", category: .Legendary, attackDamage: 0, abilityPower: 65, armor: 0, magicResist: 45, price: 3000, background: "A mystical veil that shields the user from harmful spells."),
            Item(name: "La Cuchilla Negra", category: .Legendary, attackDamage: 40, abilityPower: 0, armor: 30, magicResist: 0, price: 3200, background: "A dark blade that strikes fear into the hearts of enemies."),
            Item(name: "Antorcha de Fuego Negro", category: .Legendary, attackDamage: 0, abilityPower: 75, armor: 0, magicResist: 0, price: 3200, background: "A torch fueled by black fire, igniting the user's magic with overwhelming force."),
            Item(name: "Espada del Rey Arruinado", category: .Legendary, attackDamage: 40, abilityPower: 0, armor: 0, magicResist: 0, price: 3500, background: "The Ruined King's blade, cursed to drain the life force of its victims."),
            Item(name: "Maldición del Sediento de Sangre", category: .Legendary, attackDamage: 60, abilityPower: 0, armor: 0, magicResist: 0, price: 3200, background: "A cursed blade that grants its wielder strength at the cost of their soul."),
            Item(name: "Canto de Sangre", category: .Legendary, attackDamage: 55, abilityPower: 0, armor: 0, magicResist: 0, price: 3200, background: "The song of blood, a melody that empowers the user in battle."),
            Item(name: "Sed de Sangre", category: .Legendary, attackDamage: 50, abilityPower: 0, armor: 0, magicResist: 0, price: 3300, background: "A thirst that can only be quenched by battle, increasing attack power with each strike."),
            Item(name: "Botín de Mundos", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 3500, background: "A relic from forgotten worlds, granting the user unimaginable power."),
            Item(name: "Oposición Celestial", category: .Legendary, attackDamage: 0, abilityPower: 80, armor: 0, magicResist: 0, price: 3200, background: "A celestial artifact that imbues the user with divine magic."),
            Item(name: "Espada Química", category: .Legendary, attackDamage: 55, abilityPower: 0, armor: 0, magicResist: 0, price: 3400, background: "A sword enhanced with chemical properties, amplifying the user's attack power."),
            Item(name: "Putrefactor Quimtech", category: .Legendary, attackDamage: 0, abilityPower: 50, armor: 0, magicResist: 0, price: 3000, background: "A device that corrupts the surroundings, empowering the user with raw magic."),
            Item(name: "Impulso Cósmico", category: .Legendary, attackDamage: 0, abilityPower: 75, armor: 0, magicResist: 0, price: 3100, background: "A cosmic surge that enhances the user's ability power to celestial heights."),
            Item(name: "Flor de Cristal", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 50, price: 3200, background: "A rare flower that protects the user with powerful magic resistance."),
            Item(name: "Placa del Hombre Muerto", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 50, magicResist: 0, price: 3000, background: "A plate of armor forged to withstand the greatest of forces."),
            Item(name: "Danza de la Muerte", category: .Legendary, attackDamage: 65, abilityPower: 0, armor: 0, magicResist: 0, price: 3200, background: "A deadly dance that grants the wielder incredible offensive power."),
            Item(name: "Ecos de Helia", category: .Legendary, attackDamage: 0, abilityPower: 65, armor: 0, magicResist: 0, price: 3000, background: "Echoes from another world, amplifying the user's magical abilities."),
            Item(name: "Eclipse", category: .Legendary, attackDamage: 55, abilityPower: 0, armor: 0, magicResist: 0, price: 3300, background: "A blade that eclipses the light, cutting through enemies with unmatched speed."),
            Item(name: "Filo de la Noche", category: .Legendary, attackDamage: 60, abilityPower: 0, armor: 0, magicResist: 40, price: 3400, background: "A sword that absorbs the darkness, giving its wielder resistance and power."),
            Item(name: "Reina de la Esencia", category: .Legendary, attackDamage: 70, abilityPower: 0, armor: 0, magicResist: 0, price: 3500, background: "The Queen's essence flows through the blade, empowering the user with unmatched attack damage."),
            Item(name: "Corazón de Hielo", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 80, magicResist: 0, price: 3300, background: "A heart of pure ice, granting its user immense armor and defensive strength."),
            Item(name: "Ángel Guardián", category: .Legendary, attackDamage: 40, abilityPower: 0, armor: 30, magicResist: 0, price: 3000, background: "A guardian's blessing, resurrecting the user upon death and increasing their defense."),
            Item(name: "Rencor de Serylda", category: .Legendary, attackDamage: 50, abilityPower: 0, armor: 0, magicResist: 0, price: 3300, background: "A blade filled with vengeance, giving the wielder unmatched attack power."),
            Item(name: "Sombrero Mortal de Rabadon", category: .Legendary, attackDamage: 0, abilityPower: 120, armor: 0, magicResist: 0, price: 3800, background: "Rabadon's deathly hat enhances magical abilities to their fullest extent."),
            Item(name: "Hidra Titánica", category: .Legendary, attackDamage: 50, abilityPower: 0, armor: 0, magicResist: 0, price: 3400, background: "A titan's hydra that empowers the user with massive physical strength."),
            Item(name: "Baluarte de la Eternidad", category: .Legendary, attackDamage: 0, abilityPower: 0, armor: 60, magicResist: 60, price: 3400, background: "A bulwark that grants immense protection and resistance against both magic and physical attacks."),
            Item(name: "Cetro de Cristal de Rylai", category: .Legendary, attackDamage: 0, abilityPower: 90, armor: 0, magicResist: 0, price: 3200, background: "A crystal scepter imbued with the power to freeze enemies in place."),
            Item(name: "Báculo de las Eras", category: .Legendary, attackDamage: 0, abilityPower: 80, armor: 0, magicResist: 0, price: 3300, background: "A staff that harnesses the power of ages to amplify the user's magical might."),
            Item(name: "Huracán de Runaan", category: .Legendary, attackDamage: 40, abilityPower: 0, armor: 0, magicResist: 0, price: 3200, background: "An item that unleashes a storm of arrows, devastating all in its path."),
            Item(name: "Abrazar de Seraph", category: .Legendary, attackDamage: 0, abilityPower: 70, armor: 0, magicResist: 0, price: 3200, background: "An embrace of Seraph, granting the user exceptional power and magical resistance."),
            Item(name: "Colmillo de Serpiente", category: .Legendary, attackDamage: 50, abilityPower: 0, armor: 0, magicResist: 0, price: 3400, background: "A serpent's fang that delivers a powerful strike, leaving a venomous wound."),
            Item(name: "Cáliz de la Serenidad", category: .Legendary, attackDamage: 0, abilityPower: 70, armor: 0, magicResist: 0, price: 3100, background: "A chalice of serenity, granting peace of mind and substantial magical power."),
        ]
        
        utilityItems = [
            Item(name: "Jugo Cappa", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 500, background: "A refreshing juice that revitalizes the user."),
            Item(name: "Guardián de Control", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 600, background: "A device that grants temporary control over enemies' movements."),
            Item(name: "Elixir de Avaricia", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 800, background: "An elixir that increases the user's greed, boosting gold income."),
            Item(name: "Elixir de Fuerza", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 650, background: "A potion that increases the user's physical strength temporarily."),
            Item(name: "Elixir de Hierro", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 750, background: "An elixir that grants the user temporary resistance to damage."),
            Item(name: "Elixir de Habilidad", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 850, background: "A brew that enhances the user's ability power for a short duration."),
            Item(name: "Elixir de Brujería", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 900, background: "An elixir of dark magic, granting the user an extra boost in spellcasting power."),
            Item(name: "Elixir de Ira", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 1000, background: "An elixir that fills the user with rage, increasing attack damage temporarily."),
            Item(name: "Ojo del Heraldo", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 1200, background: "A mystical eye that reveals hidden traps and enemies."),
            Item(name: "Poción de Vida", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 400, background: "A simple health potion that restores a small amount of health."),
            Item(name: "Poro-Snax", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 300, background: "A snack for poros that grants a temporary buff to the user."),
            Item(name: "Poción Reutilizable", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 600, background: "A reusable potion that can be used multiple times to restore health."),
            Item(name: "Galleta Total de Voluntad Eterna", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 650, background: "A powerful cookie that provides a temporary boost to the user's resilience."),
            Item(name: "Tu Parte", category: .Utility, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 500, background: "A mysterious item that grants an additional buff when used by allies.")
        ]
        
        bootsItems = [
            Item(name: "Grebas del Berserker", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 700, background: "Boots designed for berserkers, increasing movement speed and attack speed."),
            Item(name: "Botas de Movilidad", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 750, background: "Boots that grant a significant movement speed boost."),
            Item(name: "Botas Jonias de Lucidez", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 800, background: "Boots that reduce cooldowns, making spells more accessible."),
            Item(name: "Botas de Mercurio", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 850, background: "Mercury boots that provide immunity to crowd control effects."),
            Item(name: "Punteras de Acero Revestido", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 700, background: "Steel-toed boots that provide extra armor against attacks."),
            Item(name: "Zapatos del Hechicero", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 800, background: "Wizard shoes that enhance the user's magical abilities."),
            Item(name: "Suelas Simbióticas", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 850, background: "Symbiotic soles that adapt to the user's environment, improving health regeneration."),
            Item(name: "Botas", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 500, background: "Basic boots providing minor movement speed."),
            Item(name: "Botas Ligeramente Mágicas", category: .Boots, attackDamage: 0, abilityPower: 0, armor: 0, magicResist: 0, price: 650, background: "Lightly enchanted boots that grant some magical protection and speed.")
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

struct ItemListView: View {
    let title: String
    let items: [Item]

    var body: some View {
        List(items) { item in
            NavigationLink(destination: ItemDetailView(item: item)) {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                        .fontWeight(.bold)
                
                    HStack {
                        Text("AD: \(Int(item.attackDamage))")
                            .foregroundColor(.orange)
                            .fontWeight(.bold)
                        Text("AP: \(Int(item.abilityPower))")
                            .foregroundColor(.purple)
                            .fontWeight(.bold)
                        Text("AR: \(Int(item.armor))")
                            .foregroundColor(.green)
                            .fontWeight(.bold)
                        Text("MR: \(Int(item.magicResist))")
                            .foregroundColor(.cyan)
                            .fontWeight(.bold)
                            
                    }
                }
            }
        }
        .navigationTitle(title)
    }
}

struct ItemDetailView: View {
    let item: Item

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(item.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                Text("Category: \(item.category.rawValue)")
                    .font(.headline)
                    .foregroundColor(.gray)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Stats:")
                        .font(.headline)
                        .foregroundColor(.black)

                    Group {
                        Text("Attack Damage: \(Int(item.attackDamage))")
                        Text("Ability Power: \(Int(item.abilityPower))")
                        Text("Armor: \(Int(item.armor))")
                        Text("Magic Resist: \(Int(item.magicResist))")
                    }
                    .font(.body)
                    .foregroundColor(.gray)
                }

                Text("Price: \(String(format: "%.2f", item.price)) Gold")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.top)

                Text("Background:")
                    .font(.headline)
                    .foregroundColor(.black)

                Text(item.background)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top, 8)
            }
            .padding()
            .frame(maxWidth: .infinity) // Asegura que el contenido se ajuste al ancho disponible
            .background(Color.white) // Fondo blanco para el contenido
            .cornerRadius(16) // Bordes redondeados
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2) // Sombra para el efecto visual
        }
        .navigationTitle("Detalles del Ítem")
        .navigationBarTitleDisplayMode(.inline) // Estilo compacto
        .background(Color.gray.opacity(0.2).ignoresSafeArea()) // Fondo gris suave fuera del contenido, solo fuera del ScrollView
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
                // Fondo gris suave
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    Text("Items Categories")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 20) {
                        ForEach(ItemCategory.allCases, id: \.self) { category in
                            NavigationLink(destination: destination(for: category)) {
                                ZStack {
                                    Color.white
                                        .cornerRadius(16)
                                        .frame(height: 160) // Hacer las tarjetas más grandes
                                    
                                    VStack {
                                        // Iconos representativos para cada categoría de ítem
                                        switch category {
                                        case .Starter:
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                                .font(.title2)
                                        case .Basic:
                                            Image(systemName: "circle.fill")
                                                .foregroundColor(.blue)
                                                .font(.title2)
                                        case .Epic:
                                            Image(systemName: "flame.fill")
                                                .foregroundColor(.red)
                                                .font(.title2)
                                        case .Legendary:
                                            Image(systemName: "crown.fill")
                                                .foregroundColor(.purple)
                                                .font(.title2)
                                        case .Utility:
                                            Image(systemName: "gearshape.fill")
                                                .foregroundColor(.green)
                                                .font(.title2)
                                        case .Boots:
                                            Image(systemName: "shoeprints.fill")
                                                .foregroundColor(.brown)
                                                .font(.title2)
                                        }
                                        
                                        Text(category.rawValue)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            .padding(.top, 8)
                                    }
                                    .padding(16)
                                }
                                .scaleEffect(0.98) // Escala sutil para el efecto de interacción
                                .animation(.spring(), value: category)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Items")
                        .font(.headline)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.black)
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
    @State private var price: String = "" // Para el precio
    @State private var background: String = "" // Para el background
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

                    // Campo de texto para el precio
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Price")
                            .font(.headline)
                        TextField("Enter item price", text: $price)
                            .keyboardType(.decimalPad)
                            .padding()
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                    }

                    // Campo de texto para el background
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Background")
                            .font(.headline)
                        TextEditor(text: $background)
                            .padding()
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                            .frame(height: 100) // Ajusta la altura según lo necesites
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
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Cierra la vista
                    }) {
                        Image(systemName: "arrow.left") // Flecha de retroceso
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
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
        guard !itemName.isEmpty, !price.isEmpty, let itemPrice = Double(price), !background.isEmpty else {
            return // Asegurarse de que los campos no estén vacíos
        }

        let newItem = Item(
            name: itemName,
            category: selectedCategory,
            attackDamage: attackDamage,
            abilityPower: abilityPower,
            armor: armor,
            magicResist: magicResist,
            price: itemPrice, // Usamos el precio ingresado
            background: background // Usamos el background ingresado
        )
        
        itemStore.addItem(newItem)
        showAlert = true
    }
    
    struct ItemListView: View {
        let title: String
        let items: [Item]
        
        var body: some View {
            List(items) { item in
                NavigationLink(destination: ItemDetailView(item: item)) {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text("AD: \(Int(item.attackDamage)), AP: \(Int(item.abilityPower)), AR: \(Int(item.armor)), MR: \(Int(item.magicResist))")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle(title)
        }
    }
    
    struct ItemDetailView: View {
        let item: Item
        
        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(item.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Category: \(item.category.rawValue)")
                        .font(.headline)
                    
                    VStack(alignment: .leading) {
                        Text("Stats:")
                            .font(.headline)
                        Text("Attack Damage: \(Int(item.attackDamage))")
                        Text("Ability Power: \(Int(item.abilityPower))")
                        Text("Armor: \(Int(item.armor))")
                        Text("Magic Resist: \(Int(item.magicResist))")
                    }
                    
                    Text("Price: \(String(format: "%.2f", item.price)) Gold")
                        .font(.headline)
                        .padding(.top)
                    
                    Text("Background:")
                        .font(.headline)
                    Text(item.background)
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .navigationTitle(item.name)
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
}
    
    #Preview {
        ItemsView()
    }

