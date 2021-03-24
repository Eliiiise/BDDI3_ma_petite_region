//
//  ParamCollectionViewCell.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import UIKit

class ParamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var switchModel: UISwitch!
    
    var actionOnSwitchChanged:((Bool) -> ())?
    
    func setup(model:SettingsModelUI) {
        self.selectionStyle = .none
        cityNameLabel.text = model.cityName
        switchModel.isOn = model.cityBool
    }
    
    @IBAction func switchValueChanged(_ sender: Any) {
        
        if let action = actionOnSwitchChanged {
            action(switchModel.isOn)
        }
    }
}
