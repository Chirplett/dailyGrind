//
//  CityPopularTableViewCell.swift
//  day011
//
//  Created by Jude Song on 7/16/25.
//

import UIKit

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
        cityNamesLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        cityNamesLabel.textAlignment = .center
        
        cityImageView.contentMode = .scaleAspectFit
        cityImageView.layer.cornerRadius = 12
        cityImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        cityImageView.clipsToBounds = true
        
        cityExplainBgView.backgroundColor = .systemGray6
        cityExplainBgView.layer.opacity = 0.5
        cityExplainBgView.layer.cornerRadius = 12
        cityExplainBgView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        cityExplainBgView.clipsToBounds = true
        
        cityExplainLabel.text = ""
        cityExplainLabel.textColor = .white
        cityExplainLabel.font = .systemFont(ofSize: 12, weight: .medium)
        cityExplainLabel.textAlignment = .left

        
    }

    
}
