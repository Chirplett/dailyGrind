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
                    var num = i
                    var
                }
            }
         
        }
        
    }
    
    


}
