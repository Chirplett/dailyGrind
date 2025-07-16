//
//  CityPopularViewController.swift
//  day011
//
//  Created by Jude Song on 7/16/25.
//

import UIKit

class CityPopularViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var customTableView: UITableView!
    
    var popularCityData = CityInfo().city

    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: CityPopularTableViewCell.identifier, bundle: nil)
        customTableView.register(nibName, forCellReuseIdentifier: CityPopularTableViewCell.identifier)
        
        self.navigationItem.title = "인기 도시"
        
        customTableView.delegate = self
        customTableView.dataSource = self
        
        self.customTableView.separatorColor = .clear
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularCityData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = customTableView.dequeueReusableCell(withIdentifier: "CityPopularTableViewCell", for: indexPath) as! CityPopularTableViewCell
        
        cell.configure(city: popularCityData[indexPath.row])
    
        return cell
        
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyBoard.instantiateViewController(withIdentifier: "CityPopularDetailViewController") as! CityPopularDetailViewController
        
        viewController.linkedCityData = popularCityData[indexPath.row]
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .coverVertical
        
        present(viewController, animated: true)
        
    }
    
}
