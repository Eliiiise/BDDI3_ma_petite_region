//
//  MeteoCollectionViewCell.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import UIKit

class MeteoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(temp:String, wheather:String, descritpitonWheather:String) {
        tempLabel.text = "\(temp)°"
        descriptionLabel.text = descritpitonWheather
        
        if wheather == "Clear" {
            imageView.image = UIImage(named: "meteo_sunny_bg")
        } else {
            imageView.image = UIImage(named: "meteo_bg")
        }
    }
}
