//
//  CityPopularViewController.swift
//  day011
//
//  Created by Jude Song on 7/16/25.
//

import UIKit
import Kingfisher

class CityPopularViewController: UIViewController {
    
    @IBOutlet var customTableView: UITableView!
    
    var popularCityData = CityInfo().city

    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: CityPopularTableViewCell.identifier, bundle: nil)
        customTableView.register(nibName, forCellReuseIdentifier: CityPopularTableViewCell.identifier)
        
        self.navigationItem.title = "인기 도시"
        
        
    }

    
    
    
    
    
}
