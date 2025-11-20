//
//  BookViewController.swift
//  TabBarAssignment
//
//  Created by Zhasmin Suleimenova on 13.11.2025.
//

import UIKit

class BookViewController: UIViewController {
    
    @IBOutlet private weak var bookTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTableView.delegate = self
        bookTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension BookViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoritesData.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell
        let item = FavoritesData.books[indexPath.row]
        cell.configure(with : item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Favorite Books"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBookDetail" {
            if let detailVC = segue.destination as? BookDetailViewController,
                let indexPath = bookTableView.indexPathForSelectedRow {
                    let item = FavoritesData.books[indexPath.row]
                    detailVC.favoriteItem = item
            }
        }
    }
    
}
