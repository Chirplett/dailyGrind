//
//  AdTableViewCell.swift
//  day011
//
//  Created by Jude Song on 7/15/25.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    
    @IBOutlet var adBackgroundView: UIView!
    @IBOutlet var adTextLabel: UILabel!
    @IBOutlet var adBadgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let adBackgroundColors = []
        
        adBackgroundView.layer.cornerRadius = 10
        adBackgroundView.clipsToBounds = true
        
        adTextLabel.font = UIFont.systemFont(ofSize: 18, weight: .black)
        adTextLabel.numberOfLines = 0
        adTextLabel.textColor = .black
        adTextLabel.textAlignment = .center
        adTextLabel.text = ""
        
        adBadgeLabel.text = "AD"
        adBadgeLabel.textColor = .black
        adBadgeLabel.textAlignment = .center
        adBadgeLabel.layer.cornerRadius = 12
        
        
    }


    
}
