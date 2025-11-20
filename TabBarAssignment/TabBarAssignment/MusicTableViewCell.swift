//
//  MusicTableViewCell.swift
//  TabBarAssignment
//
//  Created by Zhasmin Suleimenova on 13.11.2025.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        favoriteImageView.image = UIImage(named: item.imageName)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
