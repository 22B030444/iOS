//
//  HeroModernService.swift
//  HeroApi
//
//  Created by Zhasmin Suleimenova on 25.11.2025.
//

import Foundation
import Alamofire

protocol HeroServiceDelegate: AnyObject {
    func onHeroDidUpdate(model: HeroModel)
    func onHeroFetchFailed(error: Error)
}

class HeroModernService {
    
    weak var delegate: HeroServiceDelegate?
    
    func fetchHero() {
        let randomId = Int.random(in: 1...563)
        
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        
        AF.request(urlString).responseDecodable(of: HeroModel.self) { [weak self] response in
            switch response.result {
            case .success(let model):
                self?.delegate?.onHeroDidUpdate(model: model)
            case .failure(let error):
                self?.delegate?.onHeroFetchFailed(error: error)
                print("Error fetching hero: \(error)")
            }
        }
    }
    
    func fetchRandomHeroAsync() async throws -> HeroModel {
        let randomId = Int.random(in: 1...563)
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        
        let model = try await AF.request(urlString)
            .serializingDecodable(HeroModel.self)
            .value
        
        return model
    }
}
