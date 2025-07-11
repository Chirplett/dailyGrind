//
//  MainViewController.swift
//  day007hw
//
//  Created by Jude Song on 7/8/25.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var myNameBarButtonItem: UIBarButtonItem!
    @IBOutlet var bubbleImageView: UIImageView!
    @IBOutlet var bubbleLabel: UILabel!
    @IBOutlet var tamaFaceImageView: UIImageView!
    @IBOutlet var tamaTagLabel: UILabel!
    @IBOutlet var tamaStatusLabel: UILabel!
    @IBOutlet var howMuchRiceTextField: UITextField!
    @IBOutlet var feedRiceButton: UIButton!
    @IBOutlet var howMuchWaterTextField: UITextField!
    @IBOutlet var feedWaterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myNameBarButtonItem.image = UIImage(systemName: "person.circle")
        myNameBarButtonItem.tintColor = .systemTeal
        
        bubbleImageView.contentMode = .scaleAspectFit
        bubbleImageView.image = UIImage(named: "bubble")
        
        bubbleLabel.text = ""
        bubbleLabel.textColor = .systemTeal
        bubbleLabel.textAlignment = .center
        bubbleLabel.numberOfLines = 0
        
        tamaFaceImageView.image = UIImage._2_1
        tamaFaceImageView.contentMode = .scaleAspectFit
        
        tamaTagLabel.text = "방실방실 다마고치"
        tamaTagLabel.font = .systemFont(ofSize: 14)
        tamaTagLabel.tintColor = .systemTeal
        tamaTagLabel.textAlignment = .center
        tamaTagLabel.layer.cornerRadius = 5
        tamaTagLabel.layer.borderWidth = 1.5
        tamaTagLabel.layer.borderColor = UIColor.systemTeal.cgColor
        
        tamaStatusLabel.text = "LV1 · 밥알 0개 · 물방울 0개"
        tamaStatusLabel.font = .systemFont(ofSize: 12)
        tamaStatusLabel.textColor = .systemTeal
        tamaStatusLabel.numberOfLines = 1
        tamaStatusLabel.textAlignment = .center
        
        howMuchRiceTextField.placeholder = "밥 주세용"
        howMuchRiceTextField.text = ""
        howMuchRiceTextField.textColor = .systemTeal
        howMuchRiceTextField.keyboardType = .numberPad
        
        feedRiceButton.setImage(UIImage(systemName: "carrot.fill"), for: .normal)
        feedRiceButton.titleLabel?.font = .systemFont(ofSize: 14)
        feedRiceButton.tintColor = .systemTeal
        feedRiceButton.setTitle("밥먹기", for: .normal)
        feedRiceButton.layer.cornerRadius = 8
        feedRiceButton.layer.borderWidth = 2
        feedRiceButton.layer.borderColor = UIColor.systemTeal.cgColor
        
        howMuchWaterTextField.placeholder = "물 주세용"
        howMuchWaterTextField.text = ""
        howMuchWaterTextField.textColor = .systemTeal
        howMuchWaterTextField.keyboardType = .numberPad
        
        feedWaterButton.setImage(UIImage(systemName: "drop.fill"), for: .normal)
        feedWaterButton.titleLabel?.font = .systemFont(ofSize: 14)
        feedWaterButton.tintColor = .systemTeal
        feedWaterButton.setTitle("물먹기", for: .normal)
        feedWaterButton.layer.cornerRadius = 8
        feedWaterButton.layer.borderWidth = 2
        feedWaterButton.layer.borderColor = UIColor.systemTeal.cgColor
        
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let gotName = UserDefaults.standard.string(forKey: "myName") ?? "대장"
        
        self.navigationItem.title = "\(gotName)님의 다마고치"
        
        let bubbleMessages: [String] = ["\(gotName)님, 보고싶었어요~", "저 배고파요, \(gotName)님!", "오늘 하루 어땠어요, \(gotName)님?", "물 좀 주세요~ \(gotName)님!", "저 이제 다 큰 것 같아요, \(gotName)님!", "바깥 날씨는 어때요, \(gotName)님?", "오늘따라 아무것도 하기 싫어요, \(gotName)님"]
        
        bubbleLabel.text = bubbleMessages.randomElement()
        
    }
    
    @IBAction func dismissNumPad(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func feedRiceButtonTapped(_ sender: UIButton) {
        let riceToAdd = Int(howMuchRiceTextField.text ?? "") ?? 1
        
        if riceToAdd >= 100 || riceToAdd < 0 {
            return
        }
        
        let currentRice = UserDefaults.standard.integer(forKey: "riceCount")
        let currentWater = UserDefaults.standard.integer(forKey: "waterCount")
        
        let newRice = currentRice + riceToAdd
        let newWater = currentWater
        
        UserDefaults.standard.set(newRice, forKey: "riceCount")
        
        //레벨
        let levelCal = Double(newRice) / 5 + Double(newWater) / 2
        let intLevel = Int(levelCal)
        
        var newLevel: Int = 1
        
        if intLevel >= 100 {
            newLevel = 10
            tamaFaceImageView.image = UIImage(named: "2-9")
        } else if intLevel >= 90 {
            newLevel = 9
            tamaFaceImageView.image = UIImage(named: "2-9")
        } else if intLevel >= 80 {
            newLevel = 8
            tamaFaceImageView.image = UIImage(named: "2-8")
        } else if intLevel >= 70 {
            newLevel = 7
            tamaFaceImageView.image = UIImage(named: "2-7")
        } else if intLevel >= 60 {
            newLevel = 6
            tamaFaceImageView.image = UIImage(named: "2-6")
        } else if intLevel >= 50 {
            newLevel = 5
            tamaFaceImageView.image = UIImage(named: "2-5")
        } else if intLevel >= 40 {
            newLevel = 4
            tamaFaceImageView.image = UIImage(named: "2-4")
        } else if intLevel >= 30 {
            newLevel = 3
            tamaFaceImageView.image = UIImage(named: "2-3")
        } else if intLevel >= 20 {
            newLevel = 2
            tamaFaceImageView.image = UIImage(named: "2-2")
        } else {
            newLevel = 1
            tamaFaceImageView.image = UIImage(named: "2-1")
        }
        
        tamaStatusLabel.text = "LV\(newLevel) · 밥알 \(newRice)개 · 물방울 \(newWater)개"
        
    }
    
    
    @IBAction func feedWaterButtonTapped(_ sender: UIButton) {
        let waterToAdd = Int(howMuchWaterTextField.text ?? "") ?? 1
        
        if waterToAdd >= 50 || waterToAdd < 0 {
            return
        }
        
        let currentRice = UserDefaults.standard.integer(forKey: "riceCount")
        let currentWater = UserDefaults.standard.integer(forKey: "waterCount")
        
        let newRice = currentRice
        let newWater = currentWater + waterToAdd
        
        UserDefaults.standard.set(newWater, forKey: "waterCount")
        
        //레벨
        let levelCal = Double(newRice) / 5 + Double(newWater) / 2
        let intLevel = Int(levelCal)
        
        var newLevel: Int = 1
        
        if intLevel >= 100 {
            newLevel = 10
            tamaFaceImageView.image = UIImage(named: "2-9")
        } else if intLevel >= 90 {
            newLevel = 9
            tamaFaceImageView.image = UIImage(named: "2-9")
        } else if intLevel >= 80 {
            newLevel = 8
            tamaFaceImageView.image = UIImage(named: "2-8")
        } else if intLevel >= 70 {
            newLevel = 7
            tamaFaceImageView.image = UIImage(named: "2-7")
        } else if intLevel >= 60 {
            newLevel = 6
            tamaFaceImageView.image = UIImage(named: "2-6")
        } else if intLevel >= 50 {
            newLevel = 5
            tamaFaceImageView.image = UIImage(named: "2-5")
        } else if intLevel >= 40 {
            newLevel = 4
            tamaFaceImageView.image = UIImage(named: "2-4")
        } else if intLevel >= 30 {
            newLevel = 3
            tamaFaceImageView.image = UIImage(named: "2-3")
        } else if intLevel >= 20 {
            newLevel = 2
            tamaFaceImageView.image = UIImage(named: "2-2")
        } else {
            newLevel = 1
            tamaFaceImageView.image = UIImage(named: "2-1")
        }
        
        tamaStatusLabel.text = "LV\(newLevel) · 밥알 \(newRice)개 · 물방울 \(newWater)개"
        
    }
    


}
