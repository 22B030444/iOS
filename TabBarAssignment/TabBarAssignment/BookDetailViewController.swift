//
//  BookDetailViewController.swift
//  TabBarAssignment
//
//  Created by Zhasmin Suleimenova on 19.11.2025.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    var favoriteItem: FavoriteItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = favoriteItem {
            titleLabel.text = item.title
            subtitleLabel.text = item.subtitle
            reviewLabel.text = item.review
            imageView.image = UIImage(named: item.imageName)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
