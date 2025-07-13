//
//  MagazineTableViewController.swift
//  day011
//
//  Created by Jude Song on 7/14/25.
//

import UIKit
import 


class MagazineTableViewController: UITableViewController {
    
    var magazineContents = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "매거진"

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return magazineContents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "eachContentCell", for: indexPath) as! MagazineTableViewCell
        
        cell.mainThumbnailImageView
        cell.mainThumbnailImageView
        
        cell.titleLabel.text = magazineContents[indexPath.row].title
        cell.titleLabel
        
        cell.subtitleLabel.text = magazineContents[indexPath.row].subtitle
        cell.subtitleLabel
        
        cell.dateLabel
        cell.dateLabel
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}
