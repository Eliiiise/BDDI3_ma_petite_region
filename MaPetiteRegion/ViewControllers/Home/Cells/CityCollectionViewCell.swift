//
//  CityCollectionViewCell.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var nbNewsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(city:String, nbNews:String) {
        cityLabel.text = city
        nbNewsLabel.text = nbNews
        if let image = CityManager.imageBg[city] {
            imageView.image = image
        }
        
    }
}
