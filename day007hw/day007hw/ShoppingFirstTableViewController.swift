//
//  ShoppingFirstTableViewController.swift
//  day007hw
//
//  Created by Jude Song on 7/11/25.
//

import UIKit

class ShoppingFirstTableViewController: UITableViewController {
    
    
    @IBOutlet var addItemsTextField: UITextField!
    
    var itemsToBuy: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "쇼핑 #1"

    
    }
    
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        
        if addItemsTextField.text!.isEmpty {
            print("구매할 상품을 적어야 목록에 추가할 수 있어요.")
        } else {
            itemsToBuy.append(addItemsTextField.text!)
            tableView.reloadData()
        }

    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return itemsToBuy.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        cell.textLabel?.text = itemsToBuy[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    

}
