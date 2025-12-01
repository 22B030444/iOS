//
//  HeroStorageManager.swift
//  HeroApi
//
//  Created by Zhasmin Suleimenova on 01.12.2025.
//

import Foundation

class HeroStorageManager {
    
    static func saveHero(_ hero: HeroModel) {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(hero)
            UserDefaults.standard.set(data, forKey: "heroModel")
            print("Hero saved: \(hero.name)")
        } catch {
            print("Error saving hero: \(error)")
        }
    }
    
    static func loadHero() -> HeroModel? {
        guard let data = UserDefaults.standard.data(forKey: "heroModel") else {
            print("No saved hero found")
            return nil
        }
        do {
            let decoder = PropertyListDecoder()
            let hero = try decoder.decode(HeroModel.self, from: data)
            print("Hero loaded: \(hero.name)")
            return hero
        } catch {
            print("Error loading hero: \(error)")
            return nil
        }
    }
    
    static func clearHero() {
        UserDefaults.standard.removeObject(forKey: "heroModel")
        print("Saved hero cleared")
    }
}
