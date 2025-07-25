//
//  CityListTableViewController.swift
//  day011
//
//  Created by Jude Song on 7/14/25.
//

import UIKit
import Kingfisher

class CityListTableViewController: UITableViewController {
    
    let numberFormatter = NumberFormatter()
    
    var cityData = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: AdTableViewCell.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: AdTableViewCell.identifier)
        
        self.navigationItem.title = "도시 상세 정보"
        navigationItem.backButtonTitle = ""
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if cityData[indexPath.row].ad == true {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as! AdTableViewCell
            
            cell.adTextLabel.text = cityData[indexPath.row].title
            
            let bgColor: UIColor = (indexPath.row % 2 == 0) ? .systemGreen : .systemPink
            cell.adBackgroundView.layer.backgroundColor = bgColor.cgColor
    
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityRowTableViewCell", for: indexPath) as! CityRowTableViewCell
            
            let url = URL(string: cityData[indexPath.row].travel_image ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/640px-No-Image-Placeholder.svg.png")
            
            cell.titleLabel.text = cityData[indexPath.row].title
            cell.titleLabel.numberOfLines = 0
            cell.titleLabel.textAlignment = .left
            cell.titleLabel.font = .systemFont(ofSize: 18, weight: .heavy)
            
            cell.subtitleLabel.text = cityData[indexPath.row].subtitle ?? ""
            cell.subtitleLabel.numberOfLines = 0
            cell.subtitleLabel.textAlignment = .left
            cell.subtitleLabel.font = .systemFont(ofSize: 14, weight: .medium)
            cell.subtitleLabel.textColor = .gray
            
            let cityRating = cityData[indexPath.row].rating ?? 0.0
            
            if cityRating == 5.0 {
                cell.ratingAndSavesLabel.text = "★★★★★"
            } else if cityRating >= 4.0 && cityRating <= 4.9 {
                cell.ratingAndSavesLabel.text = "★★★★☆"
            } else if cityRating >= 3.0 && cityRating <= 3.9 {
                cell.ratingAndSavesLabel.text = "★★★☆☆"
            } else if cityRating >= 2.0 && cityRating <= 2.9 {
                cell.ratingAndSavesLabel.text = "★★☆☆☆"
            } else if cityRating >= 1.0 && cityRating <= 1.9 {
                cell.ratingAndSavesLabel.text = "★☆☆☆☆"
            } else {
                cell.ratingAndSavesLabel.text = "☆☆☆☆☆"
            }
            
            let citySaves = cityData[indexPath.row].saves ?? 0
            
            numberFormatter.numberStyle = .decimal
            let numberedSaves = numberFormatter.string(from: NSNumber(value: citySaves))!
            
            cell.ratingAndSavesLabel.textColor = .gray
            cell.ratingAndSavesLabel.text! += " · 저장 \(numberedSaves)"
            cell.ratingAndSavesLabel.font = .systemFont(ofSize: 12, weight: .regular)
            
            if cityData[indexPath.row].like == true {
                cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                cell.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
            cell.likeButton.tintColor = .white
            
            cell.cityThumbnailImageView.kf.setImage(with: url)
            cell.cityThumbnailImageView.contentMode = .scaleAspectFill
            cell.cityThumbnailImageView.layer.cornerRadius = 10
            
            return cell
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if cityData[indexPath.row].ad == true {
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            
            let viewController = storyBoard.instantiateViewController(withIdentifier: "AdDetailViewController") as! AdDetailViewController
            
            viewController.passedAdTitle = cityData[indexPath.row].title
            
            viewController.modalPresentationStyle = .fullScreen
            viewController.modalTransitionStyle = .coverVertical
            
            present(viewController, animated: true)
            
            
        } else {
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            
            let viewController = storyBoard.instantiateViewController(withIdentifier: "CitySpotViewController") as! CitySpotViewController
            
            viewController.passedTravel = cityData[indexPath.row]
    
            navigationController?.pushViewController(viewController, animated: true)

                        
        }
        
    }
    
}
