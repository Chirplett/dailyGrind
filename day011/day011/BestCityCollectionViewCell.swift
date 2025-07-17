//
//  BestCityCollectionViewCell.swift
//  day011
//
//  Created by Jude Song on 7/17/25.
//

import UIKit
import Kingfisher

class BestCityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var bestCityImageView: UIImageView!
    @IBOutlet var bestCityNameLabel: UILabel!
    @IBOutlet var bestCityExplainLabel: UILabel!
    
    static let identifier = "BestCityCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bestCityImageView.contentMode = .scaleAspectFill
        
        bestCityNameLabel.textAlignment = .center
        bestCityNameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        bestCityExplainLabel.textAlignment = .center
        bestCityExplainLabel.font = .systemFont(ofSize: 12, weight: .regular)
        bestCityExplainLabel.numberOfLines = 0
        bestCityExplainLabel.textColor = .gray
        
    }
    
    func configure(city: City) {
        
        let url = URL(string: city.city_image)
        
        bestCityImageView.kf.setImage(with: url)
  
        bestCityNameLabel.text = city.city_name + " | " + city.city_english_name
        
        bestCityExplainLabel.text = city.city_explain
        
    }
    

}
