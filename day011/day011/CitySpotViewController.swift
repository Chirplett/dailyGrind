//
//  CitySpotViewController.swift
//  day011
//
//  Created by Jude Song on 7/16/25.
//

import UIKit
import Kingfisher

class CitySpotViewController: UIViewController {
    
    @IBOutlet var spotCoverImageView: UIImageView!
    @IBOutlet var spotTitleLabel: UILabel!
    @IBOutlet var spotSubtitleLabel: UILabel!
    @IBOutlet var moreSpotsButton: UIButton!
    
    var passedTravel: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "관광지 소개"
        
        let url = URL(string: passedTravel?.travel_image ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/640px-No-Image-Placeholder.svg.png")
        
        spotCoverImageView.contentMode = .scaleAspectFill
        spotCoverImageView.kf.setImage(with: url)
        spotCoverImageView.layer.cornerRadius = 10
        
        spotTitleLabel.text = passedTravel?.title
        spotTitleLabel.font = .systemFont(ofSize: 32, weight: .black)
        spotTitleLabel.textAlignment = .center
        
        spotSubtitleLabel.text = passedTravel?.subtitle
        spotSubtitleLabel.font = .systemFont(ofSize: 20, weight: .black)
        spotSubtitleLabel.numberOfLines = 0
        spotSubtitleLabel.textAlignment = .center
        
        moreSpotsButton.setTitle("다른 관광지 보러 가기", for: .normal)
        moreSpotsButton.setTitleColor(.white, for: .normal)
        moreSpotsButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        moreSpotsButton.layer.backgroundColor = UIColor.systemBlue.cgColor
        moreSpotsButton.layer.cornerRadius = moreSpotsButton.bounds.height / 2

    }
    

    @IBAction func moreSpotsButtonTapped(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
}
