//
//  BestCityCollectionViewController.swift
//  day011
//
//  Created by Jude Song on 7/17/25.
//

import UIKit
import Kingfisher

class BestCityCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var regionSegmentedControl: UISegmentedControl!
    @IBOutlet var bestCityCircleCollectionView: UICollectionView!
    
    var bestCityData = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "인기 도시"
        
        let xib = UINib(nibName: "BestCityCollectionViewCell", bundle: nil)
        
        bestCityCircleCollectionView.register(xib, forCellWithReuseIdentifier: BestCityCollectionViewCell.identifier)
        
        bestCityCircleCollectionView.delegate = self
        bestCityCircleCollectionView.dataSource = self
        
        
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (16 * 2) - (14 * 1)
        
        layout.itemSize = CGSize(width: cellWidth/2, height: cellWidth/2*1.5)
        
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumInteritemSpacing = 14
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        
        bestCityCircleCollectionView.collectionViewLayout = layout

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestCityData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestCityCollectionViewCell.identifier, for: indexPath) as! BestCityCollectionViewCell
        
        cell.configure(city: bestCityData[indexPath.item])
        
        cell.bestCityImageView.layer.cornerRadius = cell.bounds.width/2
        cell.bestCityImageView.clipsToBounds = true
        
//        cell.backgroundColor = .yellow
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyBoard.instantiateViewController(withIdentifier: "CityPopularDetailViewController") as! CityPopularDetailViewController
        
        viewController.linkedCityData = bestCityData[indexPath.item]
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @IBAction func regionSegmentedControlTapped(_ sender: UISegmentedControl) {
        
        bestCityData = CityInfo().city
        
        if sender.selectedSegmentIndex == 0 {
            
            bestCityCircleCollectionView.reloadData()
            
        } else if sender.selectedSegmentIndex == 1 {
            
            var filter: [City] = []
    
            for item in bestCityData {
                if item.domestic_travel == true {
                    filter.append(item)
                }
            }
            
            bestCityData = filter
            bestCityCircleCollectionView.reloadData()
            
        } else if sender.selectedSegmentIndex == 2 {
            
            var filter: [City] = []
            
            for item in bestCityData {
                
                if item.domestic_travel == false {
                    filter.append(item)
                }
            }
            
            bestCityData = filter
            bestCityCircleCollectionView.reloadData()

            
        }
        
    }
    
}
