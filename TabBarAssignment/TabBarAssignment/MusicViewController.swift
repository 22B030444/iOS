//
//  MusicViewController.swift
//  TabBarAssignment
//
//  Created by Zhasmin Suleimenova on 13.11.2025.
//

import UIKit

class MusicViewController: UIViewController {
   
    @IBOutlet private weak var musicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicTableView.dataSource = self
        musicTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
}

extension MusicViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoritesData.music.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicTableViewCell
                
        let item = FavoritesData.music[indexPath.row]
                cell.configure(with: item)
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Favorite Musics"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMusicDetail" {
            if let detailVC = segue.destination as? MusicDetailViewController,
                let indexPath = musicTableView.indexPathForSelectedRow {
                    let item = FavoritesData.music[indexPath.row]
                    detailVC.favoriteItem = item
            }
        }
    }
}
