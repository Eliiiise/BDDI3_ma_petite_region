//
//  HeadTableViewCell.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit

class HeadTableViewCell: UITableViewCell {


    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var nbNewsLabel: UILabel!
    @IBOutlet weak var roundedBottom: UIView!
    @IBOutlet weak var cityImageView: UIImageView!
    
    var bgColor:UIColor = UIContext.Colors.Global.annecyBGColor
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.backgroundColor = bgColor
        roundedBottom.backgroundColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(m:NewsHeadModelUI) {
        self.cityNameLabel.text = m.cityName
        self.nbNewsLabel.text = m.nbNews
        self.cityImageView.image = UIImage(named: m.imageName)
        self.roundedBottom.backgroundColor = .white
        self.roundedBottom.layer.cornerRadius = 30
        self.contentView.backgroundColor = m.backgroundColor
    }
}
