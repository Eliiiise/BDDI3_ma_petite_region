//
//  SettingsHeadCollectionViewCell.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import UIKit

class SettingsHeadTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rounedBottomView: UIView!
    
    func setup() {
        self.selectionStyle = .none
        self.backgroundColor = UIContext.Colors.Settings.headerBGColor
        rounedBottomView.layer.cornerRadius = 30
    }
}
