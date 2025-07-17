//
//  BestCityCollectionViewCell.swift
//  day011
//
//  Created by Jude Song on 7/17/25.
//

import UIKit

class BestCityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cityPicImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityPicImageView.contentMode = .scaleAspectFill
        
        cityNameLabel.textAlignment = .center
        cityNameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        cityExplainLabel.textAlignment = .center
        cityExplainLabel.font = .systemFont(ofSize: 12, weight: .regular)
        cityExplainLabel.numberOfLines = 0
        cityExplainLabel.textColor = .systemGray6
        
    }

}
