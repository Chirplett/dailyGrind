//
//  Game369ViewController.swift
//  day011
//
//  Created by Jude Song on 7/14/25.
//

import UIKit

class Game369ViewController: UIViewController {
    
    @IBOutlet var putNumberTextField: UITextField!
    @IBOutlet var showNumbersTextView: UITextView!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        putNumberTextField.text = ""
        putNumberTextField.placeholder = "최대 숫자를 입력해주세요"
        putNumberTextField.keyboardType = .default
        putNumberTextField.borderStyle = .bezel
        putNumberTextField.layer.borderWidth = 3
        putNumberTextField.layer.borderColor = UIColor.systemGray5.cgColor
        putNumberTextField.layer.cornerRadius = 5
        putNumberTextField.font = UIFont.systemFont(ofSize: 16)
        
        showNumbersTextView.text = ""
        
        

    }
    
    @IBAction func returnButtonTapped(_ sender: UITextField) {
        
        if let typedText = putNumberTextField.text, !typedText.isEmpty,
            let finalNumber = Int(typedText) {
                
                var resultText = ""
                var clapCount = 0
                
                for i in 1...finalNumber {
                    let numbersinText = String(i)
                    var middleText = ""
                    
                    for eachNumber in numbersinText {
                        if eachNumber == "3" || eachNumber == "6" || eachNumber == "9" {
                            middleText += "👏"
                            clapCount += 1
                        } else {
                            middleText += String(eachNumber)
                        }
                    }
                    
                    resultText += middleText
                    
// 369 들어가면 다 박수 처리
//                    if numbersinText.contains("3") || numbersinText.contains("6") || numbersinText.contains("9") {
//                        resultText += "👏"
//                        clapCount += 1
//                    } else {
//                        resultText += "\(i)"
//                    }
                    
                    if i != finalNumber {
                        resultText += ", "
                    }
            }
            
            showNumbersTextView.text = resultText
            resultLabel.text = "숫자 \(finalNumber)까지 총 박수는 \(clapCount)번입니다."
         
        }
        
    }
    
    


}
