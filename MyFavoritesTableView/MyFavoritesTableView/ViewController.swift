//
//  ViewController.swift
//  MyFavoritesTableView
//
//  Created by Zhasmin Suleimenova on 10.11.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let sections: [(title: String, items: [FavoriteItem])] = [
        ("Favorite Movies", FavoritesData.movies),
        ("Favorite Music", FavoritesData.music),
        ("Favorite Books", FavoritesData.books),
        ("Favorite Courses", FavoritesData.courses)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
            
        }
    }

    // MARK: - UITableViewDataSource
    extension ViewController: UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return sections.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return sections[section].items.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                as! FavoriteTableViewCell
            
            let item = sections[indexPath.section].items[indexPath.row]
            cell.configure(with: item)
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return sections[section].title
        }
    }

    // MARK: - UITableViewDelegate
    extension ViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let item = sections[indexPath.section].items[indexPath.row]
            print("Selected: \(item.title)")
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
