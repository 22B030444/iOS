//
//  ViewController.swift
//  HeroApi
//
//  Created by Zhasmin Suleimenova on 25.11.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var heroImage: UIImageView!
    @IBOutlet private weak var rollButton: UIButton!
    @IBOutlet private weak var heroHeight: UILabel!
    @IBOutlet private weak var heroWeight: UILabel!
    
    @IBOutlet private weak var intelligenceBar: UIProgressView!
    @IBOutlet private weak var strengthBar: UIProgressView!
    @IBOutlet private weak var speedBar: UIProgressView!
    @IBOutlet private weak var durabilityBar: UIProgressView!
    @IBOutlet private weak var powerBar: UIProgressView!
    @IBOutlet private weak var combatBar: UIProgressView!
        
    @IBOutlet private weak var intelligenceLabel: UILabel!
    @IBOutlet private weak var strengthLabel: UILabel!
    @IBOutlet private weak var speedLabel: UILabel!
    @IBOutlet private weak var durabilityLabel: UILabel!
    @IBOutlet private weak var powerLabel: UILabel!
    @IBOutlet private weak var combatLabel: UILabel!
    
    @IBOutlet private weak var intelligenceValueLabel: UILabel!
    @IBOutlet private weak var strengthValueLabel: UILabel!
    @IBOutlet private weak var speedValueLabel: UILabel!
    @IBOutlet private weak var durabilityValueLabel: UILabel!
    @IBOutlet private weak var powerValueLabel: UILabel!
    @IBOutlet private weak var combatValueLabel: UILabel!
    
    var service = HeroModernService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rollButton.layer.cornerRadius = 15
        rollButton.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    @IBAction private func rollTap(_ sender: Any) {
        rollButton.isEnabled = false
        
        let randomId = Int.random(in: 1...563)
        
        Task { @MainActor in
            do {
                let model = try await service.fetchHero(by: randomId)
                configureHero(with: model)
                rollButton.isEnabled = true
            } catch {
                print("Ошибка загрузки героя: \(error)")
                heroName.text = "Ошибка загрузки"
                heroImage.image = UIImage(systemName: "exclamationmark.circle")
                rollButton.isEnabled = true
            }
        }
    }


    private func configureHero(with model: HeroModel){
        heroName.text = model.name
           
        if let imageUrl = URL(string: model.images.imageUrl) {
            heroImage.kf.setImage(with: imageUrl)
        } else {
            heroImage.image = UIImage(systemName: "photo")
        }
        
        let appearance = model.appearance
        
        heroHeight.text = "Height: \(appearance.heightString)"
        heroWeight.text = "Weight: \(appearance.weightString)"
        
        let stats = model.powerstats
               
        intelligenceLabel.text = "Intelligence"
        intelligenceValueLabel.text = "\(stats.intelligence)"
        intelligenceBar.progress = Float(stats.intelligence) / 100.0
        
        strengthLabel.text = "Strength"
        strengthValueLabel.text = "\(stats.strength)"
        strengthBar.progress = Float(stats.strength) / 100.0
            
        speedLabel.text = "Speed"
        speedValueLabel.text = "\(stats.speed)"
        speedBar.progress = Float(stats.speed) / 100.0
            
        durabilityLabel.text = "Durability"
        durabilityValueLabel.text = "\(stats.durability)"
        durabilityBar.progress = Float(stats.durability) / 100.0
            
        powerLabel.text = "Power"
        powerValueLabel.text = "\(stats.power)"
        powerBar.progress = Float(stats.power) / 100.0
            
        combatLabel.text = "Combat"
        combatValueLabel.text = "\(stats.combat)"
        combatBar.progress = Float(stats.combat) / 100.0
        
    }
}

