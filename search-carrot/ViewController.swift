//
//  ViewController.swift
//  search-carrot
//
//  Created by Prakash Sharma on 05/08/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var dataSource = [String]()
    var currentPosition = 0
    var carrotPos = Int.random(in: 5..<36)
    var ratPos = Int.random(in: 0..<32)
    let carrot = "🥕"
    let rat = "🐱"
    let grass = "🌱"
    
    @IBOutlet weak var keyController: UIView!
    @IBOutlet weak var viewController: UICollectionView!
    
    var cv: UICollectionView?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cv = collectionView
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ImageCollectionViewCell
        let currentLabel = dataSource[currentPosition]
        currentPosition = currentPosition + 1
        if currentPosition >= dataSource.count {
            currentPosition = 0 /// Reset current counter
        }
        cell.cellLabel.text = currentLabel
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = getLabels()
    }
    
    func getLabels() -> [String] {
        
        while carrotPos == ratPos {
            // Ensure that the number is not same
            carrotPos = Int.random(in: 5..<36)
            ratPos = Int.random(in: 0..<36)
        }
        
        print(carrotPos)
        print(ratPos)
        
        var grid = [String](repeating: grass, count: 36)
        
        for i in 0..<36 {
            
            if i == carrotPos {
                grid[i] = carrot
                continue
            }
            
            if i == ratPos {
                grid[i] = rat
                continue
            }
            grid[i] = grass
        }
        
        return grid
        
    }
    
    @IBAction func upKeyAction(_ sender: UIButton) {
        let upPosition = ratPos - 6
        if upPosition >= 0 {
            dataSource[upPosition] = rat
            dataSource[ratPos] = grass
            ratPos = ratPos - 6
            cv?.reloadData()
        }
    }
    
    @IBAction func downKey(_ sender: UIButton) {
        let upPosition = ratPos + 6
        if upPosition < 36 {
            dataSource[upPosition] = rat
            dataSource[ratPos] = grass
            ratPos = ratPos + 6
            cv?.reloadData()
        }
    }
    
    @IBAction func leftKeyAction(_ sender: UIButton) {
        let upPosition = ratPos - 1
        if upPosition >= 0 {
            dataSource[upPosition] = rat
            dataSource[ratPos] = grass
            ratPos = ratPos - 1
            cv?.reloadData()
        }
    }
    
    @IBAction func rightKeyAction(_ sender: UIButton) {
        let upPosition = ratPos + 1
        if upPosition < 36 {
            dataSource[upPosition] = rat
            dataSource[ratPos] = grass
            ratPos = ratPos + 1
            cv?.reloadData()
        }
    }
}

