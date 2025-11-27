//
//  HeroModernService.swift
//  HeroApi
//
//  Created by Zhasmin Suleimenova on 25.11.2025.
//

import Foundation

struct HeroModernService {
    func fetchHero(by id: Int) async throws -> HeroModel {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decodedModel = try JSONDecoder().decode(HeroModel.self, from: data)
        return decodedModel
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}
