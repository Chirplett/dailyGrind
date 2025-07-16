//
//  CityPopularTableViewCell.swift
//  day011
//
//  Created by Jude Song on 7/16/25.
//

import UIKit
import Kingfisher

class CityPopularTableViewCell: UITableViewCell {

    @IBOutlet var cityNamesLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityExplainBgView: UIView!
    @IBOutlet var cityExplainLabel: UILabel!
    
    static let identifier = "CityPopularTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityNamesLabel.text = ""
        cityNamesLabel.textColor = .white
        cityNamesLabel.font = .systemFont(ofSize: 20, weight: .bold)
        cityNamesLabel.textAlignment = .right
        
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = 12
        cityImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        cityImageView.clipsToBounds = true
        
        cityExplainBgView.backgroundColor = .black
        cityExplainBgView.layer.opacity = 0.7
        cityExplainBgView.layer.cornerRadius = 12
        cityExplainBgView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        cityExplainBgView.clipsToBounds = true
        
        cityExplainLabel.text = ""
        cityExplainLabel.textColor = .white
        cityExplainLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        cityExplainLabel.textAlignment = .left

        
    }
    
    func configure(city: City) {
        
        cityNamesLabel.text = city.city_name + " | " + city.city_english_name
        
        let url = URL(string: city.city_image)
        
        cityImageView.kf.setImage(with: url)
        
        cityExplainLabel.text = city.city_explain
        
        
    }

    
}
