//
//  AdDetailViewController.swift
//  day011
//
//  Created by Jude Song on 7/16/25.
//

import UIKit

class AdDetailViewController: UIViewController {

    @IBOutlet var closeButton: UIButton!
    @IBOutlet var adTextLabel: UILabel!
    
    var passedAdTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .black
        
        adTextLabel.text = passedAdTitle
        adTextLabel.font = .systemFont(ofSize: 20, weight: .black)
        adTextLabel.numberOfLines = 0
        adTextLabel.textAlignment = .center

        
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true)
        
    }
    
    

}
