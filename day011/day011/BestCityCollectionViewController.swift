//
//  BestCityCollectionViewController.swift
//  day011
//
//  Created by Jude Song on 7/17/25.
//

import UIKit

class BestCityCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet var regionSegmentedControl: UISegmentedControl!
    @IBOutlet var cityCircleCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    

}
