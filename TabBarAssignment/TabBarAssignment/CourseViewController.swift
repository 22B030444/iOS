//
//  CourseViewController.swift
//  TabBarAssignment
//
//  Created by Zhasmin Suleimenova on 13.11.2025.
//

import UIKit

class CourseViewController: UIViewController {
    
    @IBOutlet private weak var courseTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        courseTableView.dataSource = self
        courseTableView.delegate = self
        // Do any additional setup after loading the view.
    }

}

extension CourseViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoritesData.courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath) as! CourseTableViewCell
        let item = FavoritesData.courses[indexPath.row]
        cell.configure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Favorite Courses"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCourseDetail" {
            if let detailVC = segue.destination as? CourseDetailViewController,
                let indexPath = courseTableView.indexPathForSelectedRow {
                    let item = FavoritesData.courses[indexPath.row]
                    detailVC.favoriteItem = item
            }
        }
    }
}
