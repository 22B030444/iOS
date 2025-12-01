//
//  HeroModel.swift
//  HeroApi
//
//  Created by Zhasmin Suleimenova on 25.11.2025.
//

struct HeroModel: Codable {
    let id: Int
    let name: String
    let images: HeroImageModel
    let powerstats: Powerstats
    let appearance: Appearance
    
    struct HeroImageModel: Codable {
        let xs: String?
        let sm: String?
        let md: String?
        let lg: String?
            
        var imageUrl: String {
            return md ?? lg ?? sm ?? xs ?? ""
        }
    }
    
    struct Powerstats: Codable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }
    
    struct Appearance: Codable {
        let height: [String]
        let weight: [String]
        
        var heightString: String {
            return height.count > 1 ? height[1] : height.first ?? "Unknown"
        }
               
        var weightString: String {
            return weight.count > 1 ? weight[1] : weight.first ?? "Unknown"
        }
    }
}
