//
//  MagazineTableViewController.swift
//  day011
//
//  Created by Jude Song on 7/14/25.
//

import UIKit
import Kingfisher


class MagazineTableViewController: UITableViewController {
    
    var magazineContents = MagazineInfo().magazine
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "SeSAC TRAVEL"

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineContents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "eachContentCell", for: indexPath) as! MagazineTableViewCell
        
        let url = URL(string: magazineContents[indexPath.row].photo_image)!
        
        
        cell.mainThumbnailImageView.kf.setImage(with: url)
        cell.mainThumbnailImageView.contentMode = .scaleAspectFill
        cell.mainThumbnailImageView.layer.cornerRadius = 10
        
        cell.titleLabel.text = magazineContents[indexPath.row].title
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.textAlignment = .left
        cell.titleLabel.font = .systemFont(ofSize: 22, weight: .black)
        
        cell.subtitleLabel.text = magazineContents[indexPath.row].subtitle
        cell.subtitleLabel.numberOfLines = 1
        cell.subtitleLabel.textAlignment = .left
        cell.subtitleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        cell.subtitleLabel.textColor = .gray
        
        dateFormatter.dateFormat = "yyMMdd"
        let currentDate = dateFormatter.date(from: magazineContents[indexPath.row].date)
        
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        let updatedDate = dateFormatter.string(from: currentDate!)
        
        cell.dateLabel.text = updatedDate
        cell.dateLabel.font = .systemFont(ofSize: 14, weight: .regular)
        cell.dateLabel.textColor = .gray
        
        return cell
        
    }
    
    

}
