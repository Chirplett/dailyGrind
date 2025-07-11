//
//  MyNameViewController.swift
//  day007hw
//
//  Created by Jude Song on 7/8/25.
//

import UIKit

class MyNameViewController: UIViewController {

    @IBOutlet var saveNameBarButtonItem: UIBarButtonItem!
    @IBOutlet var putNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(UserDefaults.standard.string(forKey: "myName") ?? "대장")님 이름 정하기"
 
        saveNameBarButtonItem.tintColor = .black
        saveNameBarButtonItem.title = "저장"
        
        putNameTextField.text = ""
        putNameTextField.keyboardType = .default
        putNameTextField.textColor = .black
        

    }
    

    @IBAction func saveNameBarButtonTapped(_ sender: UIBarButtonItem) {

        if let name = putNameTextField.text {
            name.count >= 2 && name.count <= 6
            
            UserDefaults.standard.set(name, forKey: "myName")
            
            self.title = "\(UserDefaults.standard.string(forKey: "myName") ?? "대장")님 이름 정하기"
        } else {
            return
        }
       
        
//        let newName = putNameTextField.text
//        if newName == nil || newName!.count < 2 || newName!.count > 6 {
//            return
//        }
        
        
        
        
    }
    

}
