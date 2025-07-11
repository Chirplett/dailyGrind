//
//  ShoppingSecondTableViewController.swift
//  day007hw
//
//  Created by Jude Song on 7/11/25.
//

import UIKit

class ShoppingSecondTableViewController: UITableViewController {
    
    @IBOutlet var addItemsSecondTextField: UITextField!
    @IBOutlet var addItemsSecondButton: UIButton!
    
    var itemsSecondToBuy: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "쇼핑 #2"
        
        addItemsSecondTextField.backgroundColor = .systemGray6
        addItemsSecondTextField.clipsToBounds = true
        addItemsSecondTextField.layer.cornerRadius = 8
        
        addItemsSecondButton.tintColor = .black
        addItemsSecondButton.layer.cornerRadius = 8
        addItemsSecondButton.clipsToBounds = true
        addItemsSecondButton.layer.backgroundColor = UIColor.systemGray5.cgColor
        
        
        
    }
    
    @IBAction func addSecondButtonClicked(_ sender: UIButton) {
        
        if addItemsSecondTextField.text != nil {
            addItemsSecondTextField.text?.isEmpty
        }
        
        if let text = addItemsSecondTextField.text {
            if text.isEmpty {
                print("구매할 상품을 적어야 목록에 추가할 수 있어요.")
            }
        } else {
            itemsSecondToBuy.append(addItemsSecondTextField.text!)
            tableView.reloadData()
        }
        
        guard let text = addItemsSecondTextField.text else  {
            itemsSecondToBuy.append(addItemsSecondTextField.text!)
            tableView.reloadData()
            return
        }
        
        if text.isEmpty {
            print("구매할 상품을 적어야 목록에 추가할 수 있어요.")
        }
        
        if addItemsSecondTextField.text!.isEmpty {
            print("구매할 상품을 적어야 목록에 추가할 수 있어요.")
        } else {
            itemsSecondToBuy.append(addItemsSecondTextField.text!)
            tableView.reloadData()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return itemsSecondToBuy.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemSecondCell", for: indexPath) as! ShoppingItemsTableViewCell
        
        cell.checkboxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        cell.checkboxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        
        cell.itemsSecondLabel.text = itemsSecondToBuy[indexPath.row]
        
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
        print(#function, indexPath, itemsSecondToBuy)
        
        itemsSecondToBuy.remove(at: indexPath.row)
        tableView.reloadData()
        
    }
}
