//
//  CityPopularDetailViewController.swift
//  day011
//
//  Created by Jude Song on 7/17/25.
//

import UIKit
import Kingfisher

class CityPopularDetailViewController: UIViewController {
    
    @IBOutlet var detailCoverImageView: UIImageView!
    @IBOutlet var detailCityTitleLabel: UILabel!
    @IBOutlet var detailCityEngTitleLabel: UILabel!
    @IBOutlet var detailCityExplainLabel: UILabel!
    
    var linkedCityData: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: linkedCityData?.city_image ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/640px-No-Image-Placeholder.svg.png")
        
        detailCoverImageView.contentMode = .scaleAspectFill
        detailCoverImageView.kf.setImage(with: url)
        detailCoverImageView.layer.cornerRadius = 10
        
        detailCityTitleLabel.text = linkedCityData?.city_name
        detailCityTitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        detailCityTitleLabel.textAlignment = .center
        
        detailCityEngTitleLabel.text = linkedCityData?.city_english_name
        detailCityEngTitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        detailCityEngTitleLabel.textAlignment = .center
        
        detailCityExplainLabel.text = linkedCityData?.city_explain
        detailCityExplainLabel.font = .systemFont(ofSize: 12, weight: .regular)
        detailCityExplainLabel.numberOfLines = 0
        detailCityExplainLabel.textAlignment = .center
        
        

    }
    


}
