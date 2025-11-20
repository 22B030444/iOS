//
//  MovieViewController.swift
//  TabBarAssignment
//
//  Created by Zhasmin Suleimenova on 13.11.2025.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet private weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
}
extension MovieViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoritesData.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
                
        let item = FavoritesData.movies[indexPath.row]
            cell.configure(with: item)
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Favorite Movies"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovieDetail" {
            if let detailVC = segue.destination as? MovieDetailViewController,
                let indexPath = movieTableView.indexPathForSelectedRow {
                    let item = FavoritesData.movies[indexPath.row]
                    detailVC.favoriteItem = item
            }
        }
    }
}
