//
//  ViewController.swift
//  search-carrot
//
//  Created by Prakash Sharma on 05/08/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getLabels() -> [[String]] {
        let carrot = "🥕"
        let rat = "🐱" 
        let blank = "🌱"
        
        let carrotPosX = Int.random(in: 0..<7)
        let carrotPosY = Int.random(in: 0..<7)
        let catPosX = Int.random(in: 0..<7)
        let catPosY = Int.random(in: 0..<7)
        
        var grid = [[String]]()
        
        for i in 0...7 {
            for j in 0...7{
                if i == carrotPosX && j == carrotPosY {
                    grid[i][j] = carrot
                    continue
                }
                
                if i == catPosX && j==catPosY {
                    grid[i][j] = rat
                    continue
                }
                
                grid[i][j] = blank
            }
        }
        
        return grid
        
    }
}

