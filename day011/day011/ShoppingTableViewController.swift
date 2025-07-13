//
//  ShoppingTableViewController.swift
//  day011
//
//  Created by Jude Song on 7/14/25.
//

import UIKit

struct ShoppingItem {
    
    let name: String
    let isStarred: Bool
    let isChecked: Bool
    
}

class ShoppingTableViewController: UITableViewController {
  
    @IBOutlet var addItemsTextField: UITextField!
    @IBOutlet var addItemsButton: UIButton!
    
    var itemsToBuy: [ShoppingItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "쇼핑"
        
        addItemsTextField.backgroundColor = .systemGray6
        addItemsTextField.clipsToBounds = true
        addItemsTextField.layer.cornerRadius = 8
        
        addItemsButton.tintColor = .black
        addItemsButton.layer.cornerRadius = 8
        addItemsButton.clipsToBounds = true
        addItemsButton.layer.backgroundColor = UIColor.systemGray5.cgColor
        
        
        
    }
    
    @IBAction func addItemsButtonClicked(_ sender: UIButton) {
        
        if let text = addItemsTextField.text, !text.isEmpty {
            itemsToBuy.append(ShoppingItem(name: text, isStarred: false, isChecked: false))
            tableView.reloadData()
        } else {
            print("textfield의 값이 옵셔널이거나 비어 있음")
            return
        }

        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return itemsToBuy.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ShoppingItemTableViewCell
        
        cell.checkboxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        cell.checkboxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        
        cell.itemsLabel.text = itemsToBuy[indexPath.row].name
        
        cell.addStarButton.setImage(UIImage(systemName: "star"), for: .normal)
        cell.addStarButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
        
        cell.backgroundColor = .systemGray6
        cell.tintColor = .black
        
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath, itemsToBuy)
        
        itemsToBuy.remove(at: indexPath.row)
        tableView.reloadData()
        
    }
}
